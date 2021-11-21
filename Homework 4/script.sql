create database homework;

\c homework

create table hotel (hotel_id int primary key,
    name varchar(20) not null,
    address varchar not null,
    category varchar(20) not null);

create table room (room_id int primary key,
    number int not null,
    count_places int not null,
    category varchar(20) not null,
    hotel_id int references hotel(hotel_id)
);


create table position (position_id int primary key,
    name varchar(15) not null);
					      			
create table staffer (staffer_id int primary key,
    name varchar(20) not null,
    salary int not null,
    position_id int  references position(position_id),
    hotel_id int references hotel(hotel_id)
);

create table clean (clean_id int primary key,
    clean_time time not null,
    staffer_id int references staffer(staffer_id),
    room_id int references room(room_id)
);

create table guest (guest_id int primary key,
    name varchar(20) not null,
    docs varchar(50) not null,
    contacts varchar(50) not null
);

create table living (living_id int primary key,
    period timestamp not null,
    payment int not null,
    guest_id int references guest(guest_id),
    room_id int references room(room_id)
);

