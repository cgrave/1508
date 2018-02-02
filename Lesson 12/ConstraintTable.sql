Drop table CheckConstraint

Create table CheckConstraint
(
ConstraintID int not null identity (1,1) constraint pk_CheckConstraint primary key clustered,
ConstraintType char (3) not null,
PurchaseDate datetime not null
--getdate() returns the current date and time
constraint CK_ValidPurchaseDate check (PurchaseDate <=getdate())
constraint DF_Date default getdate(),
Cost smallmoney not null 
constraint CK_validCost check(cost>0)
constraint DF_Cost default 50,
SellPrice smallmoney not null ,
--constraint CK_validSellPrice check (SellPrice >=0 AND SellPrice<=100)
--constraint CK_validSellPrice check (SellPrice between 0 and 100),
active char(1) not null
--constraint CK_validActive check (active='a' OR active = 'b')
--constraint CK_validActive check (active between 'a' and 'f')
--constraint CK_validActive check (active in('a','b','c','d','e','f'))
--constraint CK_validActive check (active like '[a-f]')
constraint CK_validActive check (active like '[abcdef]'),
code varchar (30) not null
--constraint CK_validCode check (code like 'S%')
--constraint CK_validCode check (code like 'S%T')
constraint CK_validCode check (code like 'S%T_Z'),
identifier varchar (30) not null
constraint CK_validIdentifier check (identifier like ('A%[0-3][k-x]__XYZ_[6-9]')),
PhoneNumber char(13) not null
constraint CK_ValidPhone check (PhoneNumber like '([1-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
PostalCode char(7) not null
constraint CK_ValidPostalCode check (PostalCode like '[a-z][0-9][a-z] [0-9][a-z][0-9]'),
constraint CK_Markup check (SellPrice >= 2*Cost)
)

insert into CheckConstraint(ConstraintType,cost,SellPrice,active,code,identifier,PhoneNumber,PostalCode)
values ('abc',10,25,'c','Sbc123T5Z','Ahello2MSBXYZ!8','(555)123-4567','t8E 1H7')

select * from CheckConstraint
