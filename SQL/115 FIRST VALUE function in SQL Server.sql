--video 115: Duration: 02:47 FIRST VALUE function in SQL Server

--FIRST_VALUE function

--	Introduced in SQL Server 2012
--	Retrieves the first value from the specified column
--	ORDER BY clause is required
--	PARTITION BY clause is optional

--Syntax : FIRST_VALUE(Column_Name) OVER (ORDER BY Col1, Col2, ...)


select * from Employees;

select FirstName, LastName, Gender, Salary
, FIRST_VALUE(FirstName+' '+LastName) over (order by salary) as FirstValue
from Employees;


select FirstName, LastName, Gender, Salary
, FIRST_VALUE(FirstName+' '+LastName) over (partition by gender order by salary) as FirstValue
from Employees;