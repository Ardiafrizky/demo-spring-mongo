--Drop table EMPLOYEE
DROP TABLE EMPLOYEE;

--Drop table DEPARTMENT
DROP TABLE DEPARTMENT;


--Create table DEPARTMENT
CREATE TABLE DEPARTMENT(  
deptno     integer,  
dname      varchar(255),  
loc        varchar(255),  
constraint pk_department primary key (deptno));

--Create table EMPLOYEE
CREATE TABLE EMPLOYEE(  
empno    integer,  
ename    varchar(255),  
job      varchar(255),  
mgr      integer,  
hiredate date,  
sal      integer,  
comm     integer,  
deptno   integer,
constraint pk_employee primary key (empno),  
constraint fk_deptno foreign key (deptno) references department (deptno));

--Show table EMPLOYEE
SELECT COLUMN_NAME, DATA_TYPE, character_maximum_length  FROM information_schema.COLUMNS WHERE TABLE_NAME = 'employee';
--Show table DEPARTMENT
SELECT COLUMN_NAME, DATA_TYPE, character_maximum_length FROM information_schema.COLUMNS WHERE TABLE_NAME = 'department';
--Show index
SELECT tablename, indexname, indexdef FROM pg_indexes WHERE schemaname = 'public' ORDER BY tablename, indexname;

--Alter table EMPLOYEE
ALTER TABLE EMPLOYEE ADD id varchar(255);
ALTER TABLE EMPLOYEE ADD store_id varchar(255);
ALTER TABLE EMPLOYEE ADD created_by varchar(255);
ALTER TABLE EMPLOYEE ADD created_date date;
ALTER TABLE EMPLOYEE ADD updated_by varchar(255);
ALTER TABLE EMPLOYEE ADD updated_date date;
ALTER TABLE EMPLOYEE ADD mark_for_delete varchar(255);
ALTER TABLE EMPLOYEE ADD optlock integer;

--Alter table DEPARTMENT
ALTER TABLE DEPARTMENT ADD id varchar(255);
ALTER TABLE DEPARTMENT ADD store_id varchar(255);
ALTER TABLE DEPARTMENT ADD created_by varchar(255);
ALTER TABLE DEPARTMENT ADD created_date date;
ALTER TABLE DEPARTMENT ADD updated_by varchar(255);
ALTER TABLE DEPARTMENT ADD updated_date date;
ALTER TABLE DEPARTMENT ADD mark_for_delete varchar(255);
ALTER TABLE DEPARTMENT ADD optlock integer;

--Create Index and Drop Index
CREATE INDEX CONCURRENTLY employee_empno_idx ON employee USING btree (empno, mark_for_delete);
CREATE INDEX CONCURRENTLY department_deptno_idx ON department USING btree (deptno, mark_for_delete);
SELECT tablename, indexname, indexdef FROM pg_indexes WHERE schemaname = 'public' ORDER BY tablename, indexname;
drop index CONCURRENTLY employee_empno_idx;
drop index CONCURRENTLY department_deptno_idx;

 
--INSERT data DEPARTMENT
INSERT into DEPARTMENT (ID, DEPTNO, DNAME, LOC, STORE_ID, CREATED_BY, CREATED_DATE, UPDATED_BY, MARK_FOR_DELETE, UPDATED_DATE) values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 10, 'ACCOUNTING', 'NEW YORK','10001', 'System', now(),'System', false, now());
INSERT into DEPARTMENT (ID, DEPTNO, DNAME, LOC, STORE_ID, CREATED_BY, CREATED_DATE, UPDATED_BY, MARK_FOR_DELETE, UPDATED_DATE) values (uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 20, 'RESEARCH', 'DALLAS','10001',  'System', now(),'System', false, now());
INSERT into DEPARTMENT (ID, DEPTNO, DNAME, LOC, STORE_ID, CREATED_BY, CREATED_DATE, UPDATED_BY, MARK_FOR_DELETE, UPDATED_DATE) values(uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 30, 'SALES', 'CHICAGO','10001',  'System', now(),'System', false, now());
INSERT into DEPARTMENT  (ID, DEPTNO, DNAME, LOC, STORE_ID, CREATED_BY, CREATED_DATE, UPDATED_BY, MARK_FOR_DELETE, UPDATED_DATE) values(uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 40, 'OPERATIONS', '10001', 'BOSTON', 'System', now(),'System', false, now());

--Update data DEPARTMENT
UPDATE DEPARTMENT SET OPTLOCK = 0;

select * from department;
update department set dname = 'ACCOUNTING Test Update' where dname = 'ACCOUNTING';

BEGIN;
update department set dname = 'ACCOUNTING' where dname = 'ACCOUNTING Test Update';
ROLLBACK;

--INSERT data EMPLOYEE
INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE )
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7839, 'KING', 'PRESIDENT', null,to_date('17-11-1981','dd-mm-yyyy'), 
5000, null,  10,'10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7698, 'BLAKE', 'MANAGER', 7839,to_date('1-5-1981','dd-mm-yyyy'),  
2850, null, 30  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7782, 'CLARK', 'MANAGER', 7839, to_date('9-6-1981','dd-mm-yyyy'),  
2450, null, 10  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7566, 'JONES', 'MANAGER', 7839, to_date('2-4-1981','dd-mm-yyyy'),  
2975, null, 20  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7788, 'SCOTT', 'ANALYST', 7566,to_date('13-07-1987','dd-mm-yyyy') - 85,  
3000, null, 20  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7902, 'FORD', 'ANALYST', 7566, to_date('3-12-1981','dd-mm-yyyy'),  
3000, null, 20  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7369, 'SMITH', 'CLERK', 7902, to_date('17-12-1980','dd-mm-yyyy'), 
800, null, 20  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7499, 'ALLEN', 'SALESMAN', 7698, to_date('20-2-1981','dd-mm-yyyy'),  
1600, 300, 30  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7521, 'WARD', 'SALESMAN', 7698, to_date('22-2-1981','dd-mm-yyyy'),  
1250, 500, 30  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring),  7654, 'MARTIN', 'SALESMAN', 7698, to_date('28-9-1981','dd-mm-yyyy'),  
1250, 1400, 30  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 844, 'TURNER', 'SALESMAN', 7698, to_date('8-9-1981','dd-mm-yyyy'),  
1500, 0, 30  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7876, 'ADAMS', 'CLERK', 7788, to_date('13-07-1987', 'dd-mm-yyyy') - 51,  
1100, null, 20  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7900, 'JAMES', 'CLERK', 7698, to_date('3-12-1981','dd-mm-yyyy'),  
950, null, 30  , '10001', 'System', now(),'System',  now(), false);

INSERT into EMPLOYEE ( ID, empno, ename, job, mgr, hiredate, sal, comm, deptno, store_id, CREATED_BY, CREATED_DATE, UPDATED_BY, UPDATED_DATE, MARK_FOR_DELETE)
values( uuid_in(md5(random()::text || clock_timestamp()::text)::cstring), 7934, 'MILLER', 'CLERK', 7782, to_date('23-1-1982','dd-mm-yyyy'),  
1300, null, 10  , '10001', 'System', now(),'System',  now(), false);
 
--Update data EMPLOYEE
UPDATE EMPLOYEE SET OPTLOCK = 0;

select * from EMPLOYEE;
select * from DEPARTMENT;
select count(1) from EMPLOYEE;

--Select join EMPLOYEE & DEPARTMENT 
select empno, ename, job, to_char(hiredate, 'yyyy-mm-dd'), mgr, sal, comm, d.deptno, dname, loc  
from employee e, department d
where e.deptno = d.deptno  
order by ename;

-- JOIN
select empno, ename, job, to_char(hiredate, 'yyyy-mm-dd'), mgr, sal, comm, d.deptno, dname, loc  
from employee e join department d on e.deptno = d.deptno
order by ename;

--RIGHT JOIN
select empno, ename, job, to_char(hiredate, 'yyyy-mm-dd'), mgr, sal, comm, d.deptno, dname, loc  
from employee e RIGHT JOIN department d on e.deptno = d.deptno
order by ename;

--Select GROUP BY
select dname, count(*) count_of_employees
from employee e, department d
where e.deptno = d.deptno
group by DNAME
order by dname asc;

--RIGHT JOIN
select dname, count(*) count_of_employees
from employee e right join department d on e.deptno = d.deptno
group by DNAME
order by dname asc;

--Expalin Query
select * from employee where eName = 'ALLEN';
EXPLAIN ANALYZE select * from employee where eName = 'ALLEN';

SELECT tablename, indexname, indexdef FROM pg_indexes WHERE schemaname = 'public' ORDER BY tablename, indexname;

CREATE INDEX CONCURRENTLY employee_ename_idx ON employee USING btree (ename);
drop index CONCURRENTLY employee_ename_idx;