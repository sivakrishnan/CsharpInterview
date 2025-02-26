Create Table tblProduct
(
 ProductId int primary key,
 Name nvarchar(20),
 UnitPrice int
)

-- Script to pouplate tblProduct, with sample data
Insert into tblProduct Values(1, 'Books', 20)
Insert into tblProduct Values(2, 'Pens', 14)
Insert into tblProduct Values(3, 'Pencils', 11)
Insert into tblProduct Values(4, 'Clips', 10)

-- Script to create table tblProductSales
Create Table tblProductSales
(
 ProductId int,
 QuantitySold int
)

-- Script to pouplate tblProductSales, with sample data
Insert into tblProductSales values(1, 10)
Insert into tblProductSales values(3, 23)
Insert into tblProductSales values(4, 21)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 13)
Insert into tblProductSales values(3, 12)
Insert into tblProductSales values(4, 13)
Insert into tblProductSales values(1, 11)
Insert into tblProductSales values(2, 12)
Insert into tblProductSales values(1, 14)


select * from tblProduct
select * from tblProductSales


select p.Name, SUM(ISNULL((ps.QuantitySold*p.UnitPrice), 0)) as TotalSales, count(p.ProductId) as TotalTransactions  from tblProduct p
inner join tblProductSales ps on p.ProductId=ps.ProductId
group by p.Name


create view vmIndexedView
as

select p.Name, SUM(ISNULL((ps.QuantitySold*p.UnitPrice), 0)) as TotalSales, count(p.ProductId) as TotalTransactions  from tblProduct p
inner join tblProductSales ps on p.ProductId=ps.ProductId
group by p.Name

select * from vmIndexedView

create unique clustered index UIX_vmIndexedView
on vmIndexedView(Name)

--Msg 1939, Level 16, State 1, Line 52
--Cannot create index on view 'vmIndexedView' because the view is not schema bound.


alter view vmIndexedViewProper
with schemabinding
as

select dbo.tblProduct.Name, SUM(ISNULL((dbo.tblProductSales.QuantitySold * dbo.tblProduct.UnitPrice), 0)) as TotalSales
, count_big(*) as TotalTransactions  
from dbo.tblProduct 
inner join dbo.tblProductSales on dbo.tblProduct.ProductId=dbo.tblProductSales.ProductId
group by dbo.tblProduct.Name

select * from vmIndexedViewProper



create unique clustered index UIX_vmIndexedViewProper
on vmIndexedViewProper(Name)