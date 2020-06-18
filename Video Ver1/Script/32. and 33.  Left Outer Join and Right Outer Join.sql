CREATE TABLE student (  
   ID INT(11) PRIMARY KEY,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );


CREATE TABLE CourseFees  (  
   ID INT(11) PRIMARY KEY AUTO_INCREMENT,
   studentID INT, 
   fees INT
 );


CREATE TABLE Library (
   ID INT(11)PRIMARY KEY AUTO_INCREMENT,
   studentID INT,
   bookID INT,
   title varchar(45),
   issueDate date
);


INSERT INTO student VALUES (1, 'ramesh', 'patel', '1999-10-17', 'ramesh.patel@gmail.com');
INSERT INTO student VALUES (2, 'rajesh', 'mehta', '2000-12-20', 'rajesh.mehta@gmail.com');
INSERT INTO student VALUES (3, 'vipul', 'shah', '2001-07-19', 'shahvipul@yahoomail.com');
INSERT INTO student VALUES (4, 'kamlesh', 'kaka', '2002-11-26', 'kamlesh.kaka@gmail.com');
INSERT INTO student VALUES (5, 'raj', 'patel', '1999-10-17', 'raj123@gmail.com');
INSERT INTO student VALUES (6, 'sam', '', '2002-11-12', 'sam665@gmail.com');
INSERT INTO student VALUES (7, 'vimal', 'kumar', '2003-01-29', 'vimalkumar@yahoomail.com');
INSERT INTO student VALUES (8, 'suraj', 'nath', '2002-11-26', 'nathsuraj@gmail.com');
INSERT INTO student VALUES (9, 'vijay', 'K', '2003-01-29', 'vijayK@yahoomail.com');
INSERT INTO student VALUES (10, 'sangita', 'M', '2002-11-26', 'sangitaM@gmail.com');


INSERT INTO coursefees VALUES (default, 2, 20000);
INSERT INTO coursefees VALUES (default, 3, 25000);
INSERT INTO coursefees VALUES (default, 4, 12000);
INSERT INTO coursefees VALUES (default, 5, 15000);
INSERT INTO coursefees VALUES (default, 7, 15000);
INSERT INTO coursefees VALUES (default, 9, 15000);


INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (1, 1, 'MySQL', '2020-04-10');
INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (3, 2, 'HTML', '2020-01-01');
INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (5, 3, 'Java', '2020-04-23');
INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (7, 4, 'PHP', '2020-01-02');
INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (8, 5, '.NET', '2020-04-22');
INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (2, 6, 'C++', '2020-04-21');
INSERT INTO library(`studentID`, `bookID`, `title`, `issueDate`) VALUES (6, 7, 'C', '2020-01-10');
INSERT INTO library(`bookID`, `title`, `issueDate`) VALUES (8, 'NodeJS', '2020-01-21');
INSERT INTO library(`bookID`, `title`, `issueDate`) VALUES (9, 'javascript', '2020-01-17');
INSERT INTO library(`bookID`, `title`, `issueDate`) VALUES (10, 'OSC', '2020-03-29');
INSERT INTO library(`bookID`,`title`, `issueDate`) VALUES (11, 'SE', '2020-04-05');



