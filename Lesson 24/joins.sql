+--JOINS
+Select * from staff
+Select * from position
+--Select names of all the staff and the position decription they hold
+Select firstname, lastname, positiondescription from staff, position
+--Does not work becaue we need to specify how the tables related to each other.
+--ANSI (old school way. do not use in this course)
+Select firstname, lastname, positiondescription from staff, position 
+where staff.positionID = position.PositionID
+--CORRECT WAY IN SQL SERVER
+Select firstname, lastname, positiondescription from position inner join staff on Position.PositionID = Position.PositionID
+--on identifies how the tables relate (PK in parent, FK in child)
+-- order of the inner join tables or the order of the ON does not matter
+
+--Select positiondescriptions and teh staffnames that are in them... 
+
+--????
+--inner joins only returns records if there are related records in the join
+--Assi Dean(position 7) did not show up because there are no staff in positionid 7
+
+--Select student fullnames and the offering codes they are registered in
+Select student.studentid, firstname + ' ' + lastname'names', offeringcode from student inner join Registration on student.studentid = Registration.StudentID
+--Remember only records that have child records are returned with inner joins.
+--so students that dont have related records arent being returned right now
+--More than 2 table joins
+Select firstname, lastname, PositionDescription, semestercode from Position
+inner join staff on position.positionID = staff.PositionID
+inner join offering on offering.staffid = staff.staffid
