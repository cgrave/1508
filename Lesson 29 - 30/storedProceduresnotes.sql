--STORED PROCEDURES
--A bunch of code given a name
--Can contain Queries, DML, Transaction logic flow
--Are called(executed)
--can be passes values(params)
--Code is stored in the DB
--You can drop, alter, retrieve the source code just like views

--SYNTAX is | create procedure Name AS SQL statements

------------Create Procedure ListStudentNames
------------as
------------Select firstname,lastname from student
------------return
--------------Execute the SP
------------Execute ListStudentNames
------------Exec ListStudentNames
------------ListStudentNames -- only works in management studios
--------------retrieve the source doe
------------sp_helptext ListStudentNames
--------------edit a SP
------------go
------------Alter Procedure ListStudentNames
------------as
------------select firstname, lastname, city from student
------------return

--parameters
--lookup student by studentid
Create procedure ListOneStudent(@studentid int)
as
select firstname,lastname from student
where studentid = @studentid
return
--test it
Execute ListOneStudent 200494476
--All param/variabls must sart with @
go
--multi param
Create Procedure ListByName (@firstname varchar(25), @lastname varchar(35))
as
select studentid, firstname, lastname, city from student
where firstname = @firstname and lastname = @lastname
return
--test it 
Execute ListbyName 'joe', 'cool'

--Calling a SP without values to the parameter is an eror
---We can default our parameters to NULL so they always have a value


--does not crah but the user sould be told they must provide values
go
Alter Procedure ListByname(@firstname varchar(25)=null, @lastname varchar(35)=null)
as
if @firstname is null
	BEGIN
	Raiserror('You must provide a first name', 16,1) -- seventy,state|| 16,1 prob always and forever
	END
if @lastname is null
	BEGIN
	Raiserror('You must provide last name', 16,1)
	END
else
	BEGIN
	select studentid, firstname, lastname, city from student
	where firstname = @firstname and lastname = @lastname
	END
Return
select firstname, lastname, city from student
return
--Raiserror display an error message and will always be 16,1
--IN THIS COURSE WE WULL ALWAYS CHECK FOR MISSING PARAMETERS(IS NULL CHECK)
Execute ListByName
--good example of apsecific error messages
--dont use PRINT in real world