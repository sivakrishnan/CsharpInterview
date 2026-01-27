--video 113: Duration: 05:09 NTILE function in SQL Server

SELECT emp.Name, emp.Salary, emp.Gender
, NTILE(3) over (order by emp.salary) AS Ntiling
FROM tbl108Employees emp



-- total row available is 10 but NTILE with 11
SELECT emp.Name, emp.Salary, emp.Gender
, NTILE(11) over (order by emp.salary) AS Ntiling
FROM tbl108Employees emp

-- intro to partition 
SELECT emp.Name, emp.Salary, emp.Gender
, NTILE(3) over (partition by emp.gender order by emp.salary) AS Ntiling
FROM tbl108Employees emp


