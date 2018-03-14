--UNION
--Unions combines the results of more than more query to one results
--Select all the names in the database
Select firstname, lastname from student
UNION
Select firstname,lastname from staff


select firstname,lastname,city from student
union
select firstname,lastname from staff
--why does the follow rern 27 records

select firstname,lastname,studentid from student
union
select firstname,lastname,staffid from staff
--distinct looks at the entire records and there are not duplicate records here
--column names come fomr the first query
select firstname,lastname,studentid'id' from student
union
select firstname,lastname,staffid'will be ignoreed lol' from staff
--columns being combined must be similar datatypes
select firstname,lastname,studentid'id' from student
union
select firstname,lastname,staffid'will be ignoreed lol' from staff
order by ID asc

select firstname, lastname, DATENAME(mm,birthdate)'Month' from student

Select studentid 'ID', 'student Born:' + firstname + ' ' + lastname 'Event Name' from student
where datename(mm,birthdate) = 'October'
UNION
Select staffID, 'Staff Hired:' + firstname + ' ' + lastname from staff
where datename(mm, datehired) = 'October'
order by ID desc



--VIEWS
--a custome table in memory that points to other data in the database is created by a query.
--Everytime you use a view the query runs again and recreate the view
go
Create View StudentCourseView
as
Select firstname, lastname, course.courseid,coursename,mark from student
inner join Registration on Student.StudentID = Registration.StudentID
inner join Offering on offering.offeringcode = Registration.OfferingCode
inner join course on course.courseid = offering.courseid
--select through a iew
select * from StudentCourseView
select * from StudentCourseView where firstname = 'ivy' and lastname = 'kent'
--WHY>
--Reduce complexity of a query
--control access to data
--edit the view
--see the code that create the view
sp_helptext studentcourseview
--edit the code use alter
alter View StudentCourseView
as
Select firstname, lastname, course.courseid,coursename,mark from student
inner join Registration on Student.StudentID = Registration.StudentID
inner join Offering on offering.offeringcode = Registration.OfferingCode
inner join course on course.courseid = offering.courseid

--droppping a view
--drop view stuentcourseview
--DML VIEWS
--insert - only if the view is base on one tables
--update - only update one table in the view
