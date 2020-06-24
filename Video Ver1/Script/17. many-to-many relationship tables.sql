 CREATE TABLE student (  
   ID INT(11) PRIMARY KEY,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );
 
 CREATE TABLE course (
   ID int(11) PRIMARY KEY ,
   name varchar(45),
   duration int(11),
   summery varchar(1024)
 );
 
 CREATE TABLE course_student (  
    ID INT(11) PRIMARY KEY,  
    studentID INT NOT NULL,        
    courseID INT NOT NULL,   
    foreign key (studentID) references student(ID),         
    foreign key (courseID) references course(ID)
);


INSERT INTO student VALUES (1, 'ramesh', 'patel', '1999-10-17', 'ramesh.patel@gmail.com');
INSERT INTO student VALUES (2, 'rajesh', 'mehta', '2000-12-20', 'rajesh.mehta@gmail.com');
INSERT INTO student VALUES (3, 'vipul', 'shah', '2001-07-19', 'shahvipul@yahoomail.com');
INSERT INTO student VALUES (4, 'kamlesh', 'kaka', '2002-11-26', 'kamlesh.kaka@gmail.com');


INSERT INTO course VALUES (1, 'MySQL', 1, 'Learn RDBMS usng MySQL');
INSERT INTO course VALUES (2, 'HTML', 1, 'Learn basic HTML string');
INSERT INTO course VALUES (3, 'java', 2, 'Learn core java');
INSERT INTO course VALUES (4, '.NET', 2, 'Learn C##');


INSERT INTO course_student VALUES(1, 1, 1);
INSERT INTO course_student VALUES(2, 1, 2);
INSERT INTO course_student VALUES(3, 2, 3);
INSERT INTO course_student VALUES(4, 2, 4);
INSERT INTO course_student VALUES(5, 3, 1);
INSERT INTO course_student VALUES(6, 3, 4);
INSERT INTO course_student VALUES(7, 4, 2);
INSERT INTO course_student VALUES(8, 4, 3);
INSERT INTO course_student VALUES(9, 1, 4);
INSERT INTO course_student VALUES(10, 2, 1);
