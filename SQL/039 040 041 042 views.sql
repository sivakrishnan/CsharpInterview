CREATE TABLE tblDepartment
(
 DeptId int Primary Key identity,
 DeptName nvarchar(20)
)


Insert into tblDepartment values ('IT')
Insert into tblDepartment values ('Payroll')
Insert into tblDepartment values ('HR')
Insert into tblDepartment values ('Admin')


select * from tblDepartment
select * from tblEmployee

alter table tblEmployee
add DeptId int constraint FCK_tblEmployee_DeptId_tblDepartment_DeptId references tblDepartment(DeptId)


select emp.Id, emp.EmployeeName, emp.Salary, g.GenderId, g.GenderName, dep.DeptId, dep.DeptName from tblEmployee emp
inner join tblDepartment dep on dep.DeptId=emp.DeptId
inner join Gender g on g.GenderId=emp.GenderId

create view vwEmployeeDetails
as
select emp.Id, emp.EmployeeName, emp.Salary, g.GenderId, g.GenderName, dep.DeptId, dep.DeptName from tblEmployee emp
inner join tblDepartment dep on dep.DeptId=emp.DeptId
inner join Gender g on g.GenderId=emp.GenderId


select * from vwEmployeeDetails

------video 40 updatable view

create view vwEmployeeRawDetails
as
select emp.Id, emp.EmployeeName, emp.Salary from tblEmployee emp

alter view vwEmployeeRawDetails
as
select emp.Id, emp.EmployeeName, emp.Salary, emp.GenderId from tblEmployee emp

select * from vwEmployeeRawDetails


update vwEmployeeRawDetails set EmployeeName=EmployeeName+'-update' where Id=1
insert into vwEmployeeRawDetails (EmployeeName, Salary, GenderId)
values ('200', 600000, 1)
delete from vwEmployeeRawDetails where Id=16

-- based on 3 base table

create view vmEmployeeJoinDetails
as
select emp.EmployeeName, emp.Salary, dep.DeptName, g.GenderName from tblEmployee emp
inner join tblDepartment dep on emp.DeptId=dep.DeptId
inner join Gender g on g.GenderId=emp.GenderId

alter view vmEmployeeJoinDetails
as
select emp.Id, emp.EmployeeName, emp.Salary, dep.DeptName, g.GenderName from tblEmployee emp
inner join tblDepartment dep on emp.DeptId=dep.DeptId
inner join Gender g on g.GenderId=emp.GenderId


select * from vmEmployeeJoinDetails
select * from tblDepartment
select * from tblEmployee

insert into vmEmployeeJoinDetails (EmployeeName, Salary, DeptName, GenderName)
values ('201', 600000, 'IT', 'Male')

update vmEmployeeJoinDetails set DeptName='HR' where Id=2

delete from vwEmployeeRawDetails where Id=16
