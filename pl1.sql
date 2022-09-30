/*
signal sqlstate '42000' SET message_text = ''
declare exit handler for 1146 call display("Table not found!");

drop procedure if exists pro1;
delimiter $$
create procedure pro1()
begin
	select "Hello World" as "Message Box";
end $$
delimiter ;

------------------------------------------------------------
drop procedure if exists pro2;
delimiter $$
create procedure pro2(a int, b int)
begin
	select (a + b) as "Output Window" ;
end $$
delimiter ;
------------------------------------------------------------
drop procedure if exists display;
delimiter $$
create procedure display(msg varchar(2000))
begin
	select msg as "Message Window";
end $$
delimiter ;

------------------------------------------------------------
drop procedure if exists pro3;
delimiter $$
create procedure pro3(a int, b int)
begin
	declare x int;
	set x := a + b;
	call display(concat("Result: ", x));
end $$
delimiter ;

------------------------------------------------------------

drop procedure if exists pro1;
delimiter $$
create procedure pro1()
begin
   select ename,pwd, lpad(substr(pwd, instr(pwd, "@") +1), length(pwd) , "*")  R1 from emp;
end $$   
delimiter ;


---------------------------- loop --------------------------------

drop procedure if exists pro1;
delimiter $$
create procedure pro1(a varchar(10))
begin
    declare x int default 1;
	lbl:loop
		if x <= length(a) then
			select concat(substr(a,x,1), " --> ", ascii(substr(a,x,1)) ) R1;
		else
			leave lbl;
		end if;
		set x:= x + 1;
	end loop lbl;
end $$   
delimiter ;

----------------------------  loop OTP -------------------------------- 

drop procedure if exists pro1;
delimiter $$
create procedure pro1(a int)
begin
    declare x int default 1;
	declare o int default 0;
	declare xx boolean default false;
	lbl:loop
		if x <= a then
			set o :=  floor(rand() * (999999 - 100000 + 1) + 100000);
				select true into xx from otp where c1 = o;
			if not xx then
				insert into otp value(o);
			end if;
		else
			leave lbl;
		end if;
		set x:= x + 1;
	end loop lbl;
	
	select concat(x , " OTP generated") R1;
end $$   
delimiter ;


------------------------------------------------------------
drop procedure if exists insertDEPT;
delimiter $$
create procedure insertDEPT(_deptno int, _dname varchar(12), _loc varchar(10), _pwd varchar(20))
begin
    if _deptno > 50 then
		insert into dept values(_deptno, _dname, _loc, _pwd);
		call display("Record Inserted...");
	else
		call display("Invalid number..");
	end if;
end $$
delimiter ;
------------------------------------------------------------

drop procedure if exists insertDEPT;
delimiter $$
create procedure insertDEPT(_deptno int, _dname varchar(12), _loc varchar(10))
begin
 declare exit handler for 1146 call display("Table not found!");
 declare exit handler for 1054 call display("_pwd not found!");
 
    if _deptno > 50 then
		insert into dept values(_deptno, _dname, _loc, _pwd);
		call display("Record Inserted...");
	else
		call display("Invalid number..");
	end if;
end $$
delimiter ;
------------------------------------------------------------
drop procedure if exists insertDEPT;
delimiter $$
create procedure insertDEPT(_deptno int, _dname varchar(12), _loc varchar(10), _pwd varchar(20))
begin
 declare continue handler for 1146 call display("Table not found!");
    if _deptno > 50 then
		insert into deptZZZZ values(_deptno, _dname, _loc, _pwd);
		call display("Record Inserted...");
	else
		call display("Invalid number..");
	end if;
	call display('Out of IF BLOCK');
end $$
delimiter ;
------------------------------------------------------------
drop procedure if exists selectAllEMP;
delimiter $$
create procedure selectAllEMP()
begin
  declare continue handler for 1146 call display("Table not found!");
  select * from emp;
end $$
delimiter ;
------------------------------------------------------------

drop procedure if exists selectEMP;
delimiter $$
create procedure selectEMP(_deptno int)
begin
  declare exit handler for 1146 call display("Table not found!");
  select * from emp where deptno = _deptno;
end $$
delimiter ;
------------------------------------------------------------
drop procedure if exists selectEMP;
delimiter $$
create procedure selectEMP(x int) # 20 error   # 7788
begin
  declare _empno, _sal, _deptno int;
  declare  _ename, _job varchar(20);
  
  declare exit handler for 1146 call display("Table not found!");

  select empno, ename, job, sal, deptno into _empno, _ename, _job, _sal, _deptno from emp where empno = x;
  
  if _empno  is not null then
	select _empno, _ename, _job, _sal, _deptno;
  else
    call display("Record not found...");
  end if;
 end $$
delimiter ;
------------------------------------------------------------
drop function if exists f1;
delimiter $$
create function f1() returns varchar(100)
begin
	return 'Hello World';
end $$
delimiter ;
------------------------------------------------------------
drop function if exists f2;
delimiter $$
create function f2(a int, b int) returns int
begin
	declare z int;
	set z := ifnull(a, 0) + ifnull(b, 0);
	return z;
end $$
delimiter ;
------------------------------------------------------------
drop function if exists f3;
delimiter $$
create function f3() returns int
begin
	declare z int;
	declare exit handler for 1146 call display("Table not found!");
	
	select max(deptno) + 1 into z from dept;
	return (z);
end $$
delimiter ;
------------------------------------------------------------
drop function if exists f1;
delimiter $$
create function f1() returns int
begin
	declare x, y int;
	select count(deptno) into y from dept;
	
	if y = 0 then
		SET x:= 1;
	else
		select max(deptno) + 1 into x from dept;
	end if;
	return x;
end $$
delimiter ;
------------------------------------------------------------
drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on dept for each row
begin
	insert into log(message) values ("Hello World!");
end $$
delimiter ;
------------------------------------------------------------
drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on dept for each row
begin
	insert into autiddept values (new.deptno, new.dname, new.loc, new.pwd);
end $$
delimiter ;
------------------------------------------------------------
drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on dept for each row
begin
	insert into auditdept values (new.deptno, new.dname, new.loc, new.pwd, current_date(), current_time(), user(), "Static Remark");
end $$
delimiter ;


# mysql> insert into dept values(43,'Sports','Banglore','**##**');
# mysql> insert into dept values(44,'Purchase','Surat','####');

------------------------------------------------------------

drop trigger if exists t1;
delimiter $$
create trigger t1 after delete on dept for each row
begin
	insert into auditdeptdelete values (old.deptno, old.dname, old.loc, old.pwd, current_date(), current_time(), user(), "Static Remark");
end $$
delimiter ;


# mysql> delete from dept where deptno = 41;
# mysql> delete from dept where deptno = 42;

------------------------------------------------------------

drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on dept for each row
begin
	SET new.dname := ucase(new.dname);
	SET new.loc := upper(new.loc);
	
end $$
delimiter ;


# mysql> insert into dept values(45,'postal','baroda','******');
# mysql> insert into dept values(46,'railway','anand','******');

------------------------------------------------------------
drop trigger if exists t2;
delimiter $$
create trigger t2 before insert on dept for each row
begin
	SET new.deptno := (select max(deptno) + 1 from dept);
end $$
delimiter ;

# mysql> insert into dept(dname, loc, pwd) values('management','bharuch','******');
# mysql> insert into dept(dname, loc, pwd) values('dispatch','ahmadbad','******');
# mysql> insert into dept(dname, loc, pwd) values('computer','mumbai','******');

------------------------------------------------------------
drop trigger if exists t3;
delimiter $$
create trigger t3 before insert on dept for each row
begin
	SET new.pwd := concat(left(new.pwd, 5), '*****');
end $$
delimiter ;

# mysql> insert into dept(dname, loc, pwd) values('abc','qqq','pass1word@1234');
# mysql> insert into dept(dname, loc, pwd) values('pqr','www','pass2word@1234');
# mysql> insert into dept(dname, loc, pwd) values('xyz','eee','pass3word@1234');

------------------------------------------------------------


a --> 5
b --> 6
c --> 7



# mysql> insert into dept(dname, loc, pwd) values('xyz','eee','567');


drop procedure if exists pro1;
delimiter $$
create  procedure pro1()
begin
declare x int default 1;
lbl:loop
	select x;
	
	SET x :=  x + 1;
	
	if x > 10 then
		leave lbl;
	end if;

end loop lbl;
end $$
delimiter ;


# x := 'saleel'




O/P

s
e
l
e
e 
------------------------------------------------------------
drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on dept for each row
begin
	 if NEW.loc not like 'P%' then
		signal sqlstate '42000' SET message_text = 'Invalid Location. Location must start with the letter [ "P" ]';
	 end if;
	  
end $$
delimiter ;

# mysql> insert into dept values(1, 'pqr','www','pass2');
# mysql> insert into dept values(2, 'xyz','Peru','pass3');

------------------------------------------------------------


drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on d for each row
begin
	declare x int;
	SET x := (select count(*) from d);
	
	 if x > 4 then
		signal sqlstate '42000' SET message_text = 'More than 4 records';
	 end if;  
end $$
delimiter ;

drop trigger if exists t2;
delimiter $$
create trigger t2 after insert on d1 for each row
begin
	declare x int;
	SET x := (select count(*) from d1);
	
	 if x > 4 then
		signal sqlstate '42000' SET message_text = 'More than 4 records';
	 end if;  
end $$
delimiter ;



drop procedure if exists pro1;
delimiter $$
create procedure pro1(_deptno INT)
begin
  declare x, x1 int;
  declare y, z varchar(20);
  declare c1 CURSOR FOR select empno, ename, job, deptno from emp where deptno = _deptno;
  declare exit handler for 1329 select "No More data to extract" as R1;
  open c1;
    lbl:loop
	   fetch c1 into x, y, z, x1;
       select x, y, z, x1;
	 end loop;
  close c1;
  
end $$
delimiter ;


DROP PROCEDURE if EXISTS pro1;
delimiter $$
CREATE PROCEDURE pro1(v_ID int)
b1:begin
  declare x int; 
  SELECT ID into x FROM student WHERE ID = v_ID;
  
  if x is null then 
    SELECT "Student not found....";
  else
    b2:begin
		declare v_name, v_college, v_university varchar(128);
		declare v_marks varchar(45);
		declare v_year int;
		declare cur1 cursor for SELECT name, college, university, marks, year FROM student_qualifications where studentID = x;
		declare exit handler for NOT FOUND SELECT "Done";
		OPEN cur1;
			lbl:loop
			FETCH cur1 INTO v_name, v_college, v_university, v_marks, v_year;
			SELECT v_name, v_college, v_university, v_marks, v_year;
			end loop lbl;
		CLOSE cur1; 
	end b2;
end if;
end b1 $$
delimiter ;

--------------------------------------------------------

drop procedure if exists pro1;
delimiter $$
create procedure pro1(x int)
begin
	#declare x int;
	#SET x := 1001;
	select x;
end $$
delimiter ;




drop procedure if exists pro1;
delimiter $
create procedure pro1()
begin
	declare x bool default false;
	begin
	declare y bool default true;
		select x;
	end ;
	select y;
end $
delimiter ; 


DROP PROCEDURE IF EXISTS procedurename;
delimiter $$
CREATE PROCEDURE procedurename(c1 VARCHAR(10), x VARCHAR(10)) 
begin
   SET @t1 = CONCAT('SELECT ', c1 ,' FROM ',x );
   PREPARE stmt3 FROM @t1;
   EXECUTE stmt3;
end $$
delimiter ;

	

drop function if exists f2;
delimiter $$
create function f2(a int, b int) returns int
DETERMINISTIC
begin
	declare z int;
	set z := ifnull(a, 0) + ifnull(b, 0);
	return z;
end $$
delimiter ;


drop procedure if exists pro1;
delimiter $$
create procedure pro1(_custID int)
begin
	declare flag bool;
	set flag = (select true from customer where custid= _custID);
	if flag then
		begin
			declare _ordID int;
			declare _ORDERDATE, _SHIPDATE datetime;
			declare _STATUS, _COMMPLAN varchar(45);
			declare _TOTAL float(8,2);
			
			declare c1 cursor for select ordID, ORDERDATE, COMMPLAN, SHIPDATE, STATUS, TOTAL   from ord where custid = _custID;
			
			open c1;
			lblLoop:loop
			fetch c1 into _ordID, _ORDERDATE, _COMMPLAN, _SHIPDATE, _STATUS, _TOTAL;
			
			select _ordID, _ORDERDATE, _COMMPLAN, _SHIPDATE, _STATUS, _TOTAL;
			end loop;
			close c1;
		end ;
	end if;
end $$
delimiter ;





drop procedure if exists pro1;
delimiter $$
create procedure pro1(_custID int, _status varchar(45))
begin
	declare flag bool;
	set flag = (select true from customer where custid= _custID);
	if flag then
	select * from customer where custid= _custID;
		begin
			declare _ordID int;
			declare _ORDERDATE, _SHIPDATE datetime;
			declare _COMMPLAN varchar(45);
			declare _TOTAL float(8,2);
			
			declare c1 cursor for select ordID, ORDERDATE, COMMPLAN, SHIPDATE, TOTAL   from ord where custid = _custID and status= _status;
			
			open c1;
			lblLoop:loop
			fetch c1 into _ordID, _ORDERDATE, _COMMPLAN, _SHIPDATE, _TOTAL;
			
			select _ordID, _ORDERDATE, _COMMPLAN, _SHIPDATE, _status _TOTAL;
			end loop;
			close c1;
		end ;
	end if;
end $$
delimiter ;



drop procedure if exists pro1;
delimiter $$
create procedure pro1(x int)
begin
	if (select true from dept where deptno = x) then
	  select * from emp where deptno=x;
	else
	  select "Data Not cound";
	end if;
end $$
delimiter ;


drop procedure if exists pro1;
delimiter $$
create procedure pro1(_custID int)
begin
	if (select true from customer where custid= _custID) then
		begin
			declare _ordID int;
			declare _ORDERDATE, _SHIPDATE datetime;
			declare _STATUS, _COMMPLAN varchar(45);
			declare _TOTAL float(8,2);
			
			declare c1 cursor for select ordID, ORDERDATE, COMMPLAN, SHIPDATE, STATUS, TOTAL   from ord where custid = _custID;
			
			open c1;
			lblLoop:loop
			fetch c1 into _ordID, _ORDERDATE, _COMMPLAN, _SHIPDATE, _STATUS, _TOTAL;
			
			select _ordID, _ORDERDATE, _COMMPLAN, _SHIPDATE, _STATUS, _TOTAL;
			end loop;
			close c1;
		end ;
	end if;
end $$
delimiter ;




drop function if exists f1;
delimiter $$
create function f1(x int, y int) returns varchar(100)
not deterministic
begin

	return x+y;
end $$
delimiter ;




drop procedure if exists pro1;
delimiter $$
create procedure pro1()
begin
  declare x int;
  declare p, q, r varchar(20);
  declare c1 CURSOR FOR select * from d;
  declare exit handler for 1329 select "No More data to extract" as R1;
  open c1;
    select sleep(10);
    lbl:loop
	   fetch c1 into x, p, q, r;
       select x, p, q, r;
	 end loop;
  close c1;
  
end $$
delimiter ;



drop procedure if exists main;
delimiter $$
create procedure main()
begin
	declare a int;
  call ret((10+10), a);
  select a;
  select abs(a);
end $$
delimiter ;


drop procedure if exists ret;
delimiter $$
create procedure ret(in x int, out y int)
begin
	set y := x;
end $$
delimiter ;



delimiter |

CREATE EVENT e_daily
    ON SCHEDULE
      EVERY 1 DAY
    COMMENT 'Saves total number of sessions then clears the table each day'
    DO
      BEGIN
        INSERT INTO site_activity.totals (time, total)
          SELECT CURRENT_TIMESTAMP, COUNT(*)
            FROM site_activity.sessions;
        DELETE FROM site_activity.sessions;
      END |

delimiter ;


drop event if EXISTS  e1;
delimiter $$
CREATE EVENT e1
    ON SCHEDULE
      every 1 SECOND
    DO 
	BEGIN
	declare x1 int default 0;
	  begin
		SET x1:=x1+1;
	    insert into x VALUE(x1);
	  end ;
	end $$
delimiter ;




drop function if exists f1;
delimiter $

CREATE function f1() returns varchar(100)
BEGIN
	create table aa(c1 int);
	return "Done";
END $
delimiter ;


drop procedure if exists pro1;
delimiter $

CREATE procedure pro1()
BEGIN
	#create table aa(c1 int);
	#alter table aa add c2 int;
	#drop table aa;
END $
delimiter ;





drop function if exists f1;
delimiter $

CREATE function f1() returns varchar(100)
DETERMINISTIC
BEGIN
	insert into dept values(1,1,1,10);
	return "Done";
END $
delimiter ;



drop function if exists f1;
delimiter $$
create function f1() returns varchar(10)
deterministic
begin
	declare x int default 0;
	insert into dt values(now(), sysdate());
	lbl:LOOP
		
		set x:=x+1;
		insert into d values(x,1,1,1);
		if x>4320 then 
			leave lbl;
		end if;
	end loop lbl;
	insert into dt values(now(), sysdate());
	return "done";
end $$
delimiter ;


drop trigger if exists t1;
delimiter $$
create trigger t1 before insert on b for each row
begin
	insert into b1 values(new.c1, new.c2);
end $$
delimiter ;

drop function if exists f1;
delimiter $$
create function f1() returns int
deterministic
begin
	return (select sum(sal) from db1.emp);
end $$
delimiter ;





drop function if exists f1;
delimiter $

CREATE function f1() returns varchar(10)
deterministic
BEGIN
	create table aa(c1 int);
	#alter table aa add c2 int;
	#drop table aa;
	return "done";
END $
delimiter ;




drop procedure if exists pro1;
delimiter $
CREATE procedure pro1(in _DEPTNO int, _DNAME varchar(20), _LOC varchar(20), _PWD varchar(20))
BEGIN
	SET @a := _DEPTNO;
	SET @b := _DNAME;
	SET @c := _LOC;
	SET @d := _PWD;
	
	set @x:= concat("insert into dept values(?, ?, ?, ?)");
	
	prepare s from @x;
	execute s using @a, @b, @c ,@d;
	
end $
delimiter ;



DROP PROCEDURE IF EXISTS pro1;
delimiter $$
CREATE PROCEDURE pro1()
begin
  declare x INT;
  declare p, q, r VARCHAR(20);
  declare c1 CURSOR FOR SELECT * FROM dept;
  declare EXIT HANDLER FOR 1329 SELECT "No More data to extract" as R1;
  OPEN c1;
      SELECT sleep(20);
      lbl:loop
           FETCH c1 INTO x, p, q, r;
           SELECT x, p, q, r;
      end loop;
  CLOSE c1;  
end $$
delimiter ;



DROP PROCEDURE IF EXISTS pro1;
delimiter $$
CREATE PROCEDURE pro1()
b1:begin
  declare x int default 1001;
  b2:BEGIN
   declare y int default 1002;
   select  x;
  END b2;
  select  y;
end b1 $$
delimiter ;




-- DROP TRIGGER IF EXISTS triggername;
-- delimiter $$
-- CREATE TRIGGER triggername BEFORE INSERT ON temp FOR EACH ROW
-- begin
   -- INSERT INTO temp1 VALUES(NEW.c1);
-- end $$
-- delimiter ;


DROP TRIGGER IF EXISTS triggername;
delimiter $$
CREATE TRIGGER triggername AFTER INSERT ON temp FOR EACH ROW
begin
   INSERT INTO temp1 VALUES(NEW.c1);
end $$
delimiter ;




drop function if exists f11;
delimiter $
create function f11() returns varchar(40)
deterministic
begin
	declare x, y, z varchar(40) default "";
	declare cnt int default 1;
	lbl:loop
		select cast(char(floor(65 + rand() * 27)) as char) into y;
		select cast(char(floor( 97 + rand() * 27)) as char) into z;
		SET x := concat(x, y,z);
		
		if cnt > 2 then
			leave lbl;
		end if;
		SET cnt := cnt + 1;
	end loop lbl;
	return(x);
end $
delimiter ;




drop procedure if exists p1;
delimiter $$
create procedure p1(x int)
begin
	SET x:= (select 1001);
	SET @y := (select 2001);
end $$
delimiter ;


drop function if exists f11;
delimiter $
create function f11(x int) returns varchar(40)
deterministic
begin
	SET x := (select 1002);
	SET @y := (select 2002);
	return(x);
end $
delimiter ;



**** SQL-INJECTiON ****

drop procedure if exists pro3;
delimiter $$
create procedure pro3(x varchar(20))
begin
   set @t1 = CONCAT("SELECT * FROM emp where ename='", x, "'");
   select @t1;
   PREPARE STMT FROM @t1;
   EXECUTE STMT;

end $$
delimiter ;

#mysql> call pro3("smith' or 1=1 --'");
#mysql> call pro3("'smith' or 1=1");



*/










































