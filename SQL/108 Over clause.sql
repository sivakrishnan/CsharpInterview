--video 108: Duration: 09:12 Over Clause

Create Table tbl108Employees
(
     Id int primary key,
     Name nvarchar(50),
     Gender nvarchar(10),
     Salary int
)


Insert Into tbl108Employees Values (1, 'Mark', 'Male', 5000)
Insert Into tbl108Employees Values (2, 'John', 'Male', 4500)
Insert Into tbl108Employees Values (3, 'Pam', 'Female', 5500)
Insert Into tbl108Employees Values (4, 'Sara', 'Female', 4000)
Insert Into tbl108Employees Values (5, 'Todd', 'Male', 3500)
Insert Into tbl108Employees Values (6, 'Mary', 'Female', 5000)
Insert Into tbl108Employees Values (7, 'Ben', 'Male', 6500)
Insert Into tbl108Employees Values (8, 'Jodi', 'Female', 7000)
Insert Into tbl108Employees Values (9, 'Tom', 'Male', 5500)
Insert Into tbl108Employees Values (10, 'Ron', 'Male', 5000)

-- Gender count, Average Salary by Gender, Min Salary by Gender, Max Salary by Gender


select emp.Gender, count(*) as GenderCount, AVG(emp.Salary) as AvgSal, Min(emp.Salary) as MinSal, Max(emp.Salary) as MaxSal
from tbl108Employees emp
group by emp.Gender


-- Non Aggregate column needed along with Aggregate columns


select emp.Name, emp.Gender, count(*) as GenderCount, AVG(emp.Salary) as AvgSal, Min(emp.Salary) as MinSal, Max(emp.Salary) as MaxSal
from tbl108Employees emp
group by emp.Gender

--Msg 8120, Level 16, State 1, Line 34
--Column 'tbl108Employees.Name' is invalid in the select list because it is not contained in either an aggregate function or the GROUP BY clause.
--Completion time: 2026-01-25T23:17:44.9579867+05:30


select emp.Name, emp.Salary, emp.Gender
, genders.GenderCount, genders.AvgSal, genders.MinSal, genders.MaxSal
from tbl108Employees emp
inner join
(
	select emp.Gender, count(*) as GenderCount, AVG(emp.Salary) as AvgSal, Min(emp.Salary) as MinSal, Max(emp.Salary) as MaxSal
	from tbl108Employees emp
	group by emp.Gender
)genders on genders.Gender=emp.Gender


select emp.Name, emp.Salary, emp.Gender
, count(emp.Gender) over(partition by emp.Gender) as GenderCount
, AVG(emp.salary) over(partition by emp.Gender) as AvgSal
, Min(emp.salary) over(partition by emp.Gender) as MinSal
, Max(emp.salary) over(partition by emp.Gender) as MaxSal
from tbl108Employees emp



