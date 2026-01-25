--video 109: Duration: 07:23 Row Number Functions


select emp.Name, emp.Gender, emp.Salary
, row_number() over(partition by emp.Gender order by emp.Gender) as GenderCount
from tbl108Employees emp