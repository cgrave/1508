--Variables
--All local variables must start with @, have a name, and a datatype

Declare @firstname varchar(30)
go
--Place a value in a variable
Declare @firstname varchar(30)
set @firstname = 'Homer'
print @firstname

--from the db 
go
Declare @firstname varchar(30)
set @firstname = (select firstname from staff where staffid = 1)
print @firstname

-- another way
go
Declare @firstname varchar(30)
select @firstname = firstname from staff where staffid = 1
print @firstname

--Another way
go
Declare @firstname varchar(30), @lastname varchar(30)
set @firstname = (select firstname from staff where staffid = 1)
set @lastname = (select lastname from staff where staffid = 1)
print @firstname + ' ' + @lastname

--MUCH BETTER way!
go
Declare @firstname varchar(30), @lastname varchar(30)
select @firstname = firstname,@lastname = lastname from staff where staffid = 1
print @firstname + ' ' + @lastname

--SP with staffid param
alter procedure Welcome(@staffid int = null)
as
if @staffid is null
	begin
	raiserror('You must provide a staff id', 16,1)
	end
else
	begin
	Declare @firstname varchar(30),@lastname varchar(30)
	select @firstname = firstname,@lastname = lastname from staff where staffid = @staffid

	if @firstname = 'donna'
		begin
		print 'sorry donna we dont like that name'
		end
	else
		begin
		print 'Welcome, ' + @firstname + ' ' + @lastname
		end
	end
return
exec Welcome 4

--SP that accets a studenid and returns a message saying they owe or dont owe money
Create Procedure BalanceCheck (@studentid int = null)
as
if @studentid is null
	begin
	raiserror('Must provide studentid',16,1)
	end
else
	begin
	Declare @amount money
	Select @amount = balanceowing from student where studentid = @studentid
	if @amount > 0
		begin
		print 'gimme moneys'
		end
	else
		begin
		print ('nothing to see')
		end
	end
return

exec BalanceCheck 199912010

--Select * from student
--update student set BalanceOwing = 500
--where studentid = 200322620



--EXISTS
--Looks for the existance of records that match the criteria of a query
--if the query returns at least one record exists is TRUE
--otherwide exists is FALSE
if exists (select * from staff where firstname = 'donna')
	print 'welcome donna'
else
	print 'no one names that'

--Create a procedure that accepts a money amount. If there are any students that owe more than that amount print 'students owe!'
create procedure OweMoney(@amount money = null)
as
if @amount is null
	begin raiserror('Must provide an amount',16,1)
	end
else
	begin
	if exists (select * from student where BalanceOwing>@amount)
		begin
		raiserror('students found that owe that much money',16,1)
		end
	end
return
exec OweMoney 400
