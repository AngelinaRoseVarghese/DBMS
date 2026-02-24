create table instructor(id INT PRIMARY KEY not null, name varchar(30) not null,dept varchar(30));
describe instructor;
create table course(course_id INT PRIMARY KEY not null, title varchar(30) not null,credit int, id int, foreign KEY (id)references instructor(id )on delete set null);
describe course;
create table student(roll int PRIMARY KEY not null, name varchar(30),dob DATE,dept varchar(30));
describe student;
create table enrollment(roll int,course_id int,grade char(2),PRIMARY KEY(roll,course_id),FOREIGN KEY(roll) references student(roll)on DELETE cascade,FOREIGN KEY (course_id) references course(course_id)on DELETE CASCADE);
describe enrollment;
create index idx_student_dept on student(dept);
create index idx_course_id on course(id);
ALTER TABLE student ADD email VARCHAR(60);
describe student;
drop table enrollment;
SELECT index_name, table_name, status
FROM user_indexes
WHERE table_name = 'STUDENT';
SELECT index_name, table_name, status
FROM user_indexes
WHERE table_name = 'COURSE';
