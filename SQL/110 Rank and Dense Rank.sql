--video 110: Duration: 10:07 Rank and Dense Rank


select emp.Name, emp.Gender, emp.Salary
, rank() over(order by emp.Salary desc) as RankOnSalary
, dense_rank() over(order by emp.Salary desc) as DenseRankOnSalary
from tbl108Employees emp

-- introduce partition

select emp.Name, emp.Gender, emp.Salary
, rank() over(partition by emp.gender order by emp.Salary desc) as RankOnSalary
, dense_rank() over(partition by emp.gender order by emp.Salary desc) as DenseRankOnSalary
from tbl108Employees emp 