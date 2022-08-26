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

 insert into tblEmp(empno,ename,job,mgr_id,hiredate,sal,deptno) values(7369,'SMITH','CLERK',7902,'1980-12-17',800,20),

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


insert into tblEmp(empno,ename,job,hiredate,sal,deptno) values(7839,'KING','PRESIDENT','1981-11-17',5000,10),

select * from tblemp;
select * from tbldept;

--1. List all employees whose name begins with 'A'. 
select * from tblemp where ename like 'A%'

--2. Select all those employees who don't have a manager.
select * from tblemp where mgr_id is NULL

--3. List employee name, number and salary for those employees who earn in the range 1200 to 1400. 
select ename, empno, sal from tblemp where sal>1200 and sal<1400

--4. Give all the employees in the RESEARCH department a 10% pay rise. Verify that this has been done by listing all their details before and after the rise. 
update tblEmp set Sal=Sal+(Sal*10/100) where Deptno = (select deptno from tbldept where dname='RESEARCH')

--5. Find the number of CLERKS employed. Give it a descriptive heading. 
select count(empno) as 'Total Clerks' from tblemp where job='clerk'

--6. Find the average salary for each job type and the number of people employed in each job. 
select job, count(empno) as 'No of Employees', avg(sal) as 'Average Salary' from tblemp group by job

--7. List the employees with the lowest and highest salary. 
select min(sal) as 'minimum salary', max(sal) as 'maximum salary' from tblemp

--8. List full details of departments that don't have any employees. 
select t1.deptno, count(t2.deptno) from tbldept t1 left outer join tblemp t2 on t2.deptno=t1.deptno group by t1.deptno having count(t2.deptno) = 0

--9. Get the names and salaries of all the analysts earning more than 1200 who are based in department 20. Sort the answer by ascending order of name. 
select ename,sal from tblemp where job='Analyst' and sal>1200 and deptno=20 order by ename desc

--10. For each department, list its  number together with the total salary paid to employees in that department. 
select deptno, sum(sal) as 'Total Salary' from tblemp group by deptno

--11. Find out salary of both MILLER and SMITH.
select empno, ename, sal from tblemp where ename in ('MILLER','SMITH')

--12. Find out the names of the employees whose name begin with ‘A’ or ‘M’.
select ename from tblemp where ename like '[AM]%'

--13. Compute yearly salary of SMITH. 
select empno, ename,sal as 'monthly salary', (sal*12) as 'Yearly Salary' from tblemp where ename='SMITH'

--14. List the name and salary for all employees whose salary is not in the range of 1500 and 2850. 
select ename, sal from tblemp where sal not between 1500 and 2850

--15
select e.ename, e.empno, m.ename as 'manager', e.mgr_id from tblemp e, tblemp m where e.mgr_id = m.empno 
