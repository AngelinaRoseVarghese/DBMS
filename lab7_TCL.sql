create table bank(bankcode varchar(3) primary key, bankname varchar(30) not null, headoffice varchar(30), branches int not null check(branches>0));  
insert into bank values('SBT','SBI Bank','Delhi',30);
insert into bank values('CNB','Canara bank', 'Ernakulam',20);
insert into bank values('SIB','South Indian Bank','Madras',30);
insert into bank values('AXB','Axis bank','Kottayam',15);
insert into bank values('FDB','Federal Bank','Ernakulam',25);
insert into bank values('IFB','Indian Federal Bank','Ernakulam',25);
commit;
select * from bank;

insert into bank values('ICL','ICL Fincorp','Ernakulma',5);
savepoint A;
select * from bank;

insert into bank values('GNB','Grameen Bank','Pune',15);
savepoint B;
select * from bank;

rollback to B;
select * from bank;
