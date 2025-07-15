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
    vm_type = vm_name.split('-')[-1]  # 'linux' or 'windows'
    key = f"{vm_type}_vm_size"

    with open(tfvars_file, 'r') as f:
        lines = f.readlines()
    with open(tfvars_file, 'w') as f:
        for line in lines:
            if line.strip().startswith(f"{key}"):
                f.write(f'{key} = "{vm_size}"\n')
            else:
                f.write(line)
