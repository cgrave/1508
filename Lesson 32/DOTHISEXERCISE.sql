--Stored Procedures – DML exercise
--For this exercise you will need a local copy of the IQSchool database. 
--1.	Create a stored procedure called ‘AddClub’ to add a new club record.
create procedure AddClub(@clubid varchar(10) = null, @Clubname varchar(50) = null)
as
	if @Clubname is null or @clubid is null
		begin
		raiserror('no',16,1)
		end
	else
		begin
		insert into Club(clubid,clubname)
		values(@clubid, @Clubname)
		if @@ERROR <>0
			begin
			raiserror('no thanks man',16,1)
		end
	end
return

--2.	Create a stored procedure called ‘DeleteClub’ to delete a club record.
go
create procedure DeletClub(@clubid varchar(10) = null)
as
	if @clubid is null
		begin
		raiserror('cannot be null',16,1)
		end
	else
		begin
		delete club where clubid = @clubid
			if @@ERROR <>0
				begin
				raiserror('didnt delete', 16,1)
				end
		end
return

--3.	Create a stored procedure called ‘Updateclub’ to update a club record. Do not update the primary key! --so basically dont change the id
go
create procedure UpdateClub(@clubid varchar(10) = null, @Clubname varchar(50) = null)
as
	if @clubid is null
		begin
		raiserror('cannot be null club id',16,1)
		end
	else
		begin
		update club
		set clubname = @Clubname
		where clubid = @clubid
		if @@ERROR <>0
			begin
			raiserror('failed update',16,1)
			end
		end
	
return

--4.	Create a stored procedure called ‘ClubMaintenance’. It will accept parameters for both ClubID and ClubName as well as a parameter to indicate if it is an insert, update or delete. This parameter will be ‘I’, ‘U’ or ‘D’.  insert, update, or delete a record accordingly. Focus on making your code as efficient and maintainable as possible.
go
create procedure ClubMaintenance(@clubid varchar(10), @clubname varchar(50), @charSelect varchar(1))
as
	if @clubid = null or @clubname is null
		begin
		raiserror('ENTER BOTH PLS',16,1)
		end
	else
		begin
			if @charselect = 'I'
				begin
					Insert into Club (ClubId,ClubName)
					values (@ClubID,@Clubname)
				end
return

--5.	 Create a stored procedure called ‘RegisterStudent’ that accepts StudentID and OfferingCode as parameters. If the number of students in that Offering are not greater than the Max Students for that course, add a record to the Registration table and add the cost of the course to the students balance. If the registration would cause the Offering to have greater than the MaxStudents   raise an error. 

--6.	Create a procedure called ‘StudentPayment’ that accepts Student ID, paymentamount, and paymentTypeID as parameters. Add the payment to the payment table and adjust the students balance owing to reflect the payment. 

--7.	Create a stored procedure called ‘AddPaymentType’ that accepts payment Type Description as a parameter. 

--8.	Create a stored procedure caller ‘FireStaff’ that will accept a StaffID as a parameter. Fire the staff member by updating the record for that staff and entering todays date as the DateReleased. 

--9.	Create a stored procedure called ‘WithdrawStudent’ that accepts a StudentID, and OfferingCode as parameters. Withdraw the student by updating their Withdrawn value to ‘Y’ and subtract ½ of the cost of the course from their balance. If the result would be a negative balance set it to 0.

