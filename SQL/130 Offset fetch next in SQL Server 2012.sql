--video 130: Duration: 09:03 Offset fetch next in SQL Server 2012

Create table tbl130Products
(
    Id int primary key identity,
    Name nvarchar(25),
    [Description] nvarchar(50),
    Price int
)


Declare @Start int
Set @Start = 1

Declare @Name varchar(25)
Declare @Description varchar(50)

While(@Start <= 100)
Begin
    Set @Name = 'Product - ' + LTRIM(@Start)
    Set @Description = 'Product Description - ' + LTRIM(@Start)
    Insert into tbl130Products values (@Name, @Description, @Start * 10)
    Set @Start = @Start + 1
End


select * from tbl130Products;

-- skip(offset) 10 take 10

SELECT * FROM tbl130Products
ORDER BY Id
OFFSET 15 ROWS
FETCH NEXT 10 ROWS ONLY


CREATE PROCEDURE sp130GetRowsByPageNumberAndSize
@PageNumber INT,
@PageSize INT
AS
BEGIN
    SELECT * FROM tbl130Products
    ORDER BY Id
    OFFSET (@PageNumber - 1) * @PageSize ROWS
    FETCH NEXT @PageSize ROWS ONLY
END


EXECUTE sp130GetRowsByPageNumberAndSize 1, 10 -- 1 page
EXECUTE sp130GetRowsByPageNumberAndSize 2, 10 -- 2 page
EXECUTE sp130GetRowsByPageNumberAndSize 3, 10 -- 3 page
EXECUTE sp130GetRowsByPageNumberAndSize 4, 10 -- 4 page
EXECUTE sp130GetRowsByPageNumberAndSize 5, 10 -- 5 page