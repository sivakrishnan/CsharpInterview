--video 114: Duration: 07:26 Lead and Lag functions in SQL Server 2012

--Lead and Lag functions  

--	Introduced in SQL Server 2012  
--	Lead function is used to access subsequent row data along with current row data  
--	Lag function is used to access previous row data along with current row data  
--	ORDER BY clause is required
--	PARTITION BY clause is optional
	
	
--Syntax :
	
--LEAD(Column_Name, Offset, Default_Value) OVER (ORDER BY Col1, Col2, ...)
--LAG (Column_Name, Offset, Default_Value) OVER (ORDER BY Col1, Col2, ...)


--Field						Description
--------------------------------------------------
--Offset					Number of rows to lead or lag

--Default_Value				The default value to return if the number of rows to lead or lag goes 
--							beyond first row or last row in a table or partition. 
--							If default value is not specified NULL is returned.


select * from Employees;

select FirstName, LastName, Gender, Salary
, LEAD(salary, 2, 0)over(order by salary) as LeadSalary
, LAG(salary, 1, 0)over(order by salary) as LeadSalary
from Employees