
--video 089: Duration: 05:28 Intersect operator in sql server


	--Intersect operator retrieves the common records from both the left and the right query of the Intersect operator 
	--Introduced in SQL Server 2005  
	--The number and the order of the columns must be same in both the queries  
	--The data types must be same or at least compatible

--INTERSECT v/s INNER JOIN

--	INTERSECT filters duplicates and returns only DISTINCT rows that are common between the LEFT and Right Query, where as INNER JOIN does not filter the duplicates

--	To make INNER JOIN behave like INTERSECT operator use the DISTINCT operator

--	INNER JOIN treats two NULLS as two different values. So if you are joining two tables based on a nullable column and if both tables have NULLs in that joining column then, 
--	INNER JOIN will not include those rows in the result-set, where as INTERSECT treats two NULLs as a same value and it returns all matching rows


select * from tbl001Employee
select * from tbl004Employee


select emp1.FirstName, emp1.LastName, emp1.Gender, emp1.Salary from tbl001Employee emp1
intersect
select emp2.FirstName, emp2.LastName, emp2.Gender, emp2.Salary from tbl004Employee emp2