class Client:
    def __init__(self, name, credit_card):
        self.name = name
        self.credit_card = credit_card

class Driver:
    def __init__(self, name, car, balance, rating):
        self.name = name
        self.car = car
        self.balance = balance
        self.rating = rating

class Rate:
    def __init__(self, price, cars, drivers):
        self.price = price
        self.cars = cars
        self.drivers = drivers

class Order:
    def __init__(self, coord, date, lead_time, driver, client, rate):
        self.coord = coord
        self.date = date
        self.lead_time = lead_time
        self.driver = driver
        self.client = client
        self.rate = rate