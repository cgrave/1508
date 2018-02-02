Drop table CheckConstraint

Create table CheckConstraint
(
ConstraintID int not null identity (1,1) constraint pk_CheckConstraint primary key clustered,
ConstraintType char (3) not null,
PurchaseDate datetime not null 
constraint ck_validPurchaseDate check(PurchaseDate <=getdate()) 
constraint df_Date default getdate(),
Cost smallmoney not null constraint ck_validCost check(cost>0)
constraint df_cost default 50,
SellPrice smallmoney not null
--constraint ck_validSellPrice check(SellPrice >=0 AND SellPrice <=100)
constraint ck_validSellPrice check(SellPrice between 0 and 100),
active char(1) not null
--constraint ck_validActive check(active = 'a' OR active = 'b')
--constraint ck_validActive check(active between 'a' and 'f')
--constraint ck_validActive check(active in('a', 'b', 'c', 'd', 'e', 'f'))
--constraint ck_validActive check(active like '[a-f]')
constraint ck_validActive check(active like '[abcdef]'),
code varchar (30) not null constraint ck_validCode check(code like 'S%T_Z'),
identifier varchar (30) not null constraint ck_validIdentifier check(identifier like ('A%[0-3][k-x]__XYZ_[6-9]')),
PhoneNumber char(13) not null constraint ck_validPhone check(PhoneNumber like '([1-9][0-9][0-9])[0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]'),
PostalCode char(7) not null constraint cl_validPostalCode check(PostalCode like '[a-z][0-9][a-z][a-z][0-9][a-z]' ),
)

insert into CheckConstraint(ConstraintType, cost, SellPRice, active, code, identifier, PhoneNumber, PostalCode)
values('abc', 10,15, 'c', 'Sbc123T5Z', 'Ahello2MSBXYZ!8', '(555)123-4567', 't9e 1b5')

select * from CheckConstraint
