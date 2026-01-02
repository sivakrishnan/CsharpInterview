select * from tbl014Students

Create table tbl014Students
(
     ID int primary key identity,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
Go

delete from tbl014Students

Insert into tbl014Students values ('Mark', 'Male', 60000)
Insert into tbl014Students values ('Steve', 'Male', 45000)
Insert into tbl014Students values ('James', 'Male', 70000)
Insert into tbl014Students values ('Mike', 'Male', 45000)
Insert into tbl014Students values ('Mary', 'Female', 30000)
Insert into tbl014Students values ('Valarie', 'Female', 35000)
Insert into tbl014Students values ('John', 'Male', 80000)
Go

select * from tbl014Students
where Name like 's%'

-- using CHARINDEX
select * from tbl014Students where CHARINDEX('m', Name)=1
-- using left
select * from tbl014Students where left(Name, 1)='m'
-- using substring
select * from tbl014Students where SUBSTRING(Name, 1, 1)='m'