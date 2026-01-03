Create Table tbl008Departments
(
     DepartmentID int primary key,
     DepartmentName nvarchar(50)
)
GO

Create Table tbl008Employees
(
     EmployeeID int primary key,
     EmployeeName nvarchar(50),
     DepartmentID int foreign key references tbl008Departments(DepartmentID)
)
GO

Insert into tbl008Departments values (1, 'IT')
Insert into tbl008Departments values (2, 'HR')
Insert into tbl008Departments values (3, 'Payroll')
GO

Insert into tbl008Employees values (1, 'Mark', 1)
Insert into tbl008Employees values (2, 'John', 1)
Insert into tbl008Employees values (3, 'Mike', 1)
Insert into tbl008Employees values (4, 'Mary', 2)
Insert into tbl008Employees values (5, 'Stacy', 3)
GO


select top 1 dep.DepartmentID, dep.DepartmentName, count(*) 
from tbl008Employees emp
inner join tbl008Departments dep on dep.DepartmentID=emp.DepartmentID
group by dep.DepartmentID, dep.DepartmentName
order by count(*)  desc