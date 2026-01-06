Create table tbl002Employees
(
     EmployeeID int primary key identity,
     EmployeeName nvarchar(50),
     ManagerID int foreign key references tbl002Employees(EmployeeID)
)
GO

Insert into tbl002Employees values ('John', NULL)
Insert into tbl002Employees values ('Mark', NULL)
Insert into tbl002Employees values ('Steve', NULL)
Insert into tbl002Employees values ('Tom', NULL)
Insert into tbl002Employees values ('Lara', NULL)
Insert into tbl002Employees values ('Simon', NULL)
Insert into tbl002Employees values ('David', NULL)
Insert into tbl002Employees values ('Ben', NULL)
Insert into tbl002Employees values ('Stacy', NULL)
Insert into tbl002Employees values ('Sam', NULL)
GO

Update tbl002Employees Set ManagerID = 8 Where EmployeeName IN ('Mark', 'Steve', 'Lara')
Update tbl002Employees Set ManagerID = 2 Where EmployeeName IN ('Stacy', 'Simon')
Update tbl002Employees Set ManagerID = 3 Where EmployeeName IN ('Tom')
Update tbl002Employees Set ManagerID = 5 Where EmployeeName IN ('John', 'Sam')
Update tbl002Employees Set ManagerID = 4 Where EmployeeName IN ('David')
GO


select * from tbl002Employees

declare @ID int;
set @ID=7;

with EmployeeCTE as
(
	-- Anchor
	select EmployeeID, EmployeeName, ManagerID from tbl002Employees
	where EmployeeID=@ID

     UNION ALL
    
	-- Recursive Member
     Select tbl002Employees.EmployeeId , tbl002Employees.EmployeeName,
             tbl002Employees.ManagerID
     From tbl002Employees
     JOIN EmployeeCTE
     ON tbl002Employees.EmployeeId = EmployeeCTE.ManagerID

)
Select E1.EmployeeName, ISNULL(E2.EmployeeName, 'No Boss') as ManagerName
From EmployeeCTE E1
LEFT Join EmployeeCTE E2
ON E1.ManagerID = E2.EmployeeId