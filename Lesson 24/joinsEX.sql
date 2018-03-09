--1. Select Student full names and the course ID's they are registered in. (distinct becasue students may have taken course from diff offering-as in they failed or need to do again)
Select distinct FirstName + ' ' + LastName 'Student Name',courseid 
from Student 
inner join registration ON Student.StudentID = registration.StudentID
inner join offering ON registration.offeringcode = offering.OfferingCode

--2. Select the Staff full names and the Course ID's they teach
Select distinct firstname + ' ' + lastname 'StaffName', CourseID 
from Staff inner join offering
ON Staff.StaffID = offering.StaffID
order by courseid asc

--3. Select the Club ID's and the Student full names that are in them (dont need to join club table-dont need club table whatsoever)
Select ClubID, FirstName + ' ' + LastName 'Student Name' 
from Activity Inner Join Student
ON Student.StudentID = Activity.StudentID

--4. Select the Student full name, courseID's and marks for studentID 199899200.
Select firstname + ' ' + lastname 'Student Name' ,courseid, mark
from Student 
inner join registration ON Student.StudentID = registration.StudentID
inner join offering ON registration.offeringcode = offering.OfferingCode
Where student.studentID = 199899200

--5. Select the Student full name, course names and marks for studentID 199899200.
Select firstname + ' ' + lastname 'Student Name' ,coursename, mark
from Student 
inner join registration ON Student.StudentID = registration.StudentID
inner join offering ON registration.offeringcode = offering.OfferingCode
Inner Join Course ON Course.CourseId= offering.CourseId
Where student.studentID = 199899200

--6. Select the CourseID, CourseNames, and the SemesterCodes they have been taught in
Select distinct course.CourseId, CourseName, SemesterCode from Course -- distinct not needed, is possible if more 'offering'?
Inner Join Offering on course.CourseId = Offering.CourseID --course could be taugh more than once in semester
order by courseid

--7. What Staff Full Names have taught Networking 1?
Select distinct firstname + ' ' + lastname 'Staff Name' from Staff
Inner Join Offering on Staff.StaffID = Offering.StaffID
Inner Join Course on Course.CourseId = offering.CourseId
where CourseName = 'Networking 1' -- three tables away

--8. What is the course list for student ID 199912010 in semestercode A100. Select the Students Full Name and the CourseNames
Select firstname + ' ' + lastname 'Student Name' ,coursename from Student 
Inner Join registration on Student.StudentID = registration.StudentID
Inner Join Offering on Registration.OfferingCode = Offering.OfferingCode
inner join Course on Course.CourseId = offering.CourseId --thats how we join the two tables, that part never changes
Where Student.StudentID = 199912010 and SemesterCode = 'A100'

--9. What are the Student Names and courseID's that have Marks >80?
Select firstname + ' ' + lastname 'Student Name' ,CourseID from Student
inner Join registration on Student.StudentID = registration.StudentID
inner join Offering on Offering.OfferingCode = Registration.OfferingCode
where Mark > 80

 
