create database if not exists Wat_A_Pizza;
use Wat_A_Pizza;

-- TASK 1,2,3 & 4
create table menu_items(id int primary key , pizza_name varchar(100) not null, topping varchar(100),size varchar(100)not null,price int not null);
create table customer_data(cust_id int not null primary key, cust_name varchar(100), address varchar (100),cust_phone int not null );
create table order_detail( order_id int primary key,id int not null, order_amount int not null , order_type varchar(100) not null,cust_id int not null,order_date date not null,foreign key(cust_id) references customer_data(cust_id),foreign key(id) references menu_items(id));
create table crust(name varchar(50) not null, crust_id int not null, rate int not null);
insert into menu_items(id,pizza_name,topping,size,price) value(101,'Spicy Paneer','cheese burst','L',600),(102,'Farm house','extra cheese','M',550),(103,'Paneer n Onion','cheese burst','L',450);
insert into customer_data(cust_id,cust_name,address,cust_phone) value(1001,'Arun','Salem',900),(1002,'Swati','Chennai',901),(1003,'Rohit','Coimbatore',902);
insert into order_detail(order_id,id,order_amount,order_type,cust_id,order_date) value(1,101,700,'Take away',1001,'2021-12-21'),(2,102,600,'Have it',1002,'2022-01-01'),(3,103,500,'Take away',1003,'2022-01-22');
insert into crust (name,crust_id,rate) value('fresh pan pizza', 40,60),('hand tossed',50,70),('thin crust',52,75);
select * from menu_items;
select * from customer_data;
select * from order_detail;
-- TASK 5
insert into menu_items value (100,'Non veg pepperoni','cheese burst','M',650);
-- TASK 6
insert into crust value ('multi grain',40,70);
-- TASK 7
select * from menu_items;
-- TASK 8
select cust_name as CUSTOMER_NAME from customer_data join order_detail using (cust_id) join menu_items using (id) where menu_items.size='L';
-- TASK 9
select menu_items.topping,count(menu_items.topping) from menu_items join order_detail using (id) group by menu_items.topping limit 1;
-- TASK 10
select cust_name,order_detail.order_amount from order_detail inner join customer_data using (cust_id) order by order_detail.order_amount desc limit 1;
-- TASK 11
select order_type, count(order_type) from order_detail where order_type ='Take Away';
-- TASK 12
SET SQL_SAFE_UPDATES=0;
update order_detail join menu_items using (id) set order_detail.order_amount= order_detail.order_amount - 0.1*order_detail.order_amount where menu_items.size ='L';
select * from order_detail;