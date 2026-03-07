create table student_23(roll int primary key not null,student_name varchar(30),phy int, chem int,mat int);
insert into student_23 values(1,'Rudra',18,17,25);
insert into student_23 values(2,'Maya',21,20,45);
insert into student_23 values(3,'Michale',18,7,19);
insert into student_23 values(4,'Yuri',5,8,12);
insert into student_23 values(5,'Anne',18,18,44);
insert into student_23 values(6,'Elizabeth',25,24,48);
insert into student_23 values(7,'Henry',1,7,2);
insert into student_23 values(8,'Arjun',12,13,27);
insert into student_23 values(9,'Ardra',19,22,38);
insert into student_23 values(10,'Jessy',23,14,50);

SELECT avg(phy) from student_23;
select max(mat)from student_23;
select min(chem)from student_23;
select COUNT(*) AS pass FROM student_23 WHERE phy >= 12 and chem>=12 and mat>=22;
ALTER TABLE student_23 ADD status varchar(45);
update student_23 set status='Pass' where phy>=12 and chem>=12 and mat>=22;
update student_23 set status='Fail' where phy<12 and chem<12 and mat<22;
select * from student_23;
select * from student_23 ORDER BY (phy+chem+mat) desc;
select count(*)*100/10 as pass_percentage_maths from student_23 where mat >=25;
SELECT COUNT(*)*100/10 AS total_pass_percentage from student_23 where  phy>=12 AND chem>=12 AND mat>=25;
SELECT AVG(mat+phy+chem) from student_23;
SELECT count(status) as pass_count from student_23 where status='Pass';

