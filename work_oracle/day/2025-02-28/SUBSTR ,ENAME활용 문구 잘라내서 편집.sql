

SELECT ENAME
           , DEPTNO
           , initcap(ename) 
           , LOWER(ename) 
           , UPPER(ename) 
   FROM EMP;
   
   SELECT ENAME
           , DEPTNO
           , initcap(ename) 
           , LOWER(ename) 
           , UPPER(ename) 
           , LENGTH(ename) 
           , LENGTHB(ename) 
   FROM EMP;
   

   
SELECT ENAME
           , JOB
           , CONCAT(ENAME,JOB)
   FROM EMP;
   
   
   SELECT ENAME
           , JOB
           , SUBSTR (JOB,3,2)
           , SUBSTR (JOB,6,2)
           , SUBSTR (JOB,4)
           , SUBSTR (JOB,-3,2)
           , SUBSTR (JOB,-5,3)
           , SUBSTR (JOB,0)
   FROM EMP;


--CTRL SHIFT D 한줄복사
DESC EMP;
DESC EMP;


SELECT * FROM emp;

SELECT * FROM TAB;

SELECT ENAME,JOB,DEPTNO FROM EMP;
SELECT DISTINCT DEPTNO FROM EMP;

SELECT EMPNO, ENAME , JOB, DEPTNO "부서번호" FROM EMP;

SELECT EMPNO "사원", ENAME "사원명" ,JOB "직업" ,DEPTNO "부서번호" FROM EMP;

SELECT ENAME ||'직업은 '|| JOB||'이고, 부서번호는'||  DEPTNO ||'이다.' FROM EMP;


SELECT ENAME,  JOB, SAL, SAL*12 FROM EMP;






