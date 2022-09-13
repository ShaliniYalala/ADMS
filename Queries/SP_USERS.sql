-- CREATE SP SP_ADD_USERDATA

CREATE PROCEDURE SP_ADD_USERDATA
(
	@FIRSTNAME VARCHAR(50),
	@LASTNAME VARCHAR(50),
	@DOB DATE,
	@PHONE VARCHAR(20),
	@EMAIL VARCHAR(50),
	@OCCUPATION VARCHAR(30),
	@GENDER VARCHAR(15),
	@MARTIALSTAT VARCHAR(15),
	@ADD_LINE1 VARCHAR(30),
	@ADD_LINE2 VARCHAR(40),
	@POSTALCODE VARCHAR(15),
	@CITY VARCHAR(30),
	@STATE VARCHAR(30),
	@COUNTRY VARCHAR(20),
	@CO_FNAME VARCHAR(30),
	@CO_LNAME VARCHAR(30)
)
AS
BEGIN
	INSERT INTO USER_DATA
	VALUES
	(
		@FIRSTNAME,
		@LASTNAME,
		@DOB,
		@PHONE,
		@EMAIL,
		@OCCUPATION,
		@GENDER,
		@MARTIALSTAT,
		@ADD_LINE1,
		@ADD_LINE2,
		@POSTALCODE,
		@CITY,
		@STATE,
		@COUNTRY,
		@CO_FNAME,
		@CO_LNAME
	)
END


-- PROCEDURE TO CHECK IF DUPLICATE USER

CREATE PROCEDURE SP_DUPLICATE_USER
(
	@FIRSTAME VARCHAR(30),
	@LASTNAME VARCHAR(30),
	@EMAIL VARCHAR(50),
	@ADD_LINE1 VARCHAR(30)
)
AS
BEGIN
SELECT * FROM USER_DATA WHERE FIRSTNAME=@FIRSTAME AND LASTNAME=@LASTNAME AND EMAIL=@EMAIL AND ADD_LINE1=@ADD_LINE1
END

select * from user_data

-- SP TO GET ALL USER DATA

CREATE PROCEDURE SP_GETALL_USERDATA
AS
BEGIN
SELECT * FROM USER_DATA
END

--SP TO GET USER DATA BY USERS SP_GET_USERDATA_BYUSER
CREATE PROCEDURE SP_GET_USERDATA_BYUSER
(
	@UID VARCHAR(30),
	@EMAIL VARCHAR(50)
)
AS
BEGIN
SELECT * FROM USER_DATA WHERE UID=@UID AND EMAIL=@EMAIL
END

-- CREATE SP FOR USERS LOGIN

CREATE PROCEDURE SP_GET_USER_LOGIN
(
	@UID VARCHAR(15),
	@EMAIL VARCHAR(50)
)
AS
BEGIN
SELECT * FROM USER_DATA WHERE UID=@UID AND EMAIL=@EMAIL
END


-- CREATE SP TO GET DETAILS BY AADHAR NUMBER UID
CREATE PROCEDURE SP_GET_USERDATA_BYAID
(
	@UID VARCHAR(15)
)
AS
BEGIN
SELECT * FROM USER_DATA WHERE UID=@UID
END


-- CREATE SP TO EDIT DATA BY UID

CREATE PROCEDURE SP_EDIT_DATABY_UID
(
	@UID VARCHAR(15),
	@FIRSTNAME VARCHAR(50),
	@LASTNAME VARCHAR(50),
	@DOB DATE,
	@PHONE VARCHAR(20),
	@EMAIL VARCHAR(50),
	@OCCUPATION VARCHAR(30),
	@GENDER VARCHAR(15),
	@MARTIALSTAT VARCHAR(15),
	@ADD_LINE1 VARCHAR(30),
	@ADD_LINE2 VARCHAR(40),
	@POSTALCODE VARCHAR(15),
	@CITY VARCHAR(30),
	@STATE VARCHAR(30),
	@COUNTRY VARCHAR(20),
	@CO_FNAME VARCHAR(30),
	@CO_LNAME VARCHAR(30)
)
AS
BEGIN
UPDATE USER_DATA
SET FIRSTNAME=@FIRSTNAME, LASTNAME=@LASTNAME, DOB=@DOB, PHONE=@PHONE,
	EMAIL=@EMAIL, OCCUPATION=@OCCUPATION, GENDER=@GENDER, MARTIALSTAT=@MARTIALSTAT,
	ADD_LINE1=@ADD_LINE1, ADD_LINE2=@ADD_LINE2, POSTALCODE=@POSTALCODE, CITY=@CITY,
	STATE=@STATE, COUNTRY=@COUNTRY, CO_FNAME=@CO_FNAME, CO_LNAME=@CO_LNAME
WHERE UID=@UID
END