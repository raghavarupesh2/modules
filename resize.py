import os
import yaml

# Print the environment variable for debug
print("GITHUB_EVENT_SCHEDULE:", os.environ.get('GITHUB_EVENT_SCHEDULE'))

with open('resize_schedule.yaml', 'r') as f:
    schedule = yaml.safe_load(f)

current_cron = os.environ.get('GITHUB_EVENT_SCHEDULE', '')

any_matched = False
for vm_name, vm in schedule['vms'].items():
    print(f"Checking VM: {vm_name}")
    print(f"  up_cron:   {vm['up_cron']}")
    print(f"  down_cron: {vm['down_cron']}")

    if current_cron == vm['up_cron']:
        vm_size = vm['new_size']
        print(f"  Matched up_cron. Will set size = {vm_size}")
    elif current_cron == vm['down_cron']:
        vm_size = vm['old_size']
        print(f"  Matched down_cron. Will set size = {vm_size}")
    else:
        print("  No match, skipping.")
        continue

    any_matched = True
    tfvars_file = vm['tfvars_path']
    print(f"  Updating {tfvars_file}...")

    updated_lines = []
    in_block = False
    match_name = f'"{vm_name}"'
    changed = False
    with open(tfvars_file, 'r') as f:
        for line in f:
            # Detect start of the VM block
            if line.strip().startswith(match_name + " = {"):
                in_block = True
                updated_lines.append(line)
                continue
            # Detect end of the VM block
            if in_block and line.strip() == "}":
                in_block = False
                updated_lines.append(line)
                continue
            # If inside the block, update vm_size
            if in_block and line.strip().startswith("vm_size"):
                updated_lines.append(f'    vm_size = "{vm_size}"\n')
                changed = True
                print(f"    Updated vm_size line to: vm_size = \"{vm_size}\"")
            else:
                updated_lines.append(line)
    # Write back the updated file
    with open(tfvars_file, 'w') as f:
        f.writelines(updated_lines)
    if changed:
        print(f"  Updated size for {vm_name} in {tfvars_file} to {vm_size}")
    else:
        print(f"  Warning: No vm_size line found for {vm_name}, nothing changed in {tfvars_file}")

if not any_matched:
    print("No VMs matched the current cron. No files were updated.")
