--video 126: Duration: 03:53 DATEFROMPARTS function in SQL Server


--DATEFROMPARTS function

--	Introduced in SQL Server 2012
--	Returns a date value for the specified year, month, and day  
--	The data type of all the 3 parameters (year, month, and day) is integer  
--	If invalid argument values are specified, the function returns an error  
--	If any of the arguments are NULL, the function returns null  

--Syntax : DATEFROMPARTS ( year, month, day )

--Example : All the arguments have valid values, so DATEFROMPARTS function returns the expected date

--SELECT DATEFROMPARTS ( 2015, 10, 25) AS [Date]

--Output Table: Date25/10/2015


SELECT DATEFROMPARTS ( 2015, 10, 25) AS [Date]


SELECT DATEFROMPARTS ( 2015, 13, 25) AS [Date]


--output:

--Msg 289, Level 16, State 1, Line 24
--Cannot construct data type date, some of the arguments have values which are not valid.

--Completion time: 2026-09-02T06:43:56.0701554+05:30


SELECT DATEFROMPARTS ( 2015, 13, NULL) AS [Date]

--output : NULL


select EOMONTH(DATEFROMPARTS ( 2015, 10, 25)) -- 2015-10-31

--DATETIMEFROMPARTS : Returns DateTime  

--Syntax : DATETIMEFROMPARTS (year, month, day, hour, minute, seconds, milliseconds)

select  DATETIMEFROMPARTS (2026, 09, 02, 06, 49, 58, 012) as datetimes -- 2026-09-02 06:49:58.013

--SMALLDATETIMEFROMPARTS : Returns SmallDateTime  

--Syntax : SMALLDATETIMEFROMPARTS (year, month, day, hour, minute)

select  SMALLDATETIMEFROMPARTS (2026, 09, 02, 06, 49) as datetimes -- 2026-09-02 06:49:00