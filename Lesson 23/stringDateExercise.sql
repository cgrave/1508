--String and Date Functions Exercise
--1. Select the staff names and the name of the month they were hired
Select firstname + ', ' + LastName'FullNames', datehired, datename(mm,datehired)'month' from staff order by month(datehired)

--2. How many days did Tess Agonor work for the school?
Select firstname + ', ' + LastName'FullNames', datediff(dd, datehired, getdate())'hired' from staff where 

--3. How Many Students where born in each month? Display the Month Name and the Number of Students.


--4. Select the Names of all the students born in December.


--5. select last three characters of all the courses


--6. Select the characters in the position description from characters 8 to 13 for PositionID 5


--7. Select all the Student First Names as upper case.


--8. Select the First Names of students whose first names are 3 characters long.


