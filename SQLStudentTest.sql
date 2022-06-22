create database StudentTest;
use StudentTest;
create table Test (
testID int primary key,
Name varchar(255)
);
create table Student(
RN int primary key,
Name varchar(255),
Age int,
Status varchar(255)
);
create table StudentTest (
RN int,
TestID int,
Date datetime,
Mark int,
primary key (RN,TestID),
foreign key (RN) REFERENCES Student(RN),
foreign key (TestID) REFERENCES test(TestID)
);
insert into test value(1,'EPC'),(2,'DWMX'),(3,'SQL1'),(4,'SQL2');

insert into student value(1,'Nguyen Hong Ha',20,''),(2,'Truong Ngoc Anh',30,''),
(3,'Tuan Minh',25,''),(4,'Dan Truong',22,'');

insert into studenttest value(1,1,'2006-07-17',8),(1,2,'2006-07-18',5),(1,3,'2006-07-19',7),
(2,1,'2006-07-17',7),(2,2,'2006-07-18',4),(2,3,'2006-07-19',2),(3,1,'2006-07-17',10)
,(3,3,'2006-07-19',1);

-- câu 2:
select s.Name as 'Student Name', t.Name as 'Test Name', ST.mark, ST.date 
from student S join studentTest ST on S.RN = ST.RN join Test T on T.testID = ST.testID;

-- câu 3:
select *
from student 
where not exists (select * from studenttest where student.RN = studenttest.RN);

-- câu 4:
create view DSthilai as
select s.Name as 'Student Name', t.Name as 'Test Name', ST.mark, ST.date 
from student S join studentTest ST on S.RN = ST.RN join Test T on T.testID = ST.testID
where ST.mark < 5;

-- câu 5:
create view DSdiemtb as
select s.Name as 'Student Name', avg(ST.mark) as 'Average'
from student S join studentTest ST on S.RN = ST.RN join Test T on T.testID = ST.testID
group by S.name;

select * 
from dsdiemtb
order by average desc;

-- câu 6:
select * 
from dsdiemtb
where average = (select max(average) from dsdiemtb);

-- câu 7:
select T.Name as 'Test Name', max(ST.mark) as 'Max Mark'
from student S join studentTest ST on S.RN = ST.RN join Test T on T.testID = ST.testID
group by T.name
order by T.name;

-- câu 8:
select S.name as 'Student Name', T.name as 'Test Name'
from student S left join studentTest ST on S.RN = ST.RN left join Test T on T.testID = ST.testID;

-- câu 9:
update student set age = age + 1
where RN > 0;
select * from student;

-- câu 10:
ALTER TABLE `studenttest`.`student` 
CHANGE COLUMN `Status` `Status` VARCHAR(10) NULL DEFAULT NULL ;

-- câu 11:
Update student set status = 'young'
where age <30 and rn >0;
Update student set status = 'old'
where age >30 and rn >0;

-- câu 12:
create view vwStudentTestList as
select s.Name as 'Student Name', t.Name as 'Test Name', ST.mark, ST.date 
from student S join studentTest ST on S.RN = ST.RN join Test T on T.testID = ST.testID
order by ST.date;

select * from vwStudentTestList;

-- câu 13:


