drop table activity
drop table grade
drop table student
drop table course
drop table club


create table Student
(
	StudentId int not null
		constraint PK_Student primary key clustered,
	StudentFirstName varchar(40) not null,
	StudentLastName varchar(40) not null,
	GenderCode char(1) not null,
	Address varchar(30) null,
	Birthdate datetime null,
	PostalCode char(6) null,
	AvgMark decimal(4,1) null,
	NoOfCourses smallint null	
)

create table Course
(
	CourseId char(6) not null
		constraint PK_Course primary key clustered,
	CourseName varchar(40) not null,
	Hours smallint null,
	NoOfStudents smallint null
)

create table Club
(
	ClubId int not null
		constraint PK_Club primary key clustered,
	ClubName varchar(50) not null
)

create table Grade
(
	StudentId int not null
		constraint FK_GradeToStudent references Student(StudentId),
	CourseId char(6) not null
		constraint FK_GradeToCourse references Course(CourseId),
	Mark smallint null,
	constraint PK_Grade primary key clustered (StudentId,CourseId)
)

create table Activity
(
	StudentId int not null
		constraint FK_ActivityToStudent references Student(StudentId),
	ClubId int not null
		constraint FK_ActivityToClub references Club(ClubId),
	constraint PK_Activity primary key clustered (StudentId,ClubId)
)
--DONE•	Add a MeetingLocation varchar(50) field to the Club table
--•	Add a constraint to birthdate to ensure the value is < todays date
--•	Add a constraint to set a default of 80 to the Hours field
--•	Oops, changed our minds…. DISABLE the check constraint for the birthdate field
--•	Yikes! Change our minds again. ENABLE the check constraint for the Birthdate field
--•	Hold on! Call me crazy…. Delete the default constraint for the Hours field now!

--this works
ALTER TABLE Club ADD MeetingLocation varchar(50)

--this works
ALTER TABLE Student ADD Constraint CK_ValidBirthDate check (Birthdate < getdate())

--this works
ALTER TABLE Course ADD Constraint DF_ValidHours default (80) for hours

--this works
ALTER TABLE Student nocheck constraint CK_ValidBirthDate

--this works
ALTER TABLE Student check constraint CK_ValidBirthDate

--this works
ALTER TABLE Course drop constraint DF_ValidHours

INSERT into Student (birthdate, studentid, StudentFirstName, StudentLastName, GenderCode)
values('jan 08 2000', 5838, 'Bob', 'Dylan', 'f')

insert into Course(Courseid, CourseName)
values(325, 'nameme')

SELECT * FROM course
