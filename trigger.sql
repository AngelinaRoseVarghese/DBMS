create table customer_detail(id int, name varchar(50), city varchar(35));
create or replace trigger tri1
after insert on customer_detail
for each row
begin
dbms_output.put_line('A Row is Inserted');
end;
/
set serveroutput on;
insert into customer_detail values(1,'Halime Hatun','Dubai');
insert into customer_detail values(2,'Dursun Bey','Al Ain');
insert into customer_detail values(3,'Fatma Hatum','Dubai');
insert into customer_detail values(4,'Everous Bey','Abu Dhabi');


create or replace trigger tri2
after delete on customer_detail
for each row
begin
dbms_output.put_line('A Row is Deleted');
end;
/
set serveroutput on;
delete from customer_detail where id=1;


select * from employee;


create or replace trigger tri3
after insert on employee
for each row
WHEN (NEW.salary > 40000)
begin
DBMS_OUTPUT.PUT_LINE('Salary > 40000');
end;
/ 
set serveroutput on;
insert into employee values(8,'Aladdin Bey',45000);
insert into employee values(9,'Gonca Hatun',40000);


create table cust_count(count_cus int);
insert into cust_count values(0);
create or replace trigger tri4
after insert or delete on cust_count
begin
  if inserting then
    update cust_count set count_cus=count_cus+1;
  elsif deleting then
   update cust_count set count_cus=count_cus-1;
  end if; 
end;
/
set serveroutput on;

create table deleted(empid int, empname varchar(50),salary int);
create table updating(empid int, empname varchar(50),salary int);
create or replace trigger tri5
before delete or update on employee
for each row
begin
  if deleting then
    insert into deleted 
    values(:Old.empid, :Old.empname, :Old.salary);
  elsif updating then
    insert into updated 
    values(:new.empid, :new.empname, :new.salary);
  end if;
end;
/
set serveroutput on;

delete from employee where empid=6;



CREATE OR REPLACE TRIGGER tri5
BEFORE DELETE OR UPDATE ON employee
FOR EACH ROW
BEGIN
  IF DELETING THEN
    INSERT INTO deleted 
    VALUES (:OLD.empid, :OLD.empname, :OLD.salary);
  ELSIF UPDATING THEN
    INSERT INTO updated 
    VALUES (:NEW.empid, :NEW.empname, :NEW.salary);
  END IF;
END;
/
set serveroutput on;


