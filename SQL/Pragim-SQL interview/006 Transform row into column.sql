Create Table tbl006Countries
(
     Country nvarchar(50),
     City nvarchar(50)
)
GO

Insert into tbl006Countries values ('USA','New York')
Insert into tbl006Countries values ('USA','Houston')
Insert into tbl006Countries values ('USA','Dallas')

Insert into tbl006Countries values ('India','Hyderabad')
Insert into tbl006Countries values ('India','Bangalore')
Insert into tbl006Countries values ('India','New Delhi')

Insert into tbl006Countries values ('UK','London')
Insert into tbl006Countries values ('UK','Birmingham')
Insert into tbl006Countries values ('UK','Manchester')


Select Country, City1, City2, City3
From
(
  Select Country, City,
    'City'+
      cast(row_number() over(partition by Country order by Country)
             as varchar(10)) ColumnSequence
  from tbl006Countries
) Temp
pivot
(
  max(City)
  for ColumnSequence in (City1, City2, City3)
) Piv