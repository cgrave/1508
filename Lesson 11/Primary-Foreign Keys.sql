drop table Grade
drop table Activity

drop table Student
drop table Course

drop table Club




create table Course
(
CourseID char(6) not null constraint PK_Course primary key clustered,
CourseName varchar(40) not null,
Hours smallint null,
NoOfStudents smallint null
)

create table Student
(
StudentID int not null constraint PK_Student primary key clustered,
StudentFirstName varchar(40) not null,
StudentLastName varchar(40) not null,
GenderCode char(1) not null,
Address varchar(30) null,
Birthdate datetime null,
PostalCode char(6) null,
AvgMark decimal(4,1) null,
NoOfCourses smallint null,
)

create table Club
(
ClubID int not null constraint PK_Club primary key clustered,
ClubName varchar(50) not null
)

create table Grade
(
StudentID int not null constraint FK_GradetoStudent references Student(StudentID),
CourseID char(6) not null constraint FK_GradetoCourse references Course(CourseID),
Mark smallint null,
constraint PK_Grade primary key clustered(StudentID, CourseID)
)

create table Activity
(
StudentID int not null  constraint FK_ActivitytoStudent references Student(StudentID),
ClubID int not null constraint FK_ActivitytoClub references Club(ClubID),
constraint PK_Activity primary key clustered(StudentID, ClubID)
)
