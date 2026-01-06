select * from tblEmployee


select * from tblEmployee where EmployeeName in ('John', 'Pam', 'Sam')

declare @EmployeeNameList varchar(max)='John,Pam,Sam'
select * from tblEmployee where EmployeeName in (@EmployeeNameList)


declare @EmployeeNameLists varchar(max)='John,Pam,Sam'
select * from tblEmployee where EmployeeName in (select * from string_split(@EmployeeNameLists, ','))



select * from tblEmployee e
inner join string_split(@EmployeeNameLists, ',') empName on e.EmployeeName=empName.value