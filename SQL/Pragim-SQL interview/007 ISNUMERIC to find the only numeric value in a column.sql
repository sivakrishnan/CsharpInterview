select * from tbl007TestTable

Create Table tbl007TestTable
(
     ID int identity primary key,
     Value nvarchar(50)
)

Insert into tbl007TestTable values ('123')
Insert into tbl007TestTable values ('ABC')
Insert into tbl007TestTable values ('DEF')
Insert into tbl007TestTable values ('901')
Insert into tbl007TestTable values ('JKL')



--insert into tbl007TestTable values('100', 5500, 1)

select value from tbl007TestTable where ISNUMERIC(value)=1
