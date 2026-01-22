--video 46: Duration: 22:26 Instead of update trigger 


select * from tbl045Employee
select * from tbl045Department


select * from vw045EmployeeDetails


-- before creating instead of update trigger

drop trigger tr_vw045EmployeeDetails_InsteadOfUpdate

Update vw045EmployeeDetails set DeptName = 'IT' where Id = 1

select * from tbl045Employee
select * from tbl045Department -- problem is HR is updated to IT

Update tbl045Department set DeptName = 'HR' where DeptId = 3

Create Trigger tr_vw045EmployeeDetails_InsteadOfUpdate
on vw045EmployeeDetails
instead of update
as
Begin
 -- if EmployeeId is updated
 if(Update(Id))
 Begin
  Raiserror('Id cannot be changed', 16, 1)
  Return
 End
 
 -- If DeptName is updated
 if(Update(DeptName)) 
 Begin
  Declare @DeptId int

  Select @DeptId = DeptId
  from tbl045Department
  join inserted
  on inserted.DeptName = tbl045Department.DeptName
  
  if(@DeptId is NULL )
  Begin
   Raiserror('Invalid Department Name', 16, 1)
   Return
  End
  
  Update tbl045Employee set DepartmentId = @DeptId
  from inserted
  join tbl045Employee
  on tbl045Employee.Id = inserted.id
 End
 
 -- If gender is updated
 if(Update(Gender))
 Begin
  Update tbl045Employee set Gender = inserted.Gender
  from inserted
  join tbl045Employee
  on tbl045Employee.Id = inserted.id
 End
 
 -- If Name is updated
 if(Update(Name))
 Begin
  Update tbl045Employee set Name = inserted.Name
  from inserted
  join tbl045Employee
  on tbl045Employee.Id = inserted.id
 End
End





select * from tbl045Employee
select * from tbl045Department 
select * from vw045EmployeeDetails

Update vw045EmployeeDetails set DeptName = 'HR' where Id = 1

select * from vw045EmployeeDetails


Update vw045EmployeeDetails 
set Name = 'Johny', Gender = 'Female', DeptName = 'IT' 
where Id = 1


Update vw045EmployeeDetails 
set Gender = 'Male', DeptName = 'Admin' 
where Id >= 10