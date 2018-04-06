-- Lab 3 Crystal Grave
--1.
create procedure BooksbyAuthorName  (@authorFirstname varchar(30), @authorLastname varchar(30))
as
if @authorFirstname is null
	begin
		raiserror('Pls Enter first name',16,1)
	end
if @authorLastname is null
	begin
		raiserror('Pls Enter last name',16,1)
	end
else
	begin
		select title.isbn, title, Publisher.name, SuggestedPrice from title
		inner join authortitle on title.isbn = authortitle.isbn
		inner join author on author.authorcode = authortitle.authorcode
		inner join publisher on publisher.PublisherCode = title.PublisherCode
		where @authorFirstname = firstname and @authorLastname = lastname
		order by title asc
	end
return


--2.
go
create procedure BooksbyTitle(@title varchar(30))
as
	if @title is null
	begin
		raiserror('Enter title pls', 16,1)
	end

	else
		begin
		select isbn, title, SuggestedPrice, NumberInStock from title
		where title like '%' + @title + '%'
		end
return


--3.
go
create procedure AddCategory(@description varchar(50))
as
	if @description is null
	begin
		raiserror('Enter description pls', 16,1)
	end

	else
		begin
		if exists(select description from category where description = @description)
			begin
			raiserror('Description is already here!',16,1)
			end
		else
			Begin
			declare @categorycode int
			insert into category (categorycode, description)
			values (@categorycode, @description)

			If @@ERROR <>0
				Begin
				RaisError ('insert failed',16,1)
				End
			End
		end
return


--4.
go
create procedure UpdateSuggestedPrice(@isbn char(10), @suggestedprice money)
as
	if @isbn is null
		begin
		raiserror('please enter isbn',16,1)
		end
	if @suggestedprice is null
		begin
		raiserror('please enter a suggested price',16,1)
		end
	else
		Begin
		if exists(select isbn from title where isbn = @isbn)
			begin
			update title
			set SuggestedPrice = @suggestedprice
			where isbn = @isbn
			If @@ERROR <>0
				Begin
				RaisError ('update failed!',16,1)
				End
			End
		else
			begin
			raiserror('Does not exist',16,1)
			end
		end
return


--5.
go
create procedure UpdateTitle(@isbn char(10), @title varchar(40), @suggestedprice money,@numberinstock int, @publishercode int, @categorycode int)
as
	if @isbn is null and @title is null and @suggestedprice is null and @numberinstock is null and @publishercode is null and @categorycode is null
		begin
		raiserror('Please enter in something',16,1)
		end
	else
		begin
			if exists(select isbn from title where isbn = @isbn)
				begin
					if exists(select @categorycode from category where @categorycode = categorycode) and exists(select @publishercode from publisher where @publishercode = publishercode)
						Begin
						update title
						set categorycode = @categorycode, publishercode = @publishercode, title = @title, SuggestedPrice = @suggestedprice, NumberInStock = @numberinstock
						where isbn = @isbn
						If @@ERROR <>0
							Begin
							RaisError ('update failed!',16,1)
							End
						End
					else
						begin
						raiserror('Not valid category/publisher codes',16,1)
						end
				end
			else
				begin
				raiserror('didnt find isbn!',16,1)
				end
		end
return

--6.	
--		The month and year are not before today’s date (Cannot enter a future month).
go
create procedure CustomerBooks(@month int, @year int)
as
	if @month not between 1 and 12
		begin
		raiserror('Not a valid number bwtween 1-12',16,1)
		end
	if @year > year(getdate()) and @month > month(getdate())
		begin
		raiserror('Cannot enter a future date thanks',16,1)
		end
	else
		begin
		select sale.customerNumber, firstname + ' ' + lastname'FullName', sum(subtotal)'Subtotal' from customer
		inner join sale on sale.customerNumber = customer.customerNumber
		where year(saledate) = @year and month(saledate) = @month
		group by sale.customerNumber, firstname, lastname, saledate
		end
return



--7.	
--			Update the Sale record subtotal, total and GST fields in Sale table to include the sale amount of the book purchased.  (8 marks)
go
create procedure AddSaleDetail(@salenumber int, @isbn char(10), @quantity int)
as
	if @isbn is null and @salenumber is null and @quantity is null
		begin
		raiserror('Please enter something',16,1)
		end
	if not exists (select isbn from title where @isbn = isbn)
		begin
		raiserror('Could not find isbn',16,1)
		end
	if not exists (select salenumber from saledetail where salenumber = salenumber)
		begin
		raiserror('Could not find salenumber',16,1)
		end
	else
		begin
		Declare @sellingPrice money
		Declare @amount money
		Declare @numinstock int
		select @sellingPrice = suggestedprice from title
		insert into saledetail (sellingprice)
		values (@sellingPrice)

		select title from title where isbn = @isbn
		select @numinstock = numberinstock from title where isbn = @isbn
		update title (NumberInStock)
		set numberinstock = numberinstock - 1


			--	end
		end

return


--8.
drop table ArchiveEmployee

Create table ArchiveEmployee
(
EmployeeNumber int identity (300,1) not null,
SIN char (9) not null,
LastName varchar(30) not null,
FirstName varchar(30) not null,
Address varchar(40) not null,
City varchar(20) null,
Province char(2) null ,
PostalCode char(6) null ,
HomePhone char(10) null,
workPhone char(10) null,
Email varchar(30) null
)



--9.	1.	Write a procedure ArchiveEmployeeTransactions that will move employee information to the ArchiveEmployee table for storage.  The employee will only be archived if they do not have any sales. An employee number will be passed to this procedure as a parameter. Error messages are required if the employee number does not exist or of the employee cannot be archived because they have sales.  (5 marks)
go
create procedure ArchiveEmployeeTransactions(@employeeNumber int)
as
if @employeeNumber is null
	Begin
	Raiserror ('You must provide an employee number',16,1)
	End
if not exists(select employeeNumber from employee where employeeNumber = @employeeNumber)
begin
raiserror('does not exist here',16,1)
end 

else
	Begin
	if exists(select employeeNumber from sale where employeeNumber = @employeeNumber)
		Begin Transaction
		insert into ArchiveEmployee (EmployeeNumber,SIN, LastName, FirstName, Address, City, Province, PostalCode, HomePhone, workPhone, Email)
		Select EmployeeNumber,SIN, LastName, FirstName, Address, City, Province, PostalCode, HomePhone, workPhone, Email
		 from employee
		 where @employeeNumber = employeeNumber
		if @@ERROR<>0 
			Begin
			Raiserror ('Archive failed',16,1)
			Rollback Transaction
			End
	end
Return
