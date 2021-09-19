import json

with open('data.json', 'r') as f:
    data = json.load(f)

name = input('Name of client: ')
finding_date = input('Date of order: ')
result = []

for order in data['db']['order']:
    if (order['client']['name'] == name) and (order['date'] == finding_date):
        result.append(order)

print(result)