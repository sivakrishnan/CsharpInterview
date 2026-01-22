--video 47: Duration: 10:02 Instead of delete trigger 


select * from tbl045Employee
select * from tbl045Department


select * from vw045EmployeeDetails



Delete from vw045EmployeeDetails where Id = 1

--Msg 4405, Level 16, State 1, Line 12
--View or function 'vw045EmployeeDetails' is not updatable because the modification affects multiple base tables.

--Completion time: 2026-01-22T06:12:15.2813854+05:30


Create Trigger tr_vw045EmployeeDetails_InsteadOfDelete
on vw045EmployeeDetails
instead of delete
as
Begin

	 select * from deleted
	 Delete tbl045Employee 
	 from tbl045Employee
	 join deleted
	 on tbl045Employee.Id = deleted.Id
 
 --Subquery
 --Delete from tbl045Employee 
 --where Id in (Select Id from deleted)
End


Delete from vw045EmployeeDetails where Id = 1


select * from tbl045Employee
select * from tbl045Department


select * from vw045EmployeeDetails



Delete from vw045EmployeeDetails where Id in (5, 6)

