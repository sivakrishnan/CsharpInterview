
--- part 30 scalar function
create function CalculateAge
(
	@DOB Date
)
returns int
as
begin

declare @Age int

set @Age= DATEDIFF(year, @DOB, GETDATE()) - 
				case
					when (MONTH(@DOB)> MONTH(getdate())) or
						 (MONTH(@DOB)=MONTH(getdate()) and DAY(@DOB)>DAY(getdate()))
					then 1
					else 0
				end
return @Age
end

select CalculateAge('03-19-1990')

--Msg 195, Level 15, State 10, Line 23
--'CalculateAge' is not a recognized built-in function name.


select  dbo.CalculateAge('03-19-1990')


select * from tblEmployee

alter table tblEmployee
add DateOfBirth datetime

update tblEmployee set DateOfBirth='1990-10-11' where Id=1
update tblEmployee set DateOfBirth='1998-09-13' where Id=2
update tblEmployee set DateOfBirth='1997-08-19' where Id=3
update tblEmployee set DateOfBirth='1996-07-15' where Id=4
update tblEmployee set DateOfBirth='1993-06-18' where Id=5
update tblEmployee set DateOfBirth='1992-05-17' where Id=6
update tblEmployee set DateOfBirth='1991-04-16' where Id=7
update tblEmployee set DateOfBirth='1960-03-15' where Id=8

select *, dbo.CalculateAge(DateOfBirth) as Age
from tblEmployee
where dbo.CalculateAge(DateOfBirth) > 30


sp_helptext CalculateAge




--- part 30 inline table value function

select * from tblEmployee
select * from Gender
select * from tblDepartment

alter function fn_EmployeeByGender( @Gender varchar(10))
returns table
as
return (select emp.Id, emp.EmployeeName, g.GenderName, emp.DeptId from tblEmployee emp
inner join Gender g on g.GenderId=emp.GenderId
where g.GenderName=@Gender)

select * from dbo.fn_EmployeeByGender('male')


select e.*, d.DeptName from dbo.fn_EmployeeByGender('male') e
inner join tblDepartment d on d.DeptId=e.DeptId



update dbo.fn_EmployeeByGender('male') set EmployeeName='updated name from line table value function' where Id=3



--- part 32 multi statement table valued function


alter function fn_MSTV_GetEmployee(@Gender varchar(20))
returns @fn_MSTV_Employee table (Id int, EmployeeName varchar(500), GenderName varchar(500), DeptId int)
as
begin
	insert into @fn_MSTV_Employee
	select emp.Id, emp.EmployeeName, g.GenderName, emp.DeptId from tblEmployee emp
	inner join Gender g on g.GenderId=emp.GenderId
	where g.GenderName=@Gender
	return
end


select * from dbo.fn_MSTV_GetEmployee('male')



-- 33 importent concepts in functions

--deterministic function 

select SQUARE(3)

--non deterministic function 

select getdate()

-- enable encryption

alter function fn_MSTV_GetEmployee(@Gender varchar(20))
returns @fn_MSTV_Employee table (Id int, EmployeeName varchar(500), GenderName varchar(500), DeptId int)
with encryption, schemabinding
as
begin
	insert into @fn_MSTV_Employee
	select emp.Id, emp.EmployeeName, g.GenderName, emp.DeptId 
	from dbo.tblEmployee emp
	inner join dbo.Gender g on g.GenderId=emp.GenderId
	where g.GenderName=@Gender
	return
end

sp_helptext fn_MSTV_GetEmployee

drop table tblEmployee

--Msg 3729, Level 16, State 1, Line 127
--Cannot DROP TABLE 'tblEmployee' because it is being referenced by object 'fn_MSTV_GetEmployee'.

--Completion time: 2024-12-30T06:24:52.4292649+05:30



--The text for object 'fn_MSTV_GetEmployee' is encrypted.

--Completion time: 2024-12-30T06:19:50.7466231+05:30
