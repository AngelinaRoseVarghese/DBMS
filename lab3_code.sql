create table employee(emp_id int PRIMARY KEY not null,emp_name varchar(30),dept varchar(20),salary int);
insert into employee values(101,'Odi','HR',5000);
insert into employee values(102,'Atlanta','Marketing',8500);
insert into employee values(103,'Cindy','Production',9800);
insert into employee values(104,'Drake','HR',6500);
insert into employee values(3,'Charles Brown','Sales',15000);
insert into employee values(105,'David Smith','Marketing',6800);
DESCRIBE employee;

update employee set salary = 8200 where emp_name='David Smith';
insert into employee values(6, 'Daniel Harris','Production',6700);

delete from employee where emp_id=3;
select emp_name from employee where emp_name not like 'D%' and emp_name not like 'O%';
select dept, sum(salary) as total_salary from employee group by dept;

update employee set salary=salary+(salary*0.05) where dept='Production';
delete from employee where salary<7000;
Select emp_name,salary as annual_salary from employee where salary=(select min(salary) from employee);
update employee set salary=8200 where dept='Marketing';

SELECT * from employee;
select emp_name from employee where emp_name like 'A%' ;
select distinct upper(dept) from employee;
SELECT * 
FROM employee 
WHERE dept LIKE 'M_r%ket%';
Select distinct upper (reverse(dept)) from employee;
