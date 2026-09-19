-- --video 118: Duration: 05:34 LAST VALUE function in SQL Server

--**LAST_VALUE function**

--* **Introduced in SQL Server 2012**
--* **Retrieves the last value from the specified column**
--* **ORDER BY clause is required**
--* **PARTITION BY clause is optional**
--* **ROWS or RANGE clause is optional, but for it to work correctly you may have to explicitly specify a value**

--**Syntax:** `LAST_VALUE(Column_Name) OVER (ORDER BY Col1, Col2, ...)`

select * from Employees;

select FirstName, LastName, Gender, Salary
, FIRST_VALUE(FirstName+' '+LastName) over (order by salary) as FirstValue
, LAST_VALUE(FirstName+' '+LastName) over(order by salary rows between unbounded preceding and unbounded following) as LastValue
from Employees;