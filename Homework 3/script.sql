\c demo


select * from flights where departure_airport='KZN' and arrival_airport='MQF';


select * from flights where (departure_airport = 'DME' or departure_airport = 'VKO' or departure_airport = 'SVO') and scheduled_departure between '2017-07-16 09:05:00+03' and '2017-07-16 09:20:00+03';


select * from flights f join airports_data air on (f.arrival_airport=air.airport_code or f.departure_airport=air.airport_code)
where (departure_airport in (select airport_code from airports_data where timezone='Asia/Yekaterinburg')
and arrival_airport in (select airport_code from airports_data where timezone='Asia/Yekaterinburg'));
