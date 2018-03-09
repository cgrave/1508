--JOINS
Select * from staff
select * from position
--Select names of all the staff and the position description they hold
Select firstname,lastname,positionDescription
from staff,position
--does not work because we need to specify how the tables related to each other.
--In SQL to do this we use INNER JOINS!
--ANSI (old school way. do not use in this course)
Select firstname,lastname,positionDescription
from staff,position
where staff.PositionID = position.PositionID
--CORRECT WAY IN SQL SERVER
Select firstname,lastname,positionDescription from Position
inner join staff on position.PositionID = staff.PositionID
--on identifies how the tables relate (PK in parent,FK in child)
--order of the inner join tables or the order of the ON does not matter

--Select positionDescriptions and the staffnames that are in them.... :)
Select positionDescription,firstname,lastname from Position
inner join staff on position.PositionID = staff.PositionID
--works, BUT, one positionDescription is not listed. It is the one that has no related record in staff
--Inner joins only return records if there are related records in the join
--Assist Dean(positionid 7) did not show up because there are no staff in positionid 7. 

--Select student full names and the offering codes they are registered in
Select firstname + ' ' + lastname'student',offeringcode from student
inner join registration on student.studentid = registration.StudentID
--Select student studentid, full names and the offering codes they are registered in
Select student.studentid, firstname + ' ' + lastname'student',offeringcode 
from student
inner join registration on student.studentid = registration.StudentID
--remember only records that have child records are returned with inner joins.
--More than 2 table joins
--Select the staffnames, positiondesc, and semestercode they have taught in
Select firstname,lastname,positionDescription,SemesterCode,coursename from Position
inner join staff on position.PositionID = staff.PositionID
inner join offering on offering.StaffID = staff.StaffID
inner join course on course.courseid = offering.CourseID

--Names of students that are registered in at least on offering.
Select distinct firstname,lastname from student
inner join Registration on student.StudentID = Registration.StudentID
--names of students that are registered in offering 1000
Select firstname,lastname from student
inner join Registration on student.StudentID = Registration.StudentID
where offeringcode = 1000










Select * from staff
select * from position
