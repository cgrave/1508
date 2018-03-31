-- Lab 3 Crystal Grave
--1.	Write a procedure BooksbyAuthorName that will find and display all books by a certain author. The procedure accepts author last name and first name as parameters. 
--Display the ISBN, title, publisher name and suggested price of all books by that author.  List in ascending title sequence. (3 marks)
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
		
		--inner join authortitle on author.authorcode = authortitle.authorcode
		inner join authortitle on title.isbn = authortitle.isbn
		inner join author on author.authorcode = authortitle.authorcode
		inner join publisher on publisher.PublisherCode = title.PublisherCode
		where @authorFirstname = firstname and @authorLastname = lastname
		--where author.FirstName = 'Sam' and lastname = 'smith'
		order by title asc
		--select * from author
	end
return

--2.	Write a procedure BooksbyTitle that will accept part of a title as a parameter and find all books that have that part in the title.  List the ISBN, title, suggested selling price and number in stock for these books. (2 marks)
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

--3.	Write a procedure AddCategory that will add a new category. The procedure will accept a description for the category as a parameter. If the description is already present in the table raise an appropriate error message and do not add it. Otherwise add this record to the Category table and if there are no errors select the new CategoryCode. (4 marks)
go
create procedure AddCategory(@description varchar(50))
as
	if @description is null
	begin
		raiserror('Enter description pls', 16,1)
	end

	else
		--begin
		--if @description in the cate
			--begin
			--add it here
			--end
		--else
			--begin
			--raiserror('Description is already here!',16,1)
			--end
		--end

return

--4.	Write a procedure UpdateSuggestedPrice that accepts an ISBN number and a new suggested price as parameters.  If the ISBN does not exist, raise an error message and do not perform the update. Otherwise, update the suggested price to the new price. (4 marks)

--5.	Write a procedure UpdateTitle that accepts all the Title table fields as parameters and will update the title with those values. Raise error messages and do not perform the update for the following conditions: 
--		The ISBN does not exist
--		The Category and/or Publisher Codes are not valid.
--		Otherwise, perform the update. (4 marks)

--6.	Write a procedure CustomerBooks that displays the amount spent on books purchased by each customer, who purchased books, during a certain month. The month is passed into the procedure as integer month and integer year parameters.  Error messages are required for the following: 
--		The month number is invalid (not 1 – 12) 
--		The month and year are not before today’s date (Cannot enter a future month).

--		If there are no errors, select the customer number, last name and the amount spent that month. DO NOT include GST in the amount spent.  (4 marks)

--7.	7.	Write a procedure AddSaleDetail that will add a sale detail for a book purchased and will update the sale with that book information. The following data is passed to the procedure as parameters: sale number, ISBN and quantity. Specific error messages are required for the following:
--		The ISBN or sale numbers are not valid 
--		The ISBN is already on that sale.   

--		If there are no errors: 
--			Insert the Sale Detail record into SaleDetail table. The selling price will be the Suggested Price for that ISBN. 
--			Update the book in the Title table to reduce the number in stock by the quantity 
--			Update the Sale record subtotal, total and GST fields in Sale table to include the sale amount of the book purchased.  (8 marks)

--8.	Create table ArchiveEmployee. This table will be a duplicate table of the employee table including the following: 
--	a) use the same fields as the Employee table
--	b) do not use the identity parameter on the EmployeeNumber of the ArchiveEmployee table 
--	c) do not put in foreign keys, check or default constraints.  (1 marks)

--9.	1.	Write a procedure ArchiveEmployeeTransactions that will move employee information to the ArchiveEmployee table for storage.  The employee will only be archived if they do not have any sales. An employee number will be passed to this procedure as a parameter. Error messages are required if the employee number does not exist or of the employee cannot be archived because they have sales.  (5 marks)
