
--1.Create a book table with id as primary key and provide the appropriate data type to other attributes .isbn no should be unique for each book
  
create table book
(id int primary key,
title varchar(30),
author varchar(20),
isbn numeric(12) unique,
publish_date date
)

insert into book values(1,'My First Sql Book','Mary Parker',981482029127,'2012-02-22'),
(2,'My Second Sql Book','John Mayer',857300923713,'1972-07-03'),
(3,'My Third Sql Book','Cary Flint',523120967812,'2015-10-18')


--Write a query to fetch the details of the books written by author whose name ends with er.
select * from book where author like '%er'

--2. Display the Title ,Author and ReviewerName for all the book
create table review
(id int primary key,
book_id int,
reviewer_name varchar(20),
content varchar(30),
rating int,
publish_date date
)

insert into review values(1,1,'John Smith','My First Review',4,'2017-12-10'),
(2,2,'John Smith','My Second Review',5,'2017-10-13'),
(3,2,'Alice Parker','Another Review',1,'2017-10-22')


select book.title, book.author, review.reviewer_name from book join review on book.id = review.book_id

--3.
select reviewer_name from review group by reviewer_name having count(book_id)>1

--4.
create table customer 
(id int primary key, 
Cname varchar(20),
age int,
addr varchar(20),
salary float
)

insert into customer values(1,'Ramesh',32,'Ahmeadabad',2000),
(2,'Khilan',25,'Delhi',1500),
(3,'Kaushik',23,'Kota',2000),
(4,'Chaitali',25,'Mumbai',6500),
(5,'Hardik',25,'Bhopal',8500),
(6,'Komal',22,'MP',4500),
(7,'Muffy',24,'Indore',10000)

select Cname, addr from customer where addr like '%o%'

--5>

create table orders(oid int,
date date,
customerid int,
amount int)

insert into orders values(102,'2009-10-08',3,3000),(100,'2009-10-08',3,1500),(101,'2009-11-20',2,1560),(103,'2008-05-20',4,2060)

select date, count(customerid) as 'Total no of orders' from orders group by date having count(customerid) > 1

--6
create  table employee
(id int primary key,
ename varchar(80),
age int, 
addr varchar(20),
salary int )

insert into employee values(1,'Ramesh',32,'Ahmeadabad',2000),
(2,'Khilan',25,'Delhi',1500),
(3,'Kaushik',23,'Kota',2000),
(4,'Chaitali',25,'Mumbai',6500),
(5,'Hardik',25,'Bhopal',8500),
(6,'Komal',22,'MP',NULL),
(7,'Muffy',24,'Indore',NULL)


select lower(ename) from employee where salary is NULL