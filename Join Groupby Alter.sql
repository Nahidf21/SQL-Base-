create database book_store;
use book_store;
create table Publisher (
Pub_id int not null primary key,
Pub_Name varchar(50) not null,
Pub_Address varchar(50));

-- drop table Publisher;
create table Books (
Books_id int not null primary key,
Book_name char(30),
Price int,
Author_id char(20),
Pub_id int);
-- drop table Books;

create table Author (
Author_id char(20) not null primary key,
First_name varchar(30),
Last_name varchar(30),
Age int);

-- drop table Author;
insert into Publisher ( Pub_id, Pub_Name, Pub_Address)
values
(1,'Publisher_1','Dhaka'),
(2,'Publisher_2','Chittageon'),
(3,'Publisher_3','Thakurgaon'),
(4,'Publisher_4','Dhaka'),
(5,'Publisher_5','Chittaheon'),
(6,'Publisher_6','Thakurgaon'),
(7,'Publisher_7','Houston')
;

insert into Books (Books_id, Book_name, Price, Pub_id, Author_id )
values 
(1,'Book_1',25,2, 'A3'),
(2,'Book_2',21, 1, 'A2'),
(3,'Book_3',27, 3, 'A1'),
(4,'Book_4',31, 4, 'A3'),
(5,'Book_5',30, 5, 'A2'),
(6,'Book_3',27, 3, 'A1')
;

drop table Books;
insert into Author ( Author_id, First_name, Last_name, Age)
values 
('A1','Nahid','Ferdous',32),
('A2','Marzia','Khan',30),
('A3','Ferdous','Khan',12)
;

alter table Author
rename column First_name to Author_first_name;
alter table Author
rename column Last_name to Author_Last_name;


select * from Author;
select * from books;

select * from 
publisher as p  inner join books as b
on p.Pub_id = b.Pub_id
where p.pub_id in (1,3,4);

select Book_Name, sum(price), count(price), count(Book_name) from 
publisher as p  inner join books as b
on p.Pub_id = b.Pub_id
join author as a
on b.author_id = a.author_id
group by Book_name;

