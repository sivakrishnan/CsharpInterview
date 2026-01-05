Create table tbl012Departments
(
     ID int not null,
     Name nvarchar(50),
     Location nvarchar(50)
)
GO

Create table tbl012Employees
(
     ID int,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DepartmentId int
)
GO

Insert into tbl012Departments values (1, 'IT', 'New York')
Insert into tbl012Departments values (2, 'HR', 'London')
Insert into tbl012Departments values (3, 'Payroll', 'Sydney')
GO

Insert into tbl012Employees values (1, 'Mark', 'Male', 60000, 1)
Insert into tbl012Employees values (2, 'Steve', 'Male', 45000, 3)
Insert into tbl012Employees values (3, 'Ben', 'Male', 70000, 1)
Insert into tbl012Employees values (4, 'Philip', 'Male', 45000, 2)
Insert into tbl012Employees values (5, 'Mary', 'Female', 30000, 2)
Insert into tbl012Employees values (6, 'Valarie', 'Female', 35000, 3)
Insert into tbl012Employees values (7, 'John', 'Male', 80000, 1)
GO


Select tbl012Employees.Name as EmployeeName, tbl012Departments.Name as DepartmentName
from tbl012Employees
join tbl012Departments on tbl012Departments.ID = tbl012Employees.DepartmentId
