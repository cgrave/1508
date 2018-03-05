-- String Functions
-- You can use string functions anywhere you can use a column. (Select, where, group by, etc.)
-- len() - returns the length of a string
select len(firstname)'Length', firstname from student
--Select the firstnames that are 4 characters long
Select firstname from student
where len(firstname) = 4

--left() - returns a certain number of characters from the left side of a string
Select left(firstname,2)'first4', firstname from student

--right() - returns a certain number of characters from the right side of a string
Select right(firstname,2)'first4', firstname from student

--substring() - takes certain number of characters from a starting point - 3 param
Select substring(coursename,2,3)'substring',coursename from course

--upper() / lower()
Select upper(firstname)'upper', lower(lastname)'lower' from student

select reverse(firstname + ' ' + lastname)'reverse', firstname + ' ' + lastname'normal'from student 
select reverse('Crystal Grave')

--ltrim(), rtrim()
Select ltrim('  hello')'ltrim'
Select rtrim('hello  -  ')'rtrim'
Select rtrim(ltrim('                hello           '))'trim'

--How many student firstnames start with each letter? (only include letters that are first letter of a students name)
Select left(firstname,1)'firstletter', count(*)'count' from student group by left(firstname, 1)



--Date Functions
Select getdate()'today'
-- add 212 days to today date
Select dateadd(dd,212,getdate())'result'
Select dateadd(yy,20,getdate())'result'
--datediff() returns the difference bwtween 2 dates
Select datediff(yy, 'oct 06 1995',getdate())'age'
Select datediff(dd, 'oct 06 1995',getdate())'age'

--Parts of a date
--Datepart() - returns the integer version of part of a date
Select datepart(dd, getdate())'day of month'
Select datepart(dw, getdate())'day of week'
Select datepart(yy, getdate())'year'
Select datepart(mm, getdate())'month'
--Which month was each payment made.
Select datepart(mm, paymentdate)'paymentmonth' from payment
--Order by paymentmonth asc
--OR
order by datepart(mm, PaymentDate) asc


--Datename() - returns the string version of a part of a date
Select datename(dw, getdate())'day of week'
Select datename(mm, getdate())'month' -- the only ones that actually work

--Because using year, month, day of a date are so common there are functions just for those
Select year(getdate())'year'
Select month(getdate())'month'
Select day(getdate())'day'

--Select the staff full names, their hire date and the month name they were hired! List them chronological order by month
Select firstname + ', ' + LastName'FullNames', datehired, datename(mm,datehired)'month' from staff order by month(datehired)

--How many staff were hired in each month. Show month name and count. List in chronological order by month
-- Remember. If there is a group by any column not in an aggregate must be in the group by
Select datename(mm,datehired)'month', count(*)'count' from staff
group by datename(mm,datehired), month(datehired)
order by month(datehired) asc
--Always use order by for ordering. DO not use group by
