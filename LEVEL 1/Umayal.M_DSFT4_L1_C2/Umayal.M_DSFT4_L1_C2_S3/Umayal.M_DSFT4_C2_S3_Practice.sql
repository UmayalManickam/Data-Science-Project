create database if not exists Sales_Data;
-- TASK 1 & 2
use Sales_Data;
create table if not exists salesperson(Sales_ID int,First_Name varchar(50),City varchar(50),Commission_Rate int);
create table if not exists customers(Customer_ID int,Name varchar(50),Last_Name varchar(20),City varchar(20),Rating int,Sales_ID int);
create table if not exists order_received(Order_ID int,Amount int,Order_date varchar(12),Customer_ID int);
/*   TASK 3      
Sales_ID,Customer_ID,Order_ID are the primary key for respective tables    */
 -- TASK 4
 insert into salesperson(Sales_ID,First_Name,City,Commission_Rate) value(1002,'Peter','LONDON',12),(1002,'Peter','LONDON',12),(1003,'Rifkin','Barcelona',15),(1004,'Judith','LONDON',11),(1008,'John','LONDON',0),(1009,'Charles','Florida',Null),(1009,'Charles','Florida',Null),(1004,'Judith','LONDON',11);
 -- TASK 6
 insert into customers(Customer_ID,Name,Last_Name,City,Rating,Sales_ID) value(2001,'HoffmaN','Anny','London',100,1001),(2002,'GlovanNI','JeNNY','Rome',200,1003),(2003,'Liu','wiLLiams','San Jose',100,1002),(2004,'GraSS','HarrY','Berlin',300,1002),(2005,'ClemeNS','JoHN','London',200,1001),(2006,'Cisneros','FannY','San Jose',200,1007),(2007,'Pereira','JonaTHAN','Rome',300,1004);
 -- TASK 7
 insert into order_received(Order_ID,Amount,Order_Date,Customer_ID) value(3001,123,'01-02-2020',2008),(3003,187,'02-10-2020',2001),(3002,100,'30-07-2000',2007),(3005,201,'09-10-2011',2003),(3009,145,'10-10-2012',2008),(3007,167,'02-04-2020',2002),(3008,189,'06-03-2020',2002),(3010,200,'23-02-2012',2006),(3011,100,'18-09-2000',2004);
-- To use DELETE & UPDATE COMMAND
SET SQL_SAFE_UPDATES = 0; 
-- TASK 8
 delete from order_received where Order_ID=3011;
-- TASK 9
 delete from salesperson where Commission_Rate=0;
 -- TASK 10
 update order_received  set Amount=Amount+(Amount/5) WHERE Amount<100;
 -- TASK 11
 create index idx_Rating on customers(Rating);
 -- TASK 12
 update salesperson set Commission_Rate=28 where Commission_Rate=26;
 -- TASK 13
 update customers set Rating=150 where Rating=100; 
 -- TASK 5
  select * from salesperson where Commission_Rate IS NOT NULL and First_Name IS NOT NULL and City IS NOT NULL and Sales_ID IS NOT NULL;
  select * from customers where Customer_ID IS NOT NULL and Name IS NOT NULL and Last_Name IS NOT NULL and City IS NOT NULL and Rating IS NOT NULL and Sales_ID IS NOT NULL;
select * from order_received where Order_ID IS NOT NULL and Amount IS NOT NULL and Order_Date IS NOT NULL and Customer_ID IS NOT NULL;  

 
 
 
 

 
 
 
 
 
 