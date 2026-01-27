--video 112: Duration: 06:22 Calculate running total in SQL Server 2012

SELECT emp.Name, emp.Salary, emp.Gender
, Sum(emp.Salary) OVER () AS Total
, Sum(emp.Salary) OVER (ORDER BY emp.Id) AS RunningTotal
FROM tbl108Employees emp



SELECT emp.Id, emp.Name, emp.Salary, emp.Gender
, Sum(emp.Salary) OVER () AS OverAllTotal
, Sum(emp.Salary) OVER (partition by emp.gender) AS TotalByGender
, Sum(emp.Salary) OVER (ORDER BY emp.Id) AS RunningTotal
FROM tbl108Employees emp
-- order by emp.Gender