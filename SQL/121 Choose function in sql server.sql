--video 121: Duration: 05:31 Choose function in sql server

--**Choose function**

--* Introduced in SQL Server 2012
--* Returns the item at the specified index from the list of available values
--* The index position starts at 1 and NOT 0 (ZERO)



--**Syntax :** 

--CHOOSE ( index, val_1, val_2, ... )

--**Example : Returns the item at index position 2**


SELECT CHOOSE(2, 'India','US', 'UK') AS Country  -- US
SELECT CHOOSE(0, 'India','US', 'UK') AS Country  -- NULL
SELECT CHOOSE(4, 'India','US', 'UK') AS Country  -- NULL

select * from Employees
alter table employees 
add DateOfBirth date

UPDATE Employees
SET DateOfBirth = CHOOSE(ID, 
    '1990-01-15', -- ID 1
    '1988-03-22', -- ID 2
    '1995-07-10', -- ID 3
    '1990-01-15', -- ID 4
    '1992-11-05', -- ID 5
    '1994-06-18', -- ID 6
    '1991-09-30', -- ID 7
    '1985-04-12'  -- ID 8
);

SELECT FirstName+' '+LastName, DateOfBirth,
       CASE DATEPART(MM, DateOfBirth)
           WHEN 1 THEN 'JAN'
           WHEN 2 THEN 'FEB'
           WHEN 3 THEN 'MAR'
           WHEN 4 THEN 'APR'
           WHEN 5 THEN 'MAY'
           WHEN 6 THEN 'JUN'
           WHEN 7 THEN 'JUL'
           WHEN 8 THEN 'AUG'
           WHEN 9 THEN 'SEP'
           WHEN 10 THEN 'OCT'
           WHEN 11 THEN 'NOV'
           WHEN 12 THEN 'DEC'
       END
       AS [MONTH]
FROM Employees


SELECT FirstName+' '+LastName, DateOfBirth,CHOOSE(DATEPART(MM, DateOfBirth),
    'JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG',
    'SEP', 'OCT', 'NOV', 'DEC') AS [MONTH]
FROM Employees