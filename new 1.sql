select ename,sal, comm, if(isnull(comm), 200, comm) R1 from emp;

select ename,sal, if(sal>=3000, '**********', sal) from emp;

select ename, if(length(ename) > 5, '****', ename) from emp;

select ename, if(left(ename,1)='a','******',ename) from emp;

select ename,job, if(isnull(phone),'**********',rpad(left(phone,4),10,'*')) from emp;

select job, field(job,'manager','salesman','analyst','clerk') as R1

select NORTH, SOUTH, EAST, WEST, field('y', NORTH, SOUTH, EAST, WEST) R1 from zone;

select NORTH, SOUTH, EAST, WEST, case field('y',NORTH, SOUTH, EAST, WEST) when 0 then 'Product not Sold' else 'Sold'  end  R1 from zone;

select NORTH, SOUTH, EAST, WEST, case field('y',NORTH, SOUTH, EAST, WEST) when 0 then 'Product not Sold' when 1 then 'North' when 2 then 'South' when 3 then 'East' when 4 then 'West'  end  R1 from zone;

select hiredate, elt(month(hiredate),'Winter', 'Winter', 'Spring', 'Spring', 'Spring', 'Summer', 'Summer', 'Summer', 'Autumn', 'Autumn', 'Autumn', 'Winter') R1 from emp;

select job, field(job,'manager','salesman','analyst','clerk') as R1 from emp order by 2;
select * from emp order by if(left(ename,1) = 'a',1,ename);