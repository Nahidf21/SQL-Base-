create database store;

use store;

create table product (
Product_id char(20) not null primary key,
name varchar(40) not null,
price int not null
);

create table customer (
customer_id char(20) not null,
customer_name varchar(30) not null,
customer_age int,
primary key (customer_id)
 );
 
 insert into product ( Product_id, name, price)
 values 
 ('A123', 'Iphone', 1200),
 ('A124', 'Samsung', 1100),
 ('A125', 'Motorola', 1000),
 ('A126', 'Tesla', 1400),
 ('A127', 'Google', 1200)
 ;
 
 insert into customer ( customer_id, customer_name, customer_age)
 values
 ( 'C1234','Nahid',32),
 ( 'C1235', 'Ferdous',33),
 ( 'C1236', 'Marzia',31),
 ( 'C1237', 'Khan',30)
 ;
 
 create table sell (
 S_id char(20) not null,
 product_id char(20),
 customer_id char(20),
 primary key (S_id),
 foreign key (product_id) references product (product_id),
 foreign key (customer_id) references customer (customer_id)
 );
 
 insert into sell ( S_id, product_id, customer_id)
 values
 ('S1234','A123','C1234'),
 ('S1235','A124','C1235'),
 ('S1236','A126','C1234'),
 ('S1237','A123','C1237'),
 ('S1238','A125','C1236')
 ;
 
 select * from customer;
 select * from product;
 select * from sell;
 
 select S_id, name , price from 
 sell as s join product as p
 on s.Product_id = p.Product_id;
 
 select name , sum(price) from 
 sell as s join product as p
 on s.Product_id = p.Product_id
 group by name;
 



CREATE VIEW sell_price AS 
SELECT 
    s.S_id, 
    p.name, 
    p.price, 
    CASE 
        WHEN p.price >= 1200 THEN 'Prime' 
        ELSE 'Regular' 
    END AS Customer_type, 
    c.customer_name
FROM 
    sell AS s 
JOIN 
    product AS p ON s.product_id = p.product_id 
JOIN 
    customer AS c ON c.customer_id = s.customer_id;
 
select * from sell_price;


-- Unsold prodects -- 

select name, price, s_id from 
product as p  right join
sell as s on p.product_id = s.product_id;



select * from sell_price;

select * from sell_price 
where customer_name like '%N%';

select * from sell_price 
order by  price asc;

select s_id, name , 
case 
when name in ('Motorola','Samsung') then 'China'
else 'USA'
end as Country 
from sell_price;

 
select count( distinct(name)) from sell_price;
select distinct(name) from sell_price;
select distinct(price) from sell_price;

 select * from customer;
 select * from product;
 select * from sell;

use sakila;

select * from actor;
select * from address;

alter table address
drop column address2;

select * from address;

create view address_v as 
select address_id, address, district, city_id, postal_code, phone from address;

select * from address_v;

select address_id from address_v
where phone is null or phone = '';

select length(phone), phone from address_v;

select count(*) from address_v 
where length(phone) = 12 ;

select * from city;
select * from category;
select * from film_category;
select * from film;

select name, count(title) as total_film from 
category c join film_category fc
on c.category_id = fc.category_id
join film as f
on f.film_id = fc.film_id
-- where total_film > 60
group by name
having total_film >60
order by total_film;


