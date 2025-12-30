select * from tblEmployee


select * from tblEmployee
where EmployeeName like 's%'

-- using CHARINDEX
select * from tblEmployee where CHARINDEX('s', employeename)=1
-- using left
select * from tblEmployee where left(employeename, 1)='s'
-- using substring
select * from tblEmployee where SUBSTRING(employeename, 1, 1)='s'