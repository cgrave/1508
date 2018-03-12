--Queries:

--1.	Select the ISBN, title, publisher name and number in stock.  List the data in ISBN sequence. 
--(2 marks)
Select isbn, title, publisher.name, NumberInStock from title
inner join publisher on Publisher.publishercode = title.publishercode

--2.	The company is having a 10% sale on books in the category “Computers”.  Select the ISBN, title, suggested price, the sale price (suggested price less 10%) and the difference between the two values. (2 marks) 
Select ISBN, title, suggestedprice,(SuggestedPrice*0.10)'PriceDifference', SuggestedPrice-(SuggestedPrice*0.10)'SalePrice' from title 

--3.	Select the employee number and name of all the employees who don’t have a sale. Do not use a join. (2 marks)
--subquery

--4.	Select the total number of books sold and the total money earned for the company for the current year. 
--(3 marks)

--5.	Select the category code, category description and the total number of books sold and the total money earned for each and every category.  (4 marks)

--6.	Select the ISBN, title and amount earned for the current year for the titles that sold more than $100(not including GST). (4 marks)

--7.	Write the select statement to return ALL the customer names, CustomerNumbers and how many sales they have. (3 marks)

--8.	Information is required for some sale invoices. Select The CustomerNumber, Full Name, SaleNumber, SaleDate, SubTotal, GST, Total, ISBN, Title Quantity, and Amount for Sale Numbers 3008 to 3010. 
--(3 marks)

--9.	A single St. Patricks Day Card mailing list is required. Select the Full Names and full mailing address of all the Customers and Employees.In order to create mailing labels the following 5 columns are required: Name, Address, City, Prov, PC. DO NOT return more than 5 columns. There is no need to differentiate between Customer and Employee addresses. (2 marks)
--still cannot do

--10.	Lets have some random fun! Select the Customer Names that have shaw.ca email addresses and have made more than 3 sales. (3 marks)

--11.	Employees who have the highest INDIVIDUAL(not total) sale each month are recognized with a $5.00 Tim Hortons card! Select the name of the Employee and the email address for the employee that has the highest individual sale for the current month. This query will be run on the last day of each month to determine the winner for that month. You must use a subquery in your solution. (5 marks)
--not greater than or equal type question
--this month and YEAR

--12.	BONUS QUESTION! Must get the question completely correct or no bonus marks ☹.
--Who are our best customers? Select ALL the customer full names (as one column),a count of books they have purchased and the number of sales they have. Order the list alphabeticaly by Customer Last Name. (2 marks)


--subquery for end of lab assignment
--    look at where grade > ALL (select grade...)
