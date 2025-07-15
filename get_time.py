import datetime
import json

now = datetime.datetime.now()
output = {"hour": str(now.hour)}
print(json.dumps(output))