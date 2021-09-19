import json
from classes import *

clients = [Client('Вася Пупкин', 572456751358), Client('Коля Сидоров', 245612365712)]

drivers = [Driver('Пётр Потапов', 'Kia K5', 87642, 9.6),
           Driver('Игнат Савельев', 'Lada Granta', 76450, 9.4)]

rates = [Rate(150, drivers[1].car, drivers[1]),
         Rate(300, drivers[0].car, drivers[0])]

orders = [Order('ул. Мира, 48', '25.08.21', '14.32', drivers[0], clients[0], rates[1]),
          Order('пр. Победы, 19', '24.06.21', '8.17', drivers[1], clients[0], rates[0]),
          Order('ул. Охотный ряд, 15', '15.09.21', '11.08', drivers[0], clients[1], rates[1]),
          Order('ул. Моховая, 7', '13.09.21', '21.54', drivers[1], clients[1], rates[0])]

db = {
    'clients': list(client.__dict__ for client in clients),

    'drivers': list(driver.__dict__ for driver in drivers),

    'rate': list({
        'price': rate.price,
        'cars': rate.cars,
        'drivers': {'name': rate.drivers.name,
                    'car': rate.drivers.car,
                    'balance': rate.drivers.balance,
                    'rating': rate.drivers.rating}
        } for rate in rates),

    'order': list({
        'coord': order.coord,
        'date': order.date,
        'lead_time': order.lead_time,
        'driver': {'name': order.driver.name,
                   'car': order.driver.car,
                   'balance': order.driver.balance,
                   'rating': order.driver.rating},
        'client': {'name': order.client.name,
                   'credit_card': order.client.credit_card}
        } for order in orders)
}

data = {'db': db}
print(data)
with open('./data.json', 'w', encoding='UTF-8') as f:
    json.dump(data, f)