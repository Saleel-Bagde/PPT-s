CREATE TABLE student (  
   ID INT(11) PRIMARY KEY,
   firstName VARCHAR(45), 
   lastName VARCHAR(45),
   DoB DATE,
   emailID VARCHAR(145)
 );

CREATE TABLE student_hobbies (  
   ID INT PRIMARY KEY,  
   studentID INT,
   name VARCHAR(45),
   FOREIGN KEY (studentID) REFERENCES student(ID)
);

CREATE TABLE invoice (  
   ID INT PRIMARY KEY,  
   customerID INT,
   invoiceDate date,
   invoiceAmount INT
);

CREATE TABLE invoice_items (  
   ID INT PRIMARY KEY,  
   invoiceID INT not null,
   itemNumber INT,
   itenName VARCHAR(45),
   itemQuantity INT,
   itemRate INT,
   FOREIGN KEY (invoiceID) REFERENCES invoice(ID)
);

INSERT INTO student VALUES (1, 'ramesh', 'patel', '1999-10-17', 'ramesh.patel@gmail.com');
INSERT INTO student VALUES (2, 'rajesh', 'mehta', '2000-12-20', 'rajesh.mehta@gmail.com');
INSERT INTO student VALUES (3, 'vipul', 'shah', '2001-07-19', 'shahvipul@yahoomail.com');
INSERT INTO student VALUES (4, 'kamlesh', 'kaka', '2002-11-26', 'kamlesh.kaka@gmail.com');

INSERT INTO student_hobbies VALUES (1, 1, 'running');
INSERT INTO student_hobbies VALUES (2, 1, 'reading');
INSERT INTO student_hobbies VALUES (3, 2, 'football');
INSERT INTO student_hobbies VALUES (4, 2, 'running');
INSERT INTO student_hobbies VALUES (5, 3, 'watching movies');
INSERT INTO student_hobbies VALUES (6, 4, 'gaming');


INSERT INTO invoice VALUES (1, 1, '2001-10-19', 4000);
INSERT INTO invoice VALUES (2, 2, '2002-11-09', 350);
INSERT INTO invoice VALUES (3, 1, '2008-02-03', 450);
INSERT INTO invoice VALUES (4, 3, '2008-03-16', 540);
INSERT INTO invoice VALUES (5, 3, '2009-06-21', 120);
INSERT INTO invoice VALUES (6, 2, '2009-02-21', 320);
INSERT INTO invoice VALUES (7, 1, '2009-11-11', 539);
INSERT INTO invoice VALUES (8, 2, '2007-01-20', 125);
INSERT INTO invoice VALUES (9, 3, '2016-10-10', 160);
INSERT INTO invoice VALUES (10, 4, '2019-11-11', 335);
INSERT INTO invoice VALUES (11, 2, '2020-06-15', 775);



INSERT INTO invoice_items VALUES (1, 1, 1, 'pen', 4, 50);
INSERT INTO invoice_items VALUES (2, 1, 2, 'pen', 5, 50);
INSERT INTO invoice_items VALUES (3, 2, 1, 'pencile', 5, 10);
INSERT INTO invoice_items VALUES (4, 2, 2, 'rubber', 7, 10);
INSERT INTO invoice_items VALUES (5, 2, 3, 'ink', 2, 100);
INSERT INTO invoice_items VALUES (6, 3, 1, 'shapner', 4, 7);
INSERT INTO invoice_items VALUES (7, 3, 2, 'book', 6, 75);
INSERT INTO invoice_items VALUES (8, 1, 3, 'notebook', 4, 65);
INSERT INTO invoice_items VALUES (9, 4, 1, 'marker', 2, 25);
INSERT INTO invoice_items VALUES (10, 5, 1, 'paper', 3, 125);
INSERT INTO invoice_items VALUES (11, 4, 2, 'u pin', 4, 45);
INSERT INTO invoice_items VALUES (12, 3, 3, 'gum', 7, 150);
INSERT INTO invoice_items VALUES (13, 3, 4, 'cardboard', 1, 175);
INSERT INTO invoice_items VALUES (14, 1, 4, 'whiteboard', 1, 750);
INSERT INTO invoice_items VALUES (15, 4, 3, 'paper', 2, 150);



