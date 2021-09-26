-- Database: homework2

-- DROP DATABASE homework2;

CREATE DATABASE homework2
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'Russian_Russia.1251'
    LC_CTYPE = 'Russian_Russia.1251'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;


create table clients (Id serial not null primary key, Name varchar, Credit_card varchar(12));

insert into clients (Name, CreditCard) values ('Mikhail', '410754699015');
insert into clients (Name, CreditCard) values ('Gleb', '456123789420');
insert into clients (Name, CreditCard) values ('Kristina', '345013607894');
insert into clients (Name, CreditCard) values ('Valeriya', '154672300487');
insert into clients (Name, CreditCard) values ('Vladislav', '653971540381');
insert into clients (Name, CreditCard) values ('Aleksandr', '267514930206');
insert into clients (Name, CreditCard) values ('Alina', '751079836488');
insert into clients (Name, CreditCard) values ('Petya', '786154934518');
insert into clients (Name, CreditCard) values ('Vova', '124378594572');
insert into clients (Name, CreditCard) values ('Andrei', '751649040636');



create table rate (Price smallint, Rate_id smallint not null primary key);
insert into rate (Price, Rate_id) values (120, 3);
insert into rate (Price, Rate_id) values (230, 2);
insert into rate (Price, Rate_id) values (360, 1);



create table cars (NameCar varchar not null primary key, Rate smallint not null references rate(Rate_id));
insert into cars (NameCar, Rate) values ('Kia K5', 3);
insert into cars (NameCar, Rate) values ('Toyota Camry', 1);
insert into cars (NameCar, Rate) values ('Hyundai Solaris', 3);
insert into cars (NameCar, Rate) values ('Skoda Rapid', 2);
insert into cars (NameCar, Rate) values ('Skoda Octavia', 2);
insert into cars (NameCar, Rate) values ('Lada Granta', 3);
insert into cars (NameCar, Rate) values ('Lada Largus', 3);
insert into cars (NameCar, Rate) values ('Renault Logan', 3);
insert into cars (NameCar, Rate) values ('Kia Rio', 3);
insert into cars (NameCar, Rate) values ('Lada Vesta', 3);



create table drivers (Id serial not null primary key, Name varchar, Car varchar not null references cars(NameCar), Balance integer, Rating real);
insert into drivers (Name, Car, Balance, Rating) values ('Ali', 'Lada Granta', 103486, 8.9);
insert into drivers (Name, Car, Balance, Rating) values ('Arthur', 'Hyundai Solaris', 94357, 9.3);
insert into drivers (Name, Car, Balance, Rating) values ('Timur', 'Toyota Camry', 114035, 9.9);
insert into drivers (Name, Car, Balance, Rating) values ('Amir', 'Kia Rio', 68679, 9.4);
insert into drivers (Name, Car, Balance, Rating) values ('Denis', 'Skoda Octavia', 89706, 8.7);
insert into drivers (Name, Car, Balance, Rating) values ('Abdul', 'Kia Rio', 64573, 9.2);
insert into drivers (Name, Car, Balance, Rating) values ('Rishat', 'Lada Largus', 56794, 9.7);
insert into drivers (Name, Car, Balance, Rating) values ('Mariya', 'Skoda Rapid', 58479, 9.9);
insert into drivers (Name, Car, Balance, Rating) values ('Alexey', 'Renault Logan', 76384, 9.6);
insert into drivers (Name, Car, Balance, Rating) values ('Arkadiy', 'Kia K5', 89046, 9.8);




create table trip (Coords_from varchar, Coords_to varchar, client integer not null references clients(Id), driver integer not null references drivers(Id), tariff smallint references rate(rate_id), date_of_departure timestamp without time zone, date_of_arrival timestamp without time zone);
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ул. Вишневского 43','Казань, ТРК "Кольцо"', 2, 3, 1, '2021-09-23 09:37:34', '2021-09-23 09:54:41');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ст. Проспект Победы', 'Казань, ж.м. Дербышки', 4, 1, 3, '2021-09-22 17:25:09', '2021-09-22 18:02:13');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, Деревня Универсиады 5', 'Казань, ул. Кремлёвская 35', 9, 6, 3, '2021-09-08 07:46:16', '2021-09-08 08:12:47');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ул. Вахитова 13','Казань, ул. Парина 10', 6, 2, 3, '2021-09-18 15:46:34', '2021-09-18 15:13:23');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, 1-й ЖД Вокзал', 'Казань, деревня Универсиады 5', 1, 7, 3, '2021-08-28 02:03:40', '2021-08-28 02:34:43');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ул. Чернышевского 14', 'Казань, Аэропорт', 3, 4, 2, '2021-09-04 04:02:40', '2021-09-04 04:43:15');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ул. Хусаина Мавлютова 42','Казань, ТРЦ "Мега"', 5, 9, 3, '2021-09-25 13:37:21', '2021-09-23 14:01:18');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, пр-т Хусаина Ямашева 58','Казань, ул. Гаврилова 13', 10, 8, 3, '2021-08-24 23:53:06', '2021-08-25 00:27:17');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ул. Волачевская 14','Казань, Аквапарк "Ривьера"', 7, 5, 2,'2021-09-12 11:43:54', '2021-09-12 12:36:04');
insert into trip (Coords_from, Coords_to, client, driver, tariff, date_of_departure, date_of_arrival) values ('Казань, ТЦ "Парк Хаус"','Казань, ул. Туполева 17', 8, 10, 2,'2021-09-10 19:58:26', '2021-09-10 20:59:04');

