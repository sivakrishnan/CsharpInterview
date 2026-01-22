--video 45: Duration: 15:04 After update trigger 

select * from tbl045Employee
select * from tbl045Department



CREATE TABLE tbl045Employee
(
  Id int Primary Key,
  Name nvarchar(30),
  Gender nvarchar(10),
  DepartmentId int
)


CREATE TABLE tbl045Department
(
 DeptId int Primary Key,
 DeptName nvarchar(20)
)


Insert into tbl045Department values (1,'IT')
Insert into tbl045Department values (2,'Payroll')
Insert into tbl045Department values (3,'HR')
Insert into tbl045Department values (4,'Admin')


Insert into tbl045Employee values (1,'John', 'Male', 3)
Insert into tbl045Employee values (2,'Mike', 'Male', 2)
Insert into tbl045Employee values (3,'Pam', 'Female', 1)
Insert into tbl045Employee values (4,'Todd', 'Male', 4)
Insert into tbl045Employee values (5,'Sara', 'Female', 1)
Insert into tbl045Employee values (6,'Ben', 'Male', 3)


Create view vw045EmployeeDetails
as
Select Id, Name, Gender, DeptName
from tbl045Employee 
join tbl045Department
on tbl045Employee.DepartmentId = tbl045Department.DeptId


select * from vw045EmployeeDetails


Create trigger tr_vw045EmployeeDetails_InsteadOfInsert
on vw045EmployeeDetails
Instead Of Insert
as
Begin
 Declare @DeptId int
 
 --Check if there is a valid DepartmentId
 --for the given DepartmentName
 Select @DeptId = DeptId 
 from tbl045Department 
 join inserted
 on inserted.DeptName = tbl045Department.DeptName
 
 --If DepartmentId is null throw an error
 --and stop processing
 if(@DeptId is null)
 Begin
  Raiserror('Invalid Department Name. Statement terminated', 16, 1)
  return
 End
 
 --Finally insert into tbl045Employee table
 Insert into tbl045Employee(Id, Name, Gender, DepartmentId)
 Select Id, Name, Gender, @DeptId
 from inserted
End


Insert into vw045EmployeeDetails values(7, 'Valarie', 'Female', 'IT')

Insert into vw045EmployeeDetails values(7, 'Valarie', 'Female', 'ITtest')


Insert into vw045EmployeeDetails
select 11, 'Valarie-11', 'Female', 'IT'
union
select 8, 'Valarie-8', 'Female', 'IT'
union
select 9, 'Valarie-9', 'Female', 'IT'
union
select 10, 'Valarie-10', 'Female', 'IT'

select * from vw045EmployeeDetails;