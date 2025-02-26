
--drop table Gender
create table Gender
(
GenderId int primary key identity,
GenderName varchar(20)
)

insert into Gender(GenderName)
select 'Male' union
select 'Female'

select * from Gender

--drop table tblEmployee
create table tblEmployee
(
Id int constraint PCK_tblEmployee_Id primary key identity(1, 1),
EmployeeName varchar(500),
Salary int,
GenderId int not null constraint FCK_tblEmployee_GenderId_Gender_GenderId references Gender (GenderId)
)

insert into tblEmployee (EmployeeName, Salary, GenderId)
select 'siva', 10000, 1 union
select 'Sam', 2500, 1 union
select 'Pam', 6500, 2 union
select 'John', 4500, 1 union
select 'Sara', 5500, 2 union
select 'Todd', 3100, 1 

select * from tblEmployee

select * from tblEmployee emp
inner join Gender g on g.GenderId=emp.GenderId

create index IX_tblEmployee_Salary
on tblEmployee (Salary asc)