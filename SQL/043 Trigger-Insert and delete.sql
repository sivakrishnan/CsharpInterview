--video 43: Duration: 17:44 Triggers

--types of triggers

--1) DML Triggers
--2) DDL Triggers
--3) Logon Triggers

-- DML Triggers: AFTER Triggers, INSTEAD OF Triggers


CREATE TABLE tbl043Employee
(
  Id int Primary Key,
  Name nvarchar(30),
  Salary int,
  Gender nvarchar(10),
  DepartmentId int
)

Insert into tbl043Employee values (1,'John', 5000, 'Male', 3)
Insert into tbl043Employee values (2,'Mike', 3400, 'Male', 2)
Insert into tbl043Employee values (3,'Pam', 6000, 'Female', 1)
Insert into tbl043Employee values (4,'Pam-trigger', 6000, 'Female', 1)

CREATE TABLE tbl043EmployeeAudit
(
  Id int identity(1,1) primary key,
  AuditData nvarchar(1000)
)


create TRIGGER tr_tbl043Employee_ForInsert 
ON tbl043Employee
FOR INSERT
AS
BEGIN
 Declare @Id int
 Select @Id = Id from inserted

 select * from inserted
 
 insert into tbl043EmployeeAudit 
 values('New employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is added at ' + cast(Getdate() as nvarchar(20)))
END

select * from tbl043Employee
select * from tbl043EmployeeAudit

-- IMPORTANT NOTES
-- our trigger support for only one row inserted, for the below insert statement will capture the first row in audit table 

insert into tbl043Employee (Id, Name, Salary, Gender, DepartmentId)
select 10 as Id,'Pam-10' as Name, 6000 as Salary, 'Female' as Gender, 1 as DepartmentId
union
select 11 as Id,'Pam-11' as Name, 6000 as Salary, 'Female' as Gender, 1 as DepartmentId
union
select 12 as Id,'Pam-12' as Name, 6000 as Salary, 'Female' as Gender, 1 as DepartmentId
union
select 13 as Id,'Pam-13' as Name, 6000 as Salary, 'Female' as Gender, 1 as DepartmentId

drop trigger tr_tbl043Employee_ForInsert

--------------------------------------------------------------------------------------------------------------------------------------
drop trigger tr_tblEMployee_ForDelete

create TRIGGER tr_tbl043EMployee_ForDelete
ON tbl043Employee
FOR DELETE
AS
BEGIN
 Declare @Id int
 Select @Id = Id from deleted

 select * from deleted
 
 if(@Id is null)
 begin
		insert into tbl043EmployeeAudit 
		values('Data Not Available')
 end
 else
 begin
		insert into tbl043EmployeeAudit 
		values('An existing employee with Id  = ' + Cast(@Id as nvarchar(5)) + ' is deleted at ' + Cast(Getdate() as nvarchar(20)))
 end

END


delete tbl043Employee where Id=4

-- IMPORTANT NOTES
-- our trigger support for only one row deleted, for the below delete statement will capture the first row in audit table 

delete from tbl043Employee where Id>=10

select * from tbl043Employee
select * from tbl043EmployeeAudit

-- when try to delete a row which is not available in the table, then null will be inserted 
--1	New employee with Id  = 4 is added at Jan 22 2026  4:05AM
--2	An existing employee with Id  = 4 is deleted at Jan 22 2026  4:09AM
--3	NULL