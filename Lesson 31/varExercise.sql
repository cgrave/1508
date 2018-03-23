--1.	Create a stored procedure called StudentClubCount. It will accept a clubID as a parameter. If the count of students in that club is greater than 2 print ‘A successful club!’ . If the count is not greater than 2 print ‘Needs more members!’.

create procedure StudentClubCount(@clubid varchar(10))
as
if @clubid is null
	begin
		print('enter something pls')
	end
else
	begin
		if exists (select @clubid from Activity where studentid > 2)
		begin
			print('Need More members!')
		end
		else
		begin
			print('successful club!')
		end
	end
return

exec StudentClubCount CSS

select * from activity

--2.	Create a stored procedure called BalanceOrNoBalance. It will accept a studentID as a parameter. Each course has a cost. If the total of the costs for the courses the student is registered in is more than the total of the payments that student has made then print ‘balance owing !’ otherwise print ‘Paid in full! Welcome to School 158!’
--Do Not use the BalanceOwing field in your solution. 
go
create procedure BalanceOrNoBalance(@studentid  int)
as
if @studentid is null
	begin
		print('enter something pls')
	end
else
	begin
		if exists (select amount from payment where amount > ) --payment and course? idk man
		begin
			print('Need More members!')
		end
		else
		begin
			print('successful club!')
		end
	end
return

--3.	Create a stored procedure called ‘DoubleOrNothin’. It will accept a students first name and last name as parameters. If the student name already is in the table then print ‘We already have a student with the name firstname lastname!’ Other wise print ‘Welcome firstname lastname!’
go
create procedure DoubleOrNothin(@firstname varchar(40), @lastname varchar(40))
as
if @firstname is null
begin
	print('need first name')
end
else if @lastname is null
begin
	print('need last name')
end
else
begin
	if exists(select firstname from student where @firstname = FirstName)
	
end
else if exists(select lastname from student where @lastname = lastname)
return

--4.	Create a procedure called ‘StaffRewards’. It will accept a staff ID as a parameter. If the number of classes the staff member has ever taught is between 0 and 10 print ‘Well done!’, if it is between 11 and 20 print ‘Exceptional effort!’, if the number is greater than 20 print ‘Totally Awesome Dude!’
--moodle for updated version
