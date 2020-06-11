
CREATE TABLE student_address (  
   studentID INT PRIMARY KEY,  
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
