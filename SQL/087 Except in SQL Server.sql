--video 087: Duration: 05:13 Except in SQL Server

--**EXCEPT operator returns unique rows from the left query that aren't in the right query's results**

--* Introduced in SQL Server 2005
--* The number and the order of the columns must be the same in both the queries
--* The data types must be same or compatible
--* This is similar to minus operator in oracle

Create Table tbl087TableA
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go

Insert into tbl087TableA values (1, 'Mark', 'Male')
Insert into tbl087TableA values (2, 'Mary', 'Female')
Insert into tbl087TableA values (3, 'Steve', 'Male')
Insert into tbl087TableA values (4, 'John', 'Male')
Insert into tbl087TableA values (5, 'Sara', 'Female')
Go

Create Table tbl087TableB
(
    Id int primary key,
    Name nvarchar(50),
    Gender nvarchar(10)
)
Go


Insert into tbl087TableB values (1, 'Mark', 'Male')
Insert into tbl087TableB values (2, 'Mary', 'Female')
Insert into tbl087TableB values (3, 'Steve-update', 'Male')
Insert into tbl087TableB values (4, 'John-update', 'Male')
Insert into tbl087TableB values (5, 'Sara-update', 'Female')
Go


select Id, Name, Gender from tbl087TableA
except 
select Id, Name, Gender from tbl087TableB
 

select Id, Name from tbl087TableA
except 
select Id, Name, Gender from tbl087TableB

--Msg 205, Level 16, State 1, Line 47
--All queries combined using a UNION, INTERSECT or EXCEPT operator must have an equal number of expressions in their target lists.

--Completion time: 2026-09-23T06:20:59.7633857+05:30


select Name, Id from tbl087TableA
except 
select Id, Name from tbl087TableB

--Msg 245, Level 16, State 1, Line 57
--Conversion failed when converting the nvarchar value 'Mark' to data type int.

--Completion time: 2026-09-23T06:21:35.2178373+05:30