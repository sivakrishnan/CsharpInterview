Create table tbl001Employee
(
     ID int primary key identity,
     FirstName nvarchar(50),
     LastName nvarchar(50),
     Gender nvarchar(50),
     Salary int
)
GO


Insert into tbl001Employee values ('Ben', 'Hoskins', 'Male', 70000)
Insert into tbl001Employee values ('Mark', 'Hastings', 'Male', 60000)
Insert into tbl001Employee values ('Steve', 'Pound', 'Male', 45000)
Insert into tbl001Employee values ('Ben', 'Hoskins', 'Male', 70000)
Insert into tbl001Employee values ('Philip', 'Hastings', 'Male', 45000)
Insert into tbl001Employee values ('Mary', 'Lambeth', 'Female', 30000)
Insert into tbl001Employee values ('Valarie', 'Vikings', 'Female', 35000)
Insert into tbl001Employee values ('John', 'Stanmore', 'Male', 80000)
GO

select * from tbl001Employee order by Salary desc;


select Max(salary) from tbl001Employee


---find out 2nd highest salary using subquery
select MAX(salary) from tbl001Employee
where Salary<(select Max(salary) from tbl001Employee)


---find out nth highest salary using subquery
select top 1 result.Salary from (
select distinct top 3 Salary 
from tbl001Employee 
order by Salary desc
)result 
order by result.Salary 

--insert into tbl001Employee values('test', 5500, 1)

---find out nth highest salary using CTE
;with Result as
(
	select Salary, DENSE_RANK() over (order by salary desc) as RankedSalary 
	from tbl001Employee
)
select distinct Salary from Result where Result.RankedSalary=3