

Create table tbl004Employee
(
     ID int,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
GO

delete from tbl004Employee

Insert into tbl004Employee values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tbl004Employee values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tbl004Employee values (1, 'Mark', 'Hastings', 'Male', 60000)
Insert into tbl004Employee values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into tbl004Employee values (2, 'Mary', 'Lambeth', 'Female', 30000)
Insert into tbl004Employee values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into tbl004Employee values (3, 'Ben', 'Hoskins', 'Male', 70000)
Insert into tbl004Employee values (3, 'Ben', 'Hoskins', 'Male', 70000)

select * from tbl004Employee


--insert into tblEmployee values('100', 5500, 1)


with employeeCTE as
(
	select *, ROW_NUMBER() over (partition by Id order by Id) rownumber
	from tbl004Employee
)
delete from employeeCTE where employeeCTE.rownumber<>1