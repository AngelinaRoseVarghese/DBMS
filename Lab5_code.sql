CREATE TABLE Customer_23(customer_id int primary key not null , CustomerName varchar(30), ContactNo int, Address varchar(50), City varchar(50), PostalCode int, Country varchar(10));
insert into Customer_23 values(10,'Anju',01234,'Vazhayil','Pala',68975,'India');
insert into Customer_23 values(11,'Meera',567891,'Garden villa','Al Baraha',98756,'UAE');
insert into Customer_23 values(12,'Anakha',246810,'Kunnel','Kattapana',654125,'India');
insert into Customer_23 values(13,'Maya',13579,'Thrittayil','Kollam',68975,'India');
insert into Customer_23 values(14,'Myra',121416,'Moolayil','Anakkara',68213,'India');
insert into Customer_23 values(15,'iyra',182022,'Jasmine villa','BU Hail',96523,'UAE');
insert into Customer_23 values(16,'Jerob',24262830,'Muhammed villa','Ajman',91203,'UAE');
insert into Customer_23 values(17,'Arjun',323436,'Njavali','Kattapana',654125,'India');
insert into Customer_23 values(18,'Iza',384042,'Valiyaveetil','Pala',68975,'India');
insert into Customer_23 values(19,'Rekha',444648,'Maryam Villa','Al Baraha',98756,'UAE');
insert into Customer_23 values(20,'Jayna',505254,'Hlalime Villa','Al Baraha',98756,'UAE');
insert into Customer_23 values(21,'Mika',565860,'Fatma Villa','BU Hail',96523,'UAE');






select * from Customer_23;

select * from Customer_23 order by CustomerName ;

Create table Employees_23 (EmployeeID int primary key not null, LastName varchar(30), FirstName varchar(30), BirthDate date, Photo varchar(30)) ;
insert into Employees_23  values(1001,'Manohar','Ravi','10/11/1995','a');
insert into Employees_23  values(1002,'Varma','Mohan','19/1/1975','b');
insert into Employees_23  values(1004,'Kapoor','Anjali','1/7/1989','c');
insert into Employees_23  values(1005,'Oberoi','Maya','10/5/1999','d');
insert into Employees_23  values(1003,'Menon','Arjun','5/5/1965','e');
select * from Employees_23;
select * from Employees_23 where BirthDate > '31/1/1979' order by BirthDate desc;


create table Order_23(order_id int primary key not null,customer_id int, EmployeeID int, order_date date, shipper_id int, foreign key (customer_id) references Customer_23(customer_id) on delete cascade, foreign key(EmployeeID) references Employees_23(EmployeeID) on delete cascade);
insert into order_23 values(9991,10,1001,'24/1/2025',8881);
insert into order_23 values(9992,11,1001,'14/2/2025',8882);
insert into order_23 values(9993,12,1003,'4/2/2025',8883);
insert into order_23 values(9994,10,1002,'15/5/2025',8884);
insert into order_23 values(9995,13,1004,'18/4/2025',8885);
insert into order_23 values(9996,14,1005,'12/1/2025',8886);
insert into order_23 values(9997,11,1005,'21/10/2025',9001);
insert into order_23 values(9998,11,1001,'24/1/2025',8881);
insert into order_23 values(9999,15,1003,'7/7/2025',8888);
insert into order_23 values(10000,16,1005,'14/7/2025',8889);
insert into order_23 values(10001,15,1002,'27/9/2025',9000);
insert into order_23 values(10002,18,1004,'2/9/2025',9001);
insert into order_23 values(10004,20,1001,'27/10/2025',9002);
insert into order_23 values(10003,17,1003,'24/12/2025',9003);
insert into order_23 values(10005,21,1001,'1/12/2025',9004);
insert into order_23 values(10006,19,1002,'25/8/2025',9005);


select * from order_23 order by order_date;
SELECT * FROM Order_23 WHERE customer_id IN ( SELECT customer_id FROM Customer_23 WHERE Country = 'UAE') ORDER BY order_date DESC;
select customer_id, count(order_id)as total_order from Order_23 group by customer_id;
select City , count(customer_id)as total_number from Customer_23 group by City;
select customer_id, count(order_id)as total_order from Order_23 group by customer_id having count(order_id)>1;
select City, count(customer_id)as total_order from Customer_23 group by City having count(City)>1;
