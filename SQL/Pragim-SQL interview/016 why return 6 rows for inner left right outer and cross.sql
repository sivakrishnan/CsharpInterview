Create Table tbl016TableA
(
       ColumnA int
)
Go

Create Table tbl016TableB
(
       ColumnB int
)
Go

Insert into tbl016TableA Values (1)
Insert into tbl016TableA Values (1)
Go 

Insert into tbl016TableB Values (1)
Insert into tbl016TableB Values (1)
Insert into tbl016TableB Values (1)
Go

Select ColumnA, ColumnB
from tbl016TableA
inner join tbl016TableB
on tbl016TableA.ColumnA = tbl016TableB.ColumnB

Select ColumnA, ColumnB
from tbl016TableA
left outer join tbl016TableB
on tbl016TableA.ColumnA = tbl016TableB.ColumnB

Select ColumnA, ColumnB
from tbl016TableA
right outer join tbl016TableB
on tbl016TableA.ColumnA = tbl016TableB.ColumnB

Select ColumnA, ColumnB
from tbl016TableA
full outer join tbl016TableB
on tbl016TableA.ColumnA = tbl016TableB.ColumnB 

Select ColumnA, ColumnB
from tbl016TableA
cross join tbl016TableB