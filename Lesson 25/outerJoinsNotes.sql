--OUTER JOINS
--Select all positiondescription and the anmes of teh staff in them
Select Positiondescription, firstname, lastname from position 
inner join staff on position.PositionID = staff.PositionID -- problem with this results?
--Remember, inner join only returns records that have related records in the join
--TO get all the parent records even if there are no child records use OUTER JOINS
--2 types of outer joins, Left outer joins and right outer joins
--sam functionality, just depends on how you write the query.
--As a left outer join
Select Positiondescription, firstname, lastname from position 
left outer join staff on position.PositionID = staff.PositionID
--give me all the records that are being returned from the left side of the statement

Select Positiondescription, firstname, lastname from staff 
right outer join position on position.PositionID = staff.PositionID

Select Positiondescription, firstname, lastname from staff 
left outer join position on position.PositionID = staff.PositionID 
-- does this make any sense having outer join point to child field ew. (Since staff is a child table it will always have related records in position, This will behave like an inner join)
--In a 2 table join your outer join should point to the parent table

--Select ALL(often means if there are no related records. null?) the student names, their marks, and courseid's
Select firstname, lastname,courseid from student
left outer join Registration on Student.StudentID = Registration.StudentID
--do a join with offering for courseid
left outer join offering on offering.OfferingCode = Registration.OfferingCode -- change to left from right then..
order by firstname, lastname

--left means.. give me all from this table even if doesnt appear in next table. effectively creates one tables
--so if i go right, not getting left ones. you always want to point to where you want to keep everything of
--if more than one table, decide where you want to keep everything of (left/right)










--OUTER JOIN WITH COUNT AGGREGATE
--Select all the student names and teh number of payments each student has made
Select firstname, lastname, count(*)'count' from student
left outer join payment on student.studentid = payment.StudentID
group by student.studentid, firstname, lastname
--showing counts of 1 for students that have 0 payments :(
select student.studentid, firstname, lastname, paymentid,paymentdate from student
left outer join payment on student.StudentID = payment.StudentID

Select firstname, lastname, count(paymentid)'count' from student
left outer join payment on student.studentid = payment.StudentID
group by student.studentid, firstname, lastname

--ALWAYS COUNT EH PK FIELD OF TEH CHILD TABLE WHEN DOING A COUNT WITH AN OUTER JOIN.OTHERWISE YOU WILL GET A COUNT OF 1 INSTEAD OF COUNT 0 FOR PARENT RECORDS THAT HAVE NO CHILD RECORDS

--GROUP BY UNIQUE ATTRIBUTE
--POINT TO WHAT WE WANT TO KEEP
--COUNT (PK OF CHILD) WHAT OUTER JOIN
--HOW MANY IS EACH STUDENT TAKING > THAT IS EACH AND EVERY STUDENT / OR ALL > OUTER

--OUTER JOIN EXERCISE
LAB #5 = OUTER6
#8 INNER JOINS
OF QUERIES STILL CANNOT DO #3 / #9 / #11
