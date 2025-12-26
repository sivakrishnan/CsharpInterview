--video 70: Duration: 07:33 Concurrency Problems:

--1) Dirty Reads
--2) Lost Updates
--3) Non-Repeatable Reads
--4) Phantom Reads

--SQL Server Isolation Levels

--1) Read Uncommitted
--2) Read Committed
--3) Repeatable Reads
--4) Snapshot
--5) Serializable


--Isolation Level	|   Dirty Reads |  Lost Update |  Nonrepeatable Reads |  Phantom Reads
--------------------------------------------------------------------------------------------
-- Read Uncommitted |		Yes            Yes               Yes                Yes
--------------------------------------------------------------------------------------------
-- Read Committed   |		No             Yes               Yes                Yes
--------------------------------------------------------------------------------------------
-- Repeatable Read  |		No              No               No                 Yes
--------------------------------------------------------------------------------------------
-- Snapshot			|		No              No               No                  No
--------------------------------------------------------------------------------------------
-- Serializable     |		No              No               No                  No
--------------------------------------------------------------------------------------------

-- lower Isolation Level (Read Uncommitted) ----> increase no of concurrent transaction to be executed but possible to all type of cocurrencry problems
-- Higher Isolation Level (Serializable)	----> decrease no of concurrent transaction to be executed but sort out all type of cocurrencry problems

---------------------------------------------------------------------------------------------------------------------------------------------------------------------
--video 71: Duration: 08:49 Dirty Reads:

Create table tblInventory
(
    Id int identity primary key,
    Product nvarchar(100),
    ItemsInStock int
)
Go

Insert into tblInventory values ('iPhone', 10)


--Transaction-1
begin transaction
update tblInventory set ItemsInStock=9 where Id=1

--bill the customer
waitfor delay '00:00:15'
rollback transaction

--problem
select * from tblInventory with (nolock)   -- give the ItemInStock=9 (Dirty Reads)

--Transaction-2 some time it will show as 9 after the transaction-1 rolledback it will show as 10
set transaction isolation level read uncommitted
select * from tblInventory



--video 72: Duration: 08:28 Lost Update:
--select * from tblInventory
--update tblInventory set ItemsInStock=10 where id=1
--transaction 1
begin transaction
declare @ItemsInStock int

select @ItemsInStock=ItemsInStock from tblInventory where id=1

waitfor delay '00:00:10'
set @ItemsInStock=@ItemsInStock-1

update tblInventory set ItemsInStock=@ItemsInStock where id=1

print(@ItemsInStock)
commit transaction

--transaction 2

begin transaction
declare @ItemsInStock int

select @ItemsInStock=ItemsInStock from tblInventory where id=1

waitfor delay '00:00:1'
set @ItemsInStock=@ItemsInStock-2

update tblInventory set ItemsInStock=@ItemsInStock where id=1

print(@ItemsInStock)
commit transaction

-- if you make two transaction as 
-- set transaction isolation level repeatable read
-- Transaction (Process ID 52) was deadlocked on lock resources with another process and has been chosen as the deadlock victim. Return the transaction.


--video 73: Duration: 05:44 Non-Repeatable read
--select * from tblInventory
--update tblInventory set ItemsInStock=10 where id=1
--Transaction-1
set transaction isolation level repeatable read
begin transaction
select ItemsInStock from tblInventory where id=1
waitfor delay '00:00:15'
select ItemsInStock from tblInventory where id=1
Commit transaction

--Transaction-2

update tblInventory set ItemsInStock=5 where id=1


--video 74: Duration: 06:37 Phantom read

-- Phantom read happens when one transaction executes a query twice and it gets a different number of rows in the result set each time.


Create table tblEmployees
(
    Id int primary key,
    Name nvarchar(50)
)
Go


Insert into tblEmployees values(1,'Mark')
Insert into tblEmployees values(3, 'Sara')
Insert into tblEmployees values(100, 'Mary')


-- Transaction 1
Begin Transaction
Select * from tblEmployees where Id between 1 and 3
-- Do Some work
waitfor delay '00:00:10'
Select * from tblEmployees where Id between 1 and 3
Commit Transaction

-- Transaction 2
Insert into tblEmployees values(2, 'Marcus')