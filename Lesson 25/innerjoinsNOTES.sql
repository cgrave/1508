-- INNER JOINS WITH AGGREGATES
--Select the student firstname, lastname, and avg mark for each student
Select student.studentid,avg(mark)'average' from student 
--Select firstname, lastname,avg(mark)'average' from student 
inner join Registration on student.studentID = Registration.StudentID --anything not in query needs to be in group by
--group by firstname,lastname -- why 7 here? groub by means select the avg mark for each student.... show studentID instead? now what
group by student.studentid -- we have two students with same name, so both people got combined averages even tho they are diff names
-- remmeber what uniquely identifies studentid or name? STudentID not NAMES!

Select firstname, lastname,avg(mark)'average' from student 
inner join Registration on student.studentID = Registration.StudentID 
group by student.studentid, firstname,lastname -- I do need to group by! doesnt have to show the student id but I do have to group by!!! :)
--primary key is almost always in group by


-- ***************


--What is the avg payment amount for each payment type? show the payment type description and the average
--select * from Payment
--select paymenttypeid, studentid,avg(amount)'amount' from Payment
-- group by StudentID THIS IS MY GUESS / DOESNT WORK

Select PaymentTypedescription,avg(amount) from paymenttype join payment on PaymentType.PaymentTypeID = Payment.PaymentTypeID
group by Paymenttype.PaymentTypeID, PaymentTypeDescription --CORRECT VERSION... always do as a failsafe


-- **************


--How many offerings are there for each course? show coursename and count
select * from course
--select coursename, avg(courseid)'courseid' from course
--inner join coursename MINE / DOESNT WORK
Select coursename, count(*)'count' from course 
inner join offering on course.courseid = offering.courseid 
group by course.courseid,coursename -- CORRECT VERSION








select count(distinct studentid) from Registration

select distinct studentid from Registration -- why 8 here? when this shows all
