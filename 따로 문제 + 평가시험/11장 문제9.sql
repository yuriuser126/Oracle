----------문제풀이------------------------
SELECT * FROM STUDENT;
SELECT * FROM DEPARTMENT;
SELECT * FROM PROFESSOR;
SELECT * FROM EMP2;
SELECT * FROM EMP;
SELECT * FROM DEPT2;
SELECT * FROM DEPT;


----실습문제 A4--UNION ALL사용-----------------
SELECT GRADE  
,NULL DEPTNO1
,COUNT(*) 
,SUM(HEIGHT)  TOTAL_HEIGHT
,SUM(WEIGHT) TOTAL_WEIGHT
FROM STUDENT
GROUP BY GRADE
UNION ALL
SELECT NULL GRADE  
, DEPTNO1
,COUNT(*) 
,SUM(HEIGHT)  TOTAL_HEIGHT
,SUM(WEIGHT) TOTAL_WEIGHT
FROM STUDENT
GROUP BY DEPTNO1;

----실습문제 A4--GROUPING SETS 사용-----------------

SELECT GRADE  
,DEPTNO1
,COUNT(*) 
,SUM(HEIGHT)  TOTAL_HEIGHT
,SUM(WEIGHT) TOTAL_WEIGHT
FROM STUDENT
GROUP BY GROUPING SETS(GRADE,DEPTNO1)
ORDER BY GRADE,DEPTNO1;

----실습문제 A3 간단히 GROPING SETS --------------------
SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY GROUPING SETS(DEPTNO,JOB)
ORDER BY DEPTNO,JOB;
----실습문제 A3---UNION--DEPTNO + JOB 순서 NULL---------------------
SELECT DEPTNO  
,NULL JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL DEPTNO  
, JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY JOB
ORDER BY DEPTNO,JOB;
----실습문제 A2 --CUBE--------------------------
SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY CUBE(DEPTNO,JOB)
ORDER BY DEPTNO;

----실습문제 A2-ROLLUP으로 시도--------------------------
SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY ROLLUP(JOB,DEPTNO,JOB)
UNION 
SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB);

----실습문제 A2----------------------------------

SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO,JOB
UNION ALL
SELECT DEPTNO  
,NULL JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL DEPTNO  
,NULL JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
UNION ALL
SELECT NULL DEPTNO  
, JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY JOB
ORDER BY DEPTNO,JOB;


----실습문제 A-1-오라클에서만 가능-ROLLUP(한번에 통계내줌)-------------------------
SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY ROLLUP(DEPTNO,JOB);

----실습문제 A-1-UNION ALL 세개의 쿼리를 합친다.--------------------------
SELECT DEPTNO  
,JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO,JOB
UNION ALL
SELECT DEPTNO  
,NULL JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
GROUP BY DEPTNO
UNION ALL
SELECT NULL DEPTNO  
,NULL JOB
,ROUND(AVG(SAL) , 1) AVG_SAL
,COUNT(*) CNT_EMP
FROM EMP
ORDER BY DEPTNO,JOB;


---------------3개를 조인하면 될듯.--------------------
SELECT 
        DEPTNO  
        ,JOB
        ,AVG(SAL) OVER(PARTITION BY DEPTNO, JOB ) AVG_SAL
        ,COUNT(JOB) OVER(PARTITION BY DEPTNO, JOB) CNT_EMP
        FROM(SELECT 
                    ROUND(AVG(SAL) OVER(PARTITION BY DEPTNO ),1) AVG_SAL
                    ,COUNT(JOB) OVER(PARTITION BY DEPTNO) CNT_EMP
                    FROM EMP
                    ORDER BY DEPTNO, JOB ) E1 ,
                (SELECT 
                        ROUND(AVG(SAL) OVER( ),1) AVG_SAL
                        ,COUNT(JOB) OVER() CNT_EMP
                        FROM EMP
                        ORDER BY DEPTNO, JOB  ) E2
                 ,EMP E3
        WHERE (E1.DEPTNO =  E2.DEPTNO(+))
            AND (E2.DEPTNO =  E3.DEPTNO(+))
ORDER BY DEPTNO, JOB ;

-------------------------------------
SELECT 
AVG(SAL) OVER(PARTITION BY DEPTNO,JOB ) AVG_SAL
,COUNT(JOB) OVER(PARTITION BY DEPTNO,JOB) CNT_EMP
FROM EMP
ORDER BY DEPTNO, JOB  ;

--------------------------------------
SELECT 
ROUND(AVG(SAL) OVER(PARTITION BY DEPTNO ),1) AVG_SAL
,COUNT(JOB) OVER(PARTITION BY DEPTNO) CNT_EMP
FROM EMP
ORDER BY DEPTNO, JOB  ;
---------------------------------------
SELECT 
AVG(SAL) OVER( ) AVG_SAL
,COUNT(JOB) OVER() CNT_EMP
FROM EMP
ORDER BY DEPTNO, JOB  ;

------기본--------------------------------------------------
SELECT  DEPTNO 
,JOB
,SAL
FROM EMP
ORDER BY DEPTNO;

--부서 직급이 1,2 그다음 급여 3

-----11장 11-혼자--------------------------------------------------
--문제 잘 읽기
SELECT NAME
,POSITION
,TO_CHAR(PAY,'$999,999,999') SALARY
FROM EMP2
WHERE (POSITION , PAY) IN  (SELECT POSITION
                                                , MAX(PAY)
                                                FROM EMP2
                                                GROUP BY POSITION)
ORDER BY 3;

-----11장 10-강사님-------------------------------------------------
 SELECT P.PROFNO
 ,P.NAME PROF_NAME
 ,TO_CHAR(P.HIREDATE,'YYYY-MM-DD') HIREDATE
 ,D.DNAME DEPT_NAME
 FROM PROFESSOR P, DEPARTMENT D
 WHERE P.DEPTNO = D.DEPTNO
 AND (P.DEPTNO , P.HIREDATE) IN (SELECT DEPTNO
                                                         ,MIN(HIREDATE)
                                                         FROM PROFESSOR
                                                         GROUP BY DEPTNO)
  ORDER BY 3;

-----11장 10-혼자--------------------------------------------------
 SELECT P.PROFNO
 ,P.NAME PROF_NAME
 ,P.HIREDATE
 ,D.DNAME DEPT_NAME
 FROM PROFESSOR P, DEPARTMENT D
 WHERE P.DEPTNO = D.DEPTNO
 AND P.PROFNO  > (SELECT PROFNO
 ,MAX(HIREDATE)
 FROM PROFESSOR
 GROUP BY PROFNO)
 ORDER BY PROFNO
; 
---------------IN만 가능한가 부등호..-------------------------------
-----------------------이건 왜 안돠ㅣ죠-------------------?--------
 SELECT P.PROFNO
 ,P.NAME PROF_NAME
 ,TO_CHAR(P.HIREDATE,'YYYY-MM-DD') HIREDATE
 ,D.DNAME DEPT_NAME
 FROM PROFESSOR P, DEPARTMENT D
 WHERE P.DEPTNO = D.DEPTNO
 AND (P.PROFNO , P.HIREDATE) IN (SELECT PROFNO
                                                     ,MAX(HIREDATE)
                                                     FROM PROFESSOR
                                                     GROUP BY PROFNO)
 ORDER BY 1
; 


SELECT DEPTNO
,MAX(HIREDATE)
 FROM PROFESSOR
 GROUP BY DEPTNO
 ORDER BY DEPTNO;
 
-----11장 9-강사님-------------------------------------------------
--어렵게 생각하지말자 너무 돌아간다 --
SELECT GRADE
,NAME
,WEIGHT
FROM STUDENT 
WHERE (GRADE, WEIGHT) IN (SELECT GRADE
                                                ,MAX(WEIGHT)
                                                FROM STUDENT
                                                GROUP BY GRADE
                                                )
ORDER BY 1 ;
-----11장 9-혼자--------------------------------------------------
SELECT S1.GRADE
,S1.NAME
,S2.WEIGHT
FROM STUDENT S1, STUDENT S2 
WHERE S1.WEIGHT = (SELECT MAX(WEIGHT)
                        FROM STUDENT
                        GROUP BY GRADE
                        ORDER BY GRADE) ;
                        
                        
SELECT GRADE
,NAME
,MAX_WEIGHT
FROM STUDENT  
WHERE  (SELECT MAX(WEIGHT) MAX_WEIGHT
                            ,GRADE
                        FROM STUDENT
                        GROUP BY GRADE
                        ORDER BY GRADE) ;      
               
                        
SELECT NAME
FROM STUDENT;
--UNION ALL
SELECT MAX(WEIGHT)
            ,GRADE
            FROM STUDENT
            GROUP BY GRADE
            ORDER BY GRADE;


-----11장 8-강사님--JOIN------------------------------------------------
SELECT D.DNAME
,E.NAME
,TO_CHAR(E.PAY, '$999,999,999') "SALARY"
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO=D.DCODE 
AND E.PAY < (SELECT MIN(AVG(PAY))
                        FROM EMP2
                        GROUP BY DEPTNO)
ORDER BY 3;

-----11장 8-혼자--------------------------------------------------

SELECT D.DNAME
,E.NAME
,E.PAY*12 SALARY
,AVG(E.PAY) OVER(PARTITION BY D.DNAME ) SALARY
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO=D.DCODE 
AND AVG(E.PAY) < (SELECT E.NAME
FROM EMP2 E, DEPT2 D
WHERE AVG(E.PAY) = MIN((AVG (E.PAY) OVER(PARTITION BY D.DNAME ))))
;

SELECT DEPTNO
,NAME
,PAY
,AVG(PAY) OVER(PARTITION BY DEPTNO )
FROM EMP2;

----------11장 7-ALL 사용가능 ANY 불가-----------------------------------------------
SELECT NAME
,GRADE
,WEIGHT
FROM STUDENT
WHERE WEIGHT < ALL (SELECT WEIGHT
                                    FROM STUDENT
                                    WHERE GRADE = 2 )
ORDER BY 3 DESC  ;

-----11장 7-혼자--------------------------------------------------
SELECT NAME
,GRADE
,WEIGHT
FROM STUDENT
WHERE WEIGHT < (SELECT MIN(WEIGHT)
                                    FROM STUDENT
                                    WHERE GRADE = 2 )
ORDER BY 3 DESC  ;
                                    
  --ANY 사용은 안된다-------------------------------                                  
SELECT MIN(WEIGHT)
FROM STUDENT
WHERE GRADE IN (2) ;
---51

SELECT MIN(WEIGHT)
FROM STUDENT
WHERE GRADE = 2;
-----51

--------11장 6 다른 방법--ANY 사용 또다른 PAY 지칭-------------------------------------
SELECT NAME
,POSITION
,TO_CHAR(PAY, '$999,999,999') "SALARY"
FROM EMP2
WHERE PAY > ANY (SELECT PAY
                        FROM EMP2
                         WHERE POSITION= 'Section head')
ORDER BY 3 DESC;

--------11장 6-혼자---------------------------------------
SELECT * FROM EMP2;

SELECT NAME
,POSITION
,TO_CHAR(PAY, '$999,999,999') "SALARY"
FROM EMP2
WHERE PAY > (SELECT MIN(PAY)
                        FROM EMP2
                         WHERE POSITION= 'Section head')
ORDER BY 3 DESC;


SELECT MIN(PAY)
FROM EMP2
 WHERE POSITION= 'Section head';
 --49000000

--------11장 5----------------------------------------

SELECT * FROM EMP2;
SELECT * FROM DEPT2;

SELECT EMPNO
,NAME
,DEPTNO
FROM EMP2 
WHERE  DEPTNO IN (SELECT DCODE
                                FROM DEPT2
                                WHERE AREA = 'Pohang Main Office');
                                -- = 사용이 아니라 IN 사용 !!!!!!!!!!!
                                
SELECT DCODE
                                FROM DEPT2
                                WHERE AREA = 'Pohang Main Office';                                


-----------11장 4-------------------------------
SELECT NAME
,WEIGHT
FROM STUDENT 
WHERE WEIGHT > (SELECT AVG(WEIGHT)
                                    FROM STUDENT
                                    WHERE DEPTNO1= 201);
                                    
SELECT AVG(WEIGHT)
                                    FROM STUDENT
                                    WHERE DEPTNO1= 201;
                                    --67KG

-----------11장 3-------------------------------
SELECT P.NAME "PROF_NAME"
,TO_CHAR (P.HIREDATE, 'YYYY-MM-DD') "HIREDATE"
,D.DNAME "DEPT_NAME"
FROM PROFESSOR P, DEPARTMENT D
WHERE P.DEPTNO = D.DEPTNO
AND P.HIREDATE > (SELECT HIREDATE
                                    FROM PROFESSOR
                                    WHERE NAME = 'Meg Ryan');

-----------11장 2-강사님-------------------------------
SELECT S.NAME "STUD_NAME"
           , D.DNAME "DEPT_NAME"
FROM STUDENT S, DEPARTMENT D
WHERE S.DEPTNO1 = D.DEPTNO
AND S.DEPTNO1 = (SELECT DEPTNO1 
                            FROM STUDENT
                            WHERE NAME = 'Anthony Hopkins');
                            
                            
SELECT DEPTNO1 
                            FROM STUDENT
                            WHERE NAME = 'Anthony Hopkins';
                            --103번

-----------11장 2--------------------------------
SELECT S.NAME STUD_NAME
            , (SELECT DNAME
                FROM DEPARTMENT D
                WHERE S.DEPTNO1 = D.DEPTNO ) "DNAME"
FROM STUDENT S
WHERE S.NAME ='Anthony Hopkins';

