CREATE TABLE student (  
   ID INT(11) PRIMARY KEY,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );

CREATE TABLE student_address (
   ID INT(11) PRIMARY KEY,
   studentID INT UNIQUE NOT NULL,  
   address VARCHAR(45),  
   city VARCHAR(45) ,  
   FOREIGN KEY (studentID) REFERENCES student(ID)  
); 


CREATE TABLE student_hobbies (  
   ID INT PRIMARY KEY,  
   studentID INT,
   name VARCHAR(45),
   FOREIGN KEY (studentID)   REFERENCES student(ID)
);
