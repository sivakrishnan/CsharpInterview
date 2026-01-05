Create Table tbl011Departments
(
     DepartmentID int primary key,
     DepartmentName nvarchar(50)
)
GO

Create Table tbl011Employees
(
     EmployeeID int primary key,
     EmployeeName nvarchar(50),
     DepartmentID int foreign key references tbl011Departments(DepartmentID)
)
GO

Insert into tbl011Departments values (1, 'IT')
Insert into tbl011Departments values (2, 'HR')
Insert into tbl011Departments values (3, 'Payroll')
Insert into tbl011Departments values (4, 'Admin')
GO

Insert into tbl011Employees values (1, 'Mark', 1)
Insert into tbl011Employees values (2, 'John', 1)
Insert into tbl011Employees values (3, 'Mike', 1)
Insert into tbl011Employees values (4, 'Mary', 2)
Insert into tbl011Employees values (5, 'Stacy', 2)
GO



Select DepartmentName, EmployeeName
From tbl011Employees
Right Join tbl011Departments
On tbl011Employees.DepartmentID = tbl011Departments.DepartmentID


Select DepartmentName, Count(tbl011Employees.DepartmentID) as TotalEmployees
From tbl011Employees
Right Join tbl011Departments
ON tbl011Departments.DepartmentID = tbl011Employees.DepartmentID
Group By DepartmentName
Order By TotalEmployees