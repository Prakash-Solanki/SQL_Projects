USE Pets
Go

SELECT * FROM PETS;
--100 rows

SELECT * FROM OwnersDetail;
--89rows

SELECT * FROM Procedures;

SELECT * FROM ProceduresRecord;

--Left Join on Pets and Owner table
SELECT *
FROM Pets AS P
LEFT JOIN OwnersDetail As O
ON P.OwnerID = O.OwnerID

--Extracting Pets name and Owner name side by side
--For that we will use left join 

SELECT P.Name AS PetName, O.Name AS OwnerName
FROM Pets AS P
LEFT JOIN OwnersDetail As O
ON P.OwnerID = O.OwnerID

---- Joining Pets and Owner on the basis of Initial letter of their respective name.
SELECT P.Name AS PetName, O.Name AS OwnerName
FROM Pets AS P
LEFT JOIN OwnersDetail As O
ON P.OwnerID = O.OwnerID
WHERE LEFT(P.Name,1) = LEFT(O.Name,1)

--Practicing Right join using above
SELECT *
FROM OwnersDetail As O
LEFT JOIN Pets AS P
ON P.OwnerID = O.OwnerID 

--Finding pets from which clinic had procdures performed 
SELECT * FROM ProceduresRecord
SELECT * FROM PETS
--We will be using INNER JOIN to get the result.

SELECT *
FROM PETS AS A
INNER JOIN ProceduresRecord AS B
ON A.Petid = B.Petid

------FULL OUTER JOIN VS INNER JOIN
---Full Outer Join shows all the results even that are not matched in both table while Inner join displays only matching results.
--FULL OUTER JOIN
SELECT *
FROM PETS AS A
FULL OUTER JOIN ProceduresRecord AS B
ON A.Petid = B.Petid
--INNER JOIN
SELECT A.Name AS PetName, B.ProcedureType 
FROM PETS AS A
INNER JOIN ProceduresRecord AS B
ON A.Petid = B.Petid

--JOINING ON MULTIPLE FIELDS
---MATCHING UP PROCEDURE PERFORMED WITH DESCRIPTIONS
SELECT * FROM Procedures
SELECT * FROM ProceduresRecord

SELECT  A.ProcedureType, A.Description
FROM Procedures AS A
LEFT JOIN ProceduresRecord AS B
ON A.ProcedureType = B.ProcedureType AND A.ProcedureSubCode = B.ProcedureSubCode;

-------COMPLEX JOINS
----MATCHING UP PROCEDURE PERFORMED WITH DESCRIPTIONS BUT ONLY FOR PETS FROM CLINIC ARE IN QUESTION.
SELECT *
FROM PETS AS A
INNER JOIN ProceduresRecord AS B
ON A.Petid = B.Petid
LEFT JOIN Procedures AS C
ON  B.ProcedureType = C.ProcedureType
AND B.ProcedureSubCode = C.ProcedureSubCode;
----ABOVE CODE PROVIDED THE RESULT BUT WE CAN BE NARROW DOWN RESULT BY SEELCTING THE REQUIRED COLUMNS.
-----CLEANING THE JOIN : MEANS REMOVING COLUMNS WHICH ARE REPEATED OR SPECIFY THE REQUIRED COLUMN WITH SELECT STATEMENT
SELECT A.Petid, A.OwnerID, B.ProcedureDate,B.ProcedureType,C.Description
FROM PETS AS A
INNER JOIN ProceduresRecord AS B
ON A.Petid = B.Petid
LEFT JOIN Procedures AS C
ON  B.ProcedureType = C.ProcedureType
AND B.ProcedureSubCode = C.ProcedureSubCode;


----EXTRACT A TABLE OF INDIVIDUAL COSTS(PROCEDURE PRICE) ALONG WITH OWNER
SELECT A.OwnerID,C.Price
FROM PETS AS A
INNER JOIN ProceduresRecord AS B
ON A.Petid = B.Petid
LEFT JOIN Procedures AS C
ON  B.ProcedureType = C.ProcedureType
AND B.ProcedureSubCode = C.ProcedureSubCode;
