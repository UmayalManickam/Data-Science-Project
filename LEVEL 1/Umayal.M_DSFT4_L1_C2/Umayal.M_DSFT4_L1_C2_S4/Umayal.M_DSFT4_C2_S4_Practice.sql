create database if not exists Sales_order_flow;
use Sales_order_flow;
create table customer_details(customer_id varchar (50) not null,first_name varchar (50) not null,last_name varchar (50) not null, address varchar(50) not null, sales_id int not null, ratings int not null,  primary key (customer_id));
create table order_details(order_id int not null, order_name varchar(50) not null, customer_id varchar(50) not null,order_dates date not null, amount int not null, Primary key(order_id), foreign key(customer_id) references customer_details (customer_id));
create table salesperson_details (sales_id int not null, first_name varchar(50) not null,last_name varchar(50) not null, city varchar(50) not null, commission_rate int not null, primary key (sales_id));
insert into customer_details (customer_id,first_name,last_name, address,sales_id , ratings) values (101,'Adam','Smith','Bangalore',1001,500),(102,'Alex','Mcqueen','Delhi',1004,440),(103,'Stuart','Little','Rohtak',1007,45);
insert into order_details (order_id,order_name,customer_id, order_dates, amount) values (10,'order1',101,'2020-10-25',22000),(11,'order2',103,'2020-11-04',23000),(12,'order3',102,'2021-01-01',30000);
insert into salesperson_details(sales_id,first_name,last_name,city,commission_rate) values (1001,'Peei','Smith','London',12),(1002,'Serres','White','San Jose',13),(1004,'Judith','Watson','London',11),(1007,'Rifkin','Balwin','Barcelona',15),(1003,'Alexrod','Smith','Newyork',10),(1008,'John','Grey','London',0);
select * from customer_details;
select * from order_details;
select * from salesperson_details;

-- task1
select * from customer_details where address='Bangalore';
select * from customer_details where address='Delhi';
select * from customer_details where address='Rohtak';
-- task2
select * from salesperson_details where first_name like ('P__L%');
-- task3
select * from salesperson_details where city='San Jose' or city='Brazil' or city='London';
-- task4
select * from customer_details where first_name like'A%' or first_name like'G%';
-- task5
select max(ratings),address as City from customer_details group by address; 
-- task6
select * from salesperson_details where city in ('Barcelona','London');
-- task7
select * from order_details where order_dates between '2020-10-03' and '2020-12-04';
-- task8
select sum(amount) as Sum_of_all_purchase from order_details;
-- task9
select count(commission_rate) from salesperson_details where commission_rate is not null;
-- task10
select concat(first_name,'  ', last_name) as Full_name from customer_details;
-- task11
select * from customer_details where ratings between 200 and 300;
-- task12
select * from customer_details order by first_name;
-- task13
select * from order_details order by amount desc;
-- task14
select avg(amount) as Average_amount from order_details;
-- task15
select count(customer_id) as 'No.of.customers', address from customer_details group by address;
-- task16
select count(customer_id) as 'No.of.customers', address from customer_details group by address order by customer_id desc;
-- task17
select * from order_details where month(order_dates)=4;
-- task18
select order_id, order_dates, amount from order_details order by amount desc limit 5;
-- task19
select  max(commission_rate),first_name from salesperson_details;
-- task20
select * from salesperson_details order by commission_rate limit 3;