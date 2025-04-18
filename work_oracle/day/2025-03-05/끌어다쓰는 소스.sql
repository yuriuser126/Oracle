---끌어다 쓸거
SELECT * FROM professor;
SELECT * FROM EMP;
SELECT * FROM STUDENT;
SELECT * FROM FRUIT;

ROLLBACK;
COMMIT;

------------

--컬럼명 변경
ALTER TABLE DEPT6
RENAME COLUMN LOCATION2 TO LOC;

-------------------------------
--데이터를 골라서 복사가 가능하다
CREATE TABLE DEPT6
AS
SELECT DCODE, DNAME  FROM DEPT2
WHERE DCODE IN(1000,1001,1002) ;
---------------------------------------------

UPDATE PROFESSOR
  SET BONUS = 200
WHERE POSITION = 'assistant professor';



---------------------------------------
CREATE TABLE new_emp100
( NO NUMBER(5) DEFAULT 'NUMBER(5)'
,NAME VARCHAR2(20) 
,HIREDATE DATE 
,BONUS 
);

---------------------------------------------
SELECT EMPNO
,ENAME
,SAL
, CASE                                WHEN  SAL BETWEEN 1 AND 1000 THEN 'LEVEL 1'
                                         WHEN  SAL BETWEEN 1001 AND 2000 THEN 'LEVEL 2'
                                         WHEN  SAL BETWEEN '2001' AND '3000' THEN 'LEVEL 3'
                                         WHEN  SAL BETWEEN '3001' AND '4000' THEN 'LEVEL 4'
                                         WHEN  SAL > '4000' THEN 'LEVEL 5'
                                         
                                                                                                         END "LEVEL" 
FROM EMP
ORDER BY SAL DESC;

------------------------------------------

   SELECT ENAME
           , DEPTNO
           , initcap(ename) 
           , LOWER(ename) 
           , UPPER(ename) 
           , LENGTH(ename) 
           , LENGTHB(ename) 
   FROM EMP;

--------------------------------------
SELECT NAME 
,TEL
, SUBSTR (TEL,1, INSTR (TEL,')')-1)"AREACODE"
FROM STUDENT
WHERE deptno1 = 201;

----------------------------------------------------

SELECT NAME
,ID
--M으로 시작하고 다음에 a나o가 옴
FROM STUDENT
WHERE REGEXP_LIKE(ID,'M(a|o)') ;

----------------------------------------------------
SELECT P_DATE
,P_CODE
,P_QTY
,P_TOTAL
,SUM(P_TOTAL) OVER (ORDER BY P_TOTAL ) "TOTAL"

FROM PANMAE
WHERE P_STORE = '1000' ;


---------------------------------------------------
SELECT CASE   WHEN '2' = '1' THEN 'A' 
--                            WHEN '3' = '1' THEN 'B' 
--                            WHEN '1' = '1' THEN 'B' 
                            ELSE 'ETC'
                            END "TEST";
                            
-----------------------------------------------------                         
SELECT SUM(PAY) SUM
--,COUNT (PAY) 
,AVG(PAY) A
,AVG(NVL(PAY,0)) A
,MAX(PAY) X
,MIN(PAY) N
,ROUND(STDDEV(PAY),2) S 
,ROUND(VARIANCE(PAY),2) S

FROM PROFESSOR;