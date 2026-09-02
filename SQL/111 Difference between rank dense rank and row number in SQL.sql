--video 111: Duration: 04:42 Difference between rank dense rank and row number in SQL

SELECT emp.Name, emp.Salary, emp.Gender,
ROW_NUMBER() OVER (ORDER BY emp.Salary DESC) AS RowNumber,
RANK() OVER (ORDER BY emp.Salary DESC) AS [Rank],
DENSE_RANK() OVER (ORDER BY emp.Salary DESC) AS DenseRank
-- , ROW_NUMBER() over (partition by emp.Gender order by emp.Salary asc) Partition_RowNumber
FROM tbl108Employees emp


SELECT emp.Name, emp.Salary, emp.Gender
, ROW_NUMBER() over (partition by emp.Gender order by emp.Salary asc) Partition_RowNumber
FROM tbl108Employees emp