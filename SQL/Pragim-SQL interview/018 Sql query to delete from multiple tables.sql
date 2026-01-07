Create table tbl018Departments
(
       Id int primary key identity,
       [Name] nvarchar(50)
)
Go

Create table tbl018Employees
(
       Id int primary key identity,
       [Name] nvarchar(50),
       DeptId int foreign key references tbl018Departments(Id)
)
Go 

Insert into tbl018Departments values ('IT')
Insert into tbl018Departments values ('HR')
Go 

Insert into tbl018Employees values ('Mark', 1)
Insert into tbl018Employees values ('Mary', 1)
Insert into tbl018Employees values ('John', 2)
Insert into tbl018Employees values ('Sara', 2)
Insert into tbl018Employees values ('Steve', 2)

select * from tbl018Departments;
delete from tbl018Departments where Id=1

--Msg 547, Level 16, State 0, Line 27
--The DELETE statement conflicted with the REFERENCE constraint "FK__tbl018Emp__DeptI__17F790F9". The conflict occurred in database "SQLTutorial", table "dbo.tbl018Employees", column 'DeptId'.
--The statement has been terminated.

Alter table tbl018Employees drop constraint FK__tbl018Emp__DeptI__17F790F9

Alter table tbl018Employees
add constraint FK_Dept_tbl018Employees_Cascade_Delete
foreign key (DeptId) references tbl018Departments(Id) on delete cascade


select * from tbl018Departments;
select * from tbl018Employees;
delete from tbl018Departments where Id=1


-----------------------------------------------------------------------------------------------------------------

Create table tbl018Gender
(
       Id int primary key identity,
       tbl018Gender nvarchar(20)
)
Go 

Create table tbl018Teachers
(
       Id int primary key identity,
       [Name] nvarchar(50),
       GenderId int foreign key references tbl018Gender(Id) on delete cascade
)
Go

Create table tbl018Students
(
       Id int primary key identity,
       [Name] nvarchar(50),
       GenderId int foreign key references tbl018Gender(Id) on delete cascade
)
Go

Insert into tbl018Gender values ('Male')
Insert into tbl018Gender values ('Female')
Go

Insert into tbl018Teachers values ('Mark', 1)
Insert into tbl018Teachers values ('John', 1)
Insert into tbl018Teachers values ('Mary', 2)
Insert into tbl018Teachers values ('Sara', 2)
Insert into tbl018Teachers values ('Flo', 2)
Go

Insert into tbl018Students values ('David', 1)
Insert into tbl018Students values ('Ron', 1)
Insert into tbl018Students values ('Jess', 2)
Insert into tbl018Students values ('Tara', 2)
Insert into tbl018Students values ('Innes', 2)
Go

Alter table tbl018Teachers
add constraint FK_tbl018Gender_Employees
foreign key (GenderId) references tbl018Gender(Id)

Alter table tbl018Students
add constraint FK_tbl018Gender_tbl018Students
foreign key (GenderId) references tbl018Gender(Id)


drop table tbl018Students;

select * from tbl018Gender;
select * from tbl018Students;
select * from tbl018Teachers;


Begin Try

       Begin Tran 

       Declare @GenderToDelete int = 2 

       -- Delete first from child tables
       Delete from tbl018Teachers where GenderId = @GenderToDelete
       Delete from tbl018Students where GenderId = @GenderToDelete 

       -- Finally Delete from parent table
       Delete from tbl018Gender where Id = @GenderToDelete 

       Commit Tran
End Try 

Begin Catch

       Rollback Tran


End Catch