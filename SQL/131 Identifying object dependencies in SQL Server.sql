--video 131: Duration: 05:49 Identifying object dependencies in SQL Server

Create table tbl131Departments
(
 Id int primary key identity,
 Name nvarchar(50)
)
Go

Create table tbl131Employees
(
 Id int primary key identity,
 Name nvarchar(50),
 Gender nvarchar(10),
 DeptId int foreign key references tbl131Departments(Id)
) 
Go

Create procedure sp131_GetEmployees
as
Begin
 Select * from tbl131Employees
End
Go

Create procedure sp131_GetEmployeesandDepartments
as
Begin
 Select tbl131Employees.Name as EmployeeName, tbl131Departments.Name as DepartmentName 
 from tbl131Employees
 join tbl131Departments
 on tbl131Employees.DeptId = tbl131Departments.Id
End
Go

Create view Vw131Departments
as
Select * from tbl131Departments
Go


Select * from tbl131Departments
Select * from tbl131Employees