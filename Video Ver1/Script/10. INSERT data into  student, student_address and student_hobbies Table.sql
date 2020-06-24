-- data for student TABLE


INSERT INTO student VALUES (1, 'ramesh', 'patel', '1999-10-17', 'ramesh.patel@gmail.com');
INSERT INTO student VALUES (2, 'rajesh', 'mehta', '2000-12-20', 'rajesh.mehta@gmail.com');
INSERT INTO student VALUES (3, 'vipul', 'shah', '2001-07-19', 'shahvipul@yahoomail.com');
INSERT INTO student VALUES (4, 'kamlesh', 'kaka', '2002-11-26', 'kamlesh.kaka@gmail.com');

INSERT INTO student VALUES (default, 'ramlal', 'kumar', '2000-11-07', 'ramlal447@gmail.com');
INSERT INTO student VALUES (default, 'raj', 'sharma', '2001-12-20', 'raj1999@gmail.com');
INSERT INTO student VALUES (default, 'bimal', 'verma', '1998-07-19', 'bimal1984@yahoomail.com');
INSERT INTO student VALUES (default, 'kamlesh', 'kumar', '1999-11-26', 'kamlesh1623@gmail.com');

INSERT INTO student (ID, firstName, lastName, DoB, emailID) VALUES (9, 'rajesh', 'mehta', '2000-12-20', 'rajesh.mehta@gmail.com');
INSERT INTO student (firstName, lastName, DoB, emailID) VALUES ('raj', 'sharma', '2001-12-20', 'raj1999@gmail.com');



-- data for student_address TABLE
INSERT INTO student_address VALUES (1, 1, 'paud road', 'pune');
INSERT INTO student_address VALUES (2, 2,'M.G. road', 'baroda');
INSERT INTO student_address VALUES (3, 3,'k.k road', 'surat');
INSERT INTO student_address VALUES (4, 4,'station road', 'baroda');

-- data for student_hobbies TABLE

INSERT INTO student_hobbies VALUES (1, 1, 'running');
INSERT INTO student_hobbies VALUES (2, 1, 'reading');
INSERT INTO student_hobbies VALUES (3, 2, 'football');
INSERT INTO student_hobbies VALUES (4, 2, 'running');
INSERT INTO student_hobbies VALUES (5, 3, 'watching movies');
INSERT INTO student_hobbies VALUES (6, 4, 'gaming');

