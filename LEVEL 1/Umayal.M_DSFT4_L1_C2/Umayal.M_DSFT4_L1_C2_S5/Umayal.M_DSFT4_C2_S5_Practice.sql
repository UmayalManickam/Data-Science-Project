create database if not exists Sales_Order_Flow_2;
use Sales_Order_Flow_2;
create table cust_details(customer_id varchar (50) not null,first_name varchar (50) not null,last_name varchar (50) not null, address varchar(50) not null, sales_id int not null, ratings int not null,  primary key(customer_id));
create table order_details(order_id int not null, order_name varchar(50) not null, customer_id varchar(50) not null,order_dates date not null, amount int not null,Primary key(order_id), foreign key(customer_id) references cust_details(customer_id));
create table salesperson_details(sales_id int not null, first_name varchar(50) not null,last_name varchar(50) not null, city varchar(50) not null, commission_rate int not null, primary key(sales_id));
insert into cust_details(customer_id,first_name,last_name, address,sales_id,ratings ) values (101,'Adam','Smith','Bangalore',1001,150),(102,'Alex','Mcqueen','Delhi',1004,200),(103,'Stuart','Little','Rohtak',1007,300);
insert into order_details(order_id,order_name,customer_id, order_dates,amount) values (10,'order1',101,'2020-10-25',23000),(11,'order2',103,'2020-11-04',25000),(12,'order3',102,'2021-01-01',42000);
insert into salesperson_details(sales_id,first_name,last_name,city,commission_rate) values (1001,'Peei','Smith','London',12),(1002,'Serres','White','SanJose',13),(1004,'Judith','Watson','London',11),(1007,'Rifkin','Balwin','Barcelona',15),(1003,'Alexrod','Smith','Newyork',10),(1008,'John','Grey','London',0);
select * from cust_details;
select * from order_details;
select * from salesperson_details;

-- task1
select Order_ID,s.first_name as 'Full_Name' from salesperson_details s inner join cust_details c on s.sales_id =c.sales_id inner join order_details o  on o.customer_id= c.customer_id;
-- task2
select concat(c.first_name,'  ',c.last_name) as 'Customer_Name', s.first_name as 'Salesperson_Name' from cust_details c inner join salesperson_details s on c.sales_id= s.sales_id; 
-- task3
select concat(c.first_name,' ',c.last_name) as 'Customer_Name', s.first_name as 'Salesperson_Name' from cust_details c inner join salesperson_details s on c.sales_id= s.sales_id group by Salesperson_Name having count(Salesperson_Name)>1;
-- task4
select count(order_id),s.first_name, o.order_id from salesperson_details s inner join cust_details c on s.sales_id= c.sales_id inner join order_details o on o.customer_id group by s.first_name having count('full_name')>0 order by first_name desc;
-- task5
select s.first_name ='Judith' , c.customer_id,o.order_id, o.order_name, o.customer_id, o.order_dates from  sales_orders.salesperson_details s join sales_orders.cust_details c  join sales_orders.order_details o  on c.customer_id= o.customer_id;
-- task6
select * from salesperson_details where city != all( select city from cust_details);
-- task7
select * from salesperson_details where city = any( select city from cust_details);
 -- task8
 select s.sales_id, s.city, c.customer_id, c.address, o.order_id, o.order_dates from order_details o join cust_details c on o.customer_id= c.customer_id join salesperson_details s on c.sales_id=s.sales_id where not c.address=s.city;
 -- task9
 select c.first_name,s.commission_rate from cust_details c inner join salesperson_details s on c.sales_id=s.sales_id where s.city='London';
 -- task10
 create view salesperson_view as select * from salesperson_details where commission_rate>12;
 -- task11
 select s.sales_id, s.first_name, s.city, c.customer_id, c.address from salesperson_details s join cust_details c on s.sales_id=c.sales_id where not s.city= c.address;
 -- task12
 select s.first_name from salesperson_details s inner join cust_details c on s.sales_id=c.sales_id inner join order_details o on o.customer_id=c.customer_id where not o.order_dates between '2020-03-10' and '2020-05-10';
 -- task13
 select s.first_name from salesperson_details s inner join cust_details c on s.sales_id=c.sales_id inner join order_details o on o.customer_id=c.customer_id group by s.first_name having count(s.first_name);
 -- task14
 select s.sales_id, s.first_name, o.order_dates, max(o.amount) from order_details o join cust_details c on o.customer_id= c.customer_id join salesperson_details s on c.sales_id= s.sales_id group by s.sales_id order by amount desc;
 -- task15
 create view customer_name as select concat(upper(substring(first_name,1,1)),upper(substring(first_name,2)),'',upper(substring(last_name,1,1)),upper(substring(last_name,2))) as full_name from cust_details;
 