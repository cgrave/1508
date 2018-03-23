--VIEWS
--1.	Create a view called CustomerSaleHistory that will select the customernumber, customer full name (one column), salenumber, saledate, title, sellingprice, and total for all the customers that have sales. (2 marks)
--drop view CustomerSaleHistory
create view CustomerSaleHistory
as
select customer.customernumber, firstname + ' ' + lastname'names', sale.salenumber, saledate, title, sellingprice, total from customer
inner join sale on sale.customernumber = customer.customernumber
inner join saledetail on saledetail.salenumber = sale.salenumber
inner join title on title.isbn = saledetail.isbn
go
--drop view CustomerSaleHistory
--select * from CustomerSaleHistory
--2.	Use the CustomerSaleHistory to select the CustomerSaleHistory for customer number 11.	 (1 mark)
select customernumber, names, salenumber, saledate, title, sellingprice, total from CustomerSaleHistory 
where customernumber = 11

--1.	Insert the following records into the title table given the following data:
-- (2 marks)drop view SQLBooksInsert
----------create view SQLBooksInsert
----------as
----------select isbn, title, suggestedprice, numberinstock, CategoryCode , publisher.name from title
----------inner join publisher on publisher.publishercode = title.publishercode
----------go
----------select isbn, title, suggestedprice, numberinstock, CategoryCode, name from SQLBooksInsert

--------Insert into SQLBooksInsert(isbn, title, suggestedprice, numberinstock, CategoryCode)
--------values(1021031217, 'SQL is my life. Make it yours!', .99, 95, 3)






--1.	Select the ISBN, title, publisher name and number in stock.  List the data in ISBN sequence. 
--(2 marks)
Select isbn, title, publisher.name, NumberInStock from title
inner join publisher on Publisher.publishercode = title.publishercode
order by isbn asc

--2.	The company is having a 10% sale on books in the category “Computers”.  Select the ISBN, title, suggested price, the sale price (suggested price less 10%) and the difference between the two values. (2 marks) ==done?===
Select ISBN, title, suggestedprice,(SuggestedPrice*0.10)'PriceDifference', SuggestedPrice-(SuggestedPrice*0.10)'SalePrice' from title 

--3.	Select the employee number and name of all the employees who don’t have a sale. Do not use a join. (2 marks)
--============done===========
select employeeNumber, firstname,lastname from employee
where employeeNumber not in (select employeeNumber from sale)

--4.	Select the total number of books sold and the total money earned for the company for the current year. 
--(3 marks) =====done====
select SUM(quantity)'booksold',  SUM(sellingprice)'moneyearned' from saledetail
inner join sale on sale.salenumber = saledetail.salenumber
where year(saledate) = 2018 --dont hardcode

--5.	Select the category code, category description and the total number of books sold and the total money earned for each and every category.  (4 marks) =============done================ what is difference between sellingprice and amount?
select title.categorycode, description ,count(description)'totalBooksSold', sum(amount)'total'from category
inner join title on category.categorycode = title.categorycode
inner join saledetail on title.isbn = saledetail.isbn
group by title.categorycode, description

--6.	Select the ISBN, title and amount earned for the current year for the titles that sold more than $100(not including GST). (4 marks) ===doesnt make sense but done i guess====================
select saledetail.isbn, title, amount from title
inner join saledetail on saledetail.isbn = title.isbn
inner join sale on sale.salenumber = saledetail.salenumber
where year(saledate) = 2018 and amount > 100 --having amount AND Hardcoding messed up


--7.	Write the select statement to return ALL the customer names, CustomerNumbers and how many sales they have. (3 marks) =================done============
select firstname + ' ' +  lastname'fullNames', customer.customernumber, count(sale.salenumber)'salesTotal' from customer
left outer join sale on sale.customernumber = customer.customernumber
group by firstname, lastname, customer.customernumber

--8.	Information is required for some sale invoices. Select The CustomerNumber, Full Name, SaleNumber, SaleDate, SubTotal, GST, Total, ISBN, Title Quantity, and Amount for Sale Numbers 3008 to 3010. 
--(3 marks) ================done=====================
select customer.customernumber, firstname + ' ' + lastname'fullNames', sale.salenumber, saledate, subtotal, gst, total,title, saledetail.isbn, quantity, amount from customer
inner join sale on customer.customernumber = sale.customernumber
inner join saledetail on saledetail.salenumber = sale.salenumber
inner join title on title.isbn = saledetail.isbn
where sale.salenumber between 3008 and 3010



--9.	A single St. Patricks Day Card mailing list is required. Select the Full Names and full mailing address of all the Customers and Employees.In order to create mailing labels the following 5 columns are required: Name, Address, City, Prov, PC. DO NOT return more than 5 columns. There is no need to differentiate between Customer and Employee addresses. (2 marks) =========DONE============
select firstname + ' ' + lastname'name', address, city, province, postalcode from customer
UNION
select firstname + ' ' + lastname, address, city, province, postalcode from employee

--10.	Lets have some random fun! Select the Customer Names that have shaw.ca email addresses and have made more than 3 sales. (3 marks) ======================done==============================
select firstname + ' ' + lastname'names', email,  sale.customerNumber, count(salenumber)'salesMade' from sale
inner join customer on customer.CustomerNumber = sale.customerNumber
group by firstname, lastname,email, sale.customerNumber
having count(salenumber) >= 3
--emails pls
--outjoin COUNT(columnname) otherwise -innerjoin COUNT(*)


--11.	Employees who have the highest INDIVIDUAL(not total) sale each month are recognized with a $5.00 Tim Hortons card! Select the name of the Employee and the email address for the employee that has the highest individual sale for the current month. This query will be run on the last day of each month to determine the winner for that month. You must use a subquery in your solution. (5 marks)=======================done===================

Select firstname,lastname, email, sale.EmployeeNumber, saledate, total from employee 
inner join sale on sale.employeeNumber = employee.employeeNumber
where sale.employeenumber in 
(select employeenumber from sale)
and
year(saledate) = year(getdate()) and month(saledate) = month(getdate())
order by total desc




--12.	BONUS QUESTION! Must get the question completely correct or no bonus marks ☹.
--Who are our best customers? Select ALL the customer full names (as one column),a count of books they have purchased and the number of sales they have. Order the list alphabeticaly by Customer Last Name. (2 marks)
----------select * from customer
----------select customer.customernumber, total
------------, count(customer.customernumber)'numOfSales', sum(quantity)'booksBought', sale.saleNumber 
----------from customer
----------where total = (select total from sale)


----------inner join sale on sale.customernumber = customer.customernumber
----------inner join saledetail on sale.salenumber = saledetail.salenumber
----------group by firstname, lastname, customer.customernumber, quantity, sale.total
----------order by customerNumber--whyyyyyyyyyyyyyyyyyy???

----------select salenumber, count(quantity) from saledetail group by quantity, salenumber
----------select * from saledetail where salenumber = 3054
--find all salenumbers and find quantity total

