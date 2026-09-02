--video 090: Duration: 03:49 Difference between union intersect and except in sql server
select * from tbl001Employee
select * from tbl004Employee

-- union all
select emp1.FirstName, emp1.LastName, emp1.Gender, emp1.Salary from tbl001Employee emp1
union all
select emp2.FirstName, emp2.LastName, emp2.Gender, emp2.Salary from tbl004Employee emp2

-- union
select emp1.FirstName, emp1.LastName, emp1.Gender, emp1.Salary from tbl001Employee emp1
union
select emp2.FirstName, emp2.LastName, emp2.Gender, emp2.Salary from tbl004Employee emp2

-- intersect
select emp1.FirstName, emp1.LastName, emp1.Gender, emp1.Salary from tbl001Employee emp1
intersect
select emp2.FirstName, emp2.LastName, emp2.Gender, emp2.Salary from tbl004Employee emp2

-- except

select emp1.FirstName, emp1.LastName, emp1.Gender, emp1.Salary from tbl001Employee emp1
except
select emp2.FirstName, emp2.LastName, emp2.Gender, emp2.Salary from tbl004Employee emp2
