CREATE TABLE student (  
   ID INT(11) PRIMARY KEY,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );


CREATE TABLE student (  
   ID INT(11) PRIMARY KEY AUTO_INCREMENT,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );


CREATE TABLE student (
   ID INT(11),
   firstName VARCHAR(45),
   lastName VARCHAR(45),
   DoB DATE, 
   emailID VARCHAR(145),
   PRIMARY KEY (ID, emailID)
);
