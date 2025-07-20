import os
import yaml

with open('resize_schedule.yaml', 'r') as f:
    schedule = yaml.safe_load(f)

current_cron = os.environ.get('GITHUB_EVENT_SCHEDULE', '')

for vm_name, vm in schedule['vms'].items():
    if current_cron == vm['up_cron']:
        vm_size = vm['new_size']
    elif current_cron == vm['down_cron']:
        vm_size = vm['old_size']
    else:
        continue

    tfvars_file = vm['tfvars_path']
    updated_lines = []
    in_block = False
    match_name = f'"{vm_name}"'
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
            else:
                updated_lines.append(line)
    # Write back the updated file
    with open(tfvars_file, 'w') as f:
        f.writelines(updated_lines)
