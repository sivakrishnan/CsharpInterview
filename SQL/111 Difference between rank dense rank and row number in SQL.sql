--video 111: Duration: 04:42 Difference between rank dense rank and row number in SQL

SELECT emp.Name, emp.Salary, emp.Gender,
ROW_NUMBER() OVER (ORDER BY emp.Salary DESC) AS RowNumber,
RANK() OVER (ORDER BY emp.Salary DESC) AS [Rank],
DENSE_RANK() OVER (ORDER BY emp.Salary DESC) AS DenseRank
FROM tbl108Employees emp