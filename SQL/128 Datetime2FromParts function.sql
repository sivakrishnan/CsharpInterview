--video 128: Duration: 05:27 Datetime2FromParts function in SQL Server

--**DateTime2FromParts function**

--* Introduced in SQL Server 2012
--* Returns DateTime2
--* The data type of all the parameters is integer
--* If invalid argument values are specified, the function returns an error
--* If any of the required arguments are NULL, the function returns null
--* If the precision argument is null, the function returns an error

--**Syntax:** `
--DATETIME2FROMPARTS(year, month, day, hour, minute, seconds, fractions, precision)`


SELECT DATETIME2FROMPARTS (2015, 11, 15, 20, 55, 55, 0, 0) AS [DateTime2]

