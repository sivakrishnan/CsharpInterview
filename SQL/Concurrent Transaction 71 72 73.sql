--video 70: Concurrency Problems:

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

--video 71: Dirty Reads:

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

--Transaction-2 some time it will show as 9 after the transaction-1 rolledback it will show as 10
set transaction isolation level read uncommitted
select * from tblInventory



--video 72: Lost Update:
--select * from tblInventory
--update tblInventory set ItemsInStock=10 where id=1
--transaction 1
begin transaction
declare @ItemsInStock int

select @ItemsInStock=ItemsInStock from tblInventory where id=1

waitfor delay '00:00:15'
set @ItemsInStock=@ItemsInStock-1

update tblInventory set ItemsInStock=@ItemsInStock where id=1

print(@ItemsInStock)
commit transaction

--transaction 2

begin transaction
declare @ItemsInStock int

select @ItemsInStock=ItemsInStock from tblInventory where id=1

waitfor delay '00:00:15'
set @ItemsInStock=@ItemsInStock-1

update tblInventory set ItemsInStock=@ItemsInStock where id=1

print(@ItemsInStock)
commit transaction


--video 73 Non-Repeatable read
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