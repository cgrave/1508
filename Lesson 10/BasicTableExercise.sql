drop table Course
drop table Student
drop table Club
drop table Grade
drop table Activity


create table Course
(
CourseID char(6) not null,
CourseName varchar(40) not null,
Hours smallint null,
NoOfStudents smallint null
)

create table Student
(
StudentID int not null,
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
ClubID int not null,
ClubName varchar(50) not null
)

create table Grade
(
StudentID int not null,
CourseID char(6) not null,
Mark smallint null
)

create table Activity
(
StudentID int not null,
ClubID int not null
)
