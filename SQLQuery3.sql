create database FISGlobal


create table tblDept
(deptno int primary key,
 dname varchar(20) not null, 
 loc varchar(20)
 ) 

create table tblEmp
(empno int primary key, 
 ename varchar(20) not null,
 job varchar(20),
 mgr_id numeric(4),
 hiredate date,
 sal numeric(10),
 comm numeric(5),
 deptno int references tblDept(deptno)
 )

 insert into tblDept values(10,'ACCOUNTING','NEW YORK'), (20,'RESEARCH','DALLAS'), (30,'SALES','CHICAGO'), (40,'OPERATIONS','BOSTON') 

 insert into tblEmp(empno,ename,job,mgr_id,hiredate,sal,deptno) values(7369,'SMITH','CLERK',7902,'1980-12-17',800,20)

 insert into tblEmp values(7499,'ALLEN','SALESMAN',7698,'1981-02-20',1600,300,30), (7521,'WARD','SALESMAN',7698,'1981-02-22',1250,500,30),
 (7654,'MARTIN','SALESMAN',7698,'1981-09-28',1250,1400,30),(7844,'TURNER','SALESMAN','7698','1981-09-08',1500,0,30)

 insert into tblEmp(empno,ename,job,mgr_id,hiredate,sal,deptno) values(7566,'JONES','MANAGER',7839,'1981-04-02',2975,20),
(7698,'BLAKE','MANAGER',7839,'1981-05-01',2850,30),
(7782,'CLARK','MANAGER',7839,'1981-06-09',2450,10),
(7788,'SCOTT','ANALYST',7566,'1987-04-19',3000,20),
(7876,'ADAMS','CLERK',7788,'1987-05-23',1100,20),
(7900,'JAMES','CLERK',7698,'1981-12-03',950,30),
(7902,'FORD','ANALYST',7566,'1981-12-03',3000,20),
(7934,'MILLER','CLERK',7782,'1982-01-23',1300,10)


insert into tblEmp(empno,ename,job,hiredate,sal,deptno) values(7839,'KING','PRESIDENT','1981-11-17',5000,10)

select * from tblemp;
select * from tbldept;


  

--1. Retrieve a list of MANAGERS. 
select * from tblemp where job='Manager'

--2. Find out the names and salaries of all employees earning more than 1000 per month. 
select ename,sal from tblemp where sal>1000

--3. Display the names and salaries of all employees except JAMES. 
select ename, sal from tblemp where ename<>'james'

--4. Find out the details of employees whose names begin with ‘S’. 
select * from tblemp where ename like 's%'

--5. Find out the names of all employees that have ‘A’ anywhere in their name. 
select ename from tblemp where ename like '%A%'

--6. Find out the names of all employees that have ‘L’ as their third character in their name. 
select ename from tblemp where ename like '__L%'

--7. Compute daily salary of JONES. 
select ename, sal/30 as 'Daily Salary' from tblemp where ename='jones'

--8. Calculate the total monthly salary of all employees. 
select sum(sal) as ' Total Monthly Salary' from tblemp

--9. Print the average annual salary . 
select avg(sal*12) from tblemp

--10. Select the name, job, salary, department number of all employees except SALESMAN from department number 30. 
select ename, job, sal, deptno from tblemp where deptno=30 and job<>'salesman'

--11. List unique departments of the EMP table. 
select distinct(deptno) from tblemp

--12. List the name and salary of employees who earn more than 1500 and are in department 10 or 30. Label the columns Employee and Monthly Salary respectively.
select ename as 'Employee' , sal as 'Monthly salary' from tblemp where sal>1500 and deptno=10 or deptno=30

--13. Display the name, job, and salary of all the employees whose job is MANAGER or ANALYST and their salary is not equal to 1000, 3000, or 5000. 
select ename, job, sal from tblemp where job in ('manager','analyst') and sal not in(1000,3000,5000)

--14. Display the name, salary and commission for all employees whose commission amount is greater than their salary increased by 10%. 
select ename, sal, comm from tblemp where comm>(sal+(0.1*sal))

--15. Display the name of all employees who have two Ls in their name and are in department 30 or their manager is 7782. 
select ename from tblemp where ename like '%LL%' and deptno=30 or mgr_id=7782

--16. Display the names of employees with experience of over 10 years and under 20 yrs. Count the total number of employees. 
select count(empno) as 'No of employees' from tblemp where datediff(year, hiredate, getdate()) between 10 and 20

--17. Retrieve the names of departments in ascending order and their employees in descending order. 
select d.dname, e.ename from tbldept d join tblemp e on d.deptno = e.deptno  order by d.dname asc, e.ename desc

--18. Find out experience of MILLER. 
select ename, datediff(year, hiredate, getdate()) as 'Experience' from tblemp where ename='MILLER' 