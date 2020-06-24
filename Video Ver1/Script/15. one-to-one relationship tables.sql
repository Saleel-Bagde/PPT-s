CREATE TABLE student (  
   ID INT(11) PRIMARY KEY,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );

CREATE TABLE student_address (
   ID int PRIMARY KEY,
   studentID INT UNIQUE NOT NULL,  
   address VARCHAR(45),  
   city VARCHAR(45) ,  
   FOREIGN KEY (studentID) REFERENCES student(ID)  
);

CREATE TABLE person
(
	ID INT PRIMARY KEY ,
	name VARCHAR(45),
	emailID VARCHAR(128)
);

CREATE TABLE passportDetails
(
	passportID INT PRIMARY KEY,
	passport_Number VARCHAR(255),
	person_ID INT UNIQUE,
    FOREIGN KEY (person_ID) REFERENCES person(ID)
);



INSERT INTO student VALUES (1, 'ramesh', 'patel', '1999-10-17', 'ramesh.patel@gmail.com');
INSERT INTO student VALUES (2, 'rajesh', 'mehta', '2000-12-20', 'rajesh.mehta@gmail.com');
INSERT INTO student VALUES (3, 'vipul', 'shah', '2001-07-19', 'shahvipul@yahoomail.com');
INSERT INTO student VALUES (4, 'kamlesh', 'kaka', '2002-11-26', 'kamlesh.kaka@gmail.com');

INSERT INTO student_address VALUES (1, 1, 'paud road', 'pune');
INSERT INTO student_address VALUES (2, 2, 'M.G. road', 'baroda');
INSERT INTO student_address VALUES (3, 3, 'k.k road', 'surat');
INSERT INTO student_address VALUES (4, 4, 'station road', 'baroda');



INSERT INTO person VALUES (1, 'ramesh', 'ramesh.patel@gmail.com');
INSERT INTO person VALUES (2, 'rajesh', 'rajesh.mehta@gmail.com');
INSERT INTO person VALUES (3, 'vipul', 'shahvipul@yahoomail.com');
INSERT INTO person VALUES (4, 'kamlesh', 'kamlesh.kaka@gmail.com');

INSERT INTO passportdetails VALUES (1, 'J8758532', 1);
INSERT INTO passportdetails VALUES (2, 'S9843174', 2);
INSERT INTO passportdetails VALUES (3, 'A9854533', 3);
INSERT INTO passportdetails VALUES (4, 'Z9861245', 4);
