Create Table tbl009Departments
(
     DepartmentID int primary key,
     DepartmentName nvarchar(50)
)
GO

Create Table tbl009Employees
(
     EmployeeID int primary key,
     EmployeeName nvarchar(50),
     DepartmentID int foreign key references tbl009Departments(DepartmentID)
)
GO

Insert into tbl009Departments values (1, 'IT')
Insert into tbl009Departments values (2, 'HR')
Insert into tbl009Departments values (3, 'Payroll')
Insert into tbl009Departments values (4, 'Admin')
GO

Insert into tbl009Employees values (1, 'Mark', 1)
Insert into tbl009Employees values (2, 'John', 1)
Insert into tbl009Employees values (3, 'Mike', 1)
Insert into tbl009Employees values (4, 'Mary', 2)
Insert into tbl009Employees values (5, 'Stacy', 3)
Insert into tbl009Employees values (6, 'Pam', NULL)
GO

-- inner join
SELECT EmployeeName, DepartmentName
FROM tbl009Employees
INNER JOIN tbl009Departments
ON tbl009Employees.DepartmentID = tbl009Departments.DepartmentID

-- left join
SELECT EmployeeName, DepartmentName
FROM tbl009Employees
LEFT JOIN tbl009Departments
ON tbl009Employees.DepartmentID = tbl009Departments.DepartmentID