Create table tbl015Students
(
     Id int primary key identity,
     StudentName nvarchar(50)
)
Go

Create table tbl015Courses
(
     Id int primary key identity,
     CourseName nvarchar(50)
)
Go

Create table tbl015StudentCourses
(
     StudentId int not null foreign key references tbl015Students(Id),
     CourseId int not null foreign key references tbl015Courses(Id)
)
Go


Alter table tbl015StudentCourses
Add Constraint PK_StudentCourses
Primary Key Clustered (CourseId, StudentId);


Create procedure sp015InsertIntoStudentCourses
@StudentName nvarchar(50),
@CourseName nvarchar(50)
as
Begin

     Declare @StudentId int
     Declare @CourseId int

     Select @StudentId = Id from tbl015Students where StudentName = @StudentName
     Select @CourseId = Id from tbl015Courses where CourseName = @CourseName

     If (@StudentId is null)
     Begin
          Insert into tbl015Students values(@StudentName)
          Select @StudentId = SCOPE_IDENTITY()
     End

     If (@CourseId is null)
     Begin
          Insert into tbl015Courses values(@CourseName)
          Select @CourseId = SCOPE_IDENTITY()
     End

     Insert into tbl015StudentCourses values(@StudentId, @CourseId)

End


-- Execute sp015InsertIntoStudentCourses 'Tom','C#'

select * from tbl015Students
select * from tbl015Courses
select * from tbl015StudentCourses
-- delete from tbl015StudentCourses