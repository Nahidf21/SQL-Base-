create table customers(
Id INT not null,
Name varchar(20) Not null,
Age INT not null,
Address char(25),
Orders varchar(155),
primary key (Id)
);

create table orders(
Orders varchar(155) not null,
Orders_name character (20) not null,
Orders_Quentity int,
primary key (Orders) 
);


insert into customers ( Id, Name, Age, Address, Orders)
values
(1,'Nahid',32, 'Tomball , TX','A1123'),
(2,'Ferdous',31, 'Houston , TX','A1124'),
(3,'Marzia',31, 'Keyty , TX','A1125'),
(4,'Kahn',31, 'Houston , TX','A1126')
;

insert into Orders ( Orders, Orders_name, Orders_Quentity)
values
(1123, 'Phone',1),
(1124, 'Laptop',2),
(1125, 'Laptop',1),
(1126, 'PC',3)
;


select * from customers;
select * from orders;

