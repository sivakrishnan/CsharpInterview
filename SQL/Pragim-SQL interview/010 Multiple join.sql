Create Table tbl010Departments
(
     DepartmentID int primary key,
     DepartmentName nvarchar(50)
)
GO

Create Table tbl010Genders
(
     GenderID int primary key,
     Gender nvarchar(50)
)
GO

Create Table tbl010Employees
(
     EmployeeID int primary key,
     EmployeeName nvarchar(50),
     DepartmentID int foreign key references tbl010Departments(DepartmentID),
     GenderID int foreign key references tbl010Genders(GenderID)
)
GO

Insert into tbl010Departments values (1, 'IT')
Insert into tbl010Departments values (2, 'HR')
Insert into tbl010Departments values (3, 'Payroll')
GO

Insert into tbl010Genders values (1, 'Male')
Insert into tbl010Genders values (2, 'Female')
GO

Insert into tbl010Employees values (1, 'Mark', 1, 1)
Insert into tbl010Employees values (2, 'John', 1, 1)
Insert into tbl010Employees values (3, 'Mike', 2, 1)
Insert into tbl010Employees values (4, 'Mary', 2, 2)
Insert into tbl010Employees values (5, 'Stacy', 3, 2)
Insert into tbl010Employees values (6, 'Valarie', 3, 2)
GO


--  join 3 the tables and retrieve EmployeeName, DepartmentName and Gender


SELECT EmployeeName, DepartmentName, Gender
FROM tbl010Employees
JOIN tbl010Departments ON tbl010Employees.DepartmentID = tbl010Departments.DepartmentID
JOIN tbl010Genders ON tbl010Employees.GenderID = tbl010Genders.GenderID


-- total number of tbl010Employees by DEPARTMENT and by GENDER


SELECT DepartmentName, Gender, COUNT(*) as TotalEmployees
FROM tbl010Employees
JOIN tbl010Departments ON tbl010Employees.DepartmentID = tbl010Departments.DepartmentID
JOIN tbl010Genders ON tbl010Employees.GenderID = tbl010Genders.GenderID
GROUP BY DepartmentName, Gender
ORDER BY DepartmentName, Gender