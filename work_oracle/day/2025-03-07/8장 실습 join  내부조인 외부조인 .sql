--8장 2번 --

SELECT * FROM DEPARTMENT; --PK :DEPTNO
SELECT * FROM STUDENT; --PK : STUDNO
SELECT * FROM PROFESSOR;--PK : PROFNO

SELECT S.NAME "STU_NAME"
     , D.DNAME "DEPT_NAME"
     , P.NAME "PROF_NAME"
  FROM DEPARTMENT D,STUDENT S, PROFESSOR P
 WHERE S.DEPTNO1=D.DEPTNO 
   AND S.PROFNO=P.PROFNO;
   
--ANSI 로 해보자 
SELECT S.NAME "STU_NAME"
     , D.DNAME "DEPT_NAME"
     , P.NAME "PROF_NAME"
  FROM DEPARTMENT D 
  JOIN STUDENT S
    ON S.DEPTNO1=D.DEPTNO 
  JOIN PROFESSOR P
    ON S.PROFNO=P.PROFNO;
-- ,  -> JOIN 이 되었고 WHERE,AND -> ON이 되었다
-----------
--8장 3번 --

SELECT S.NAME "STU_NAME"
     , P.NAME "PROF_NAME"
  FROM STUDENT S , PROFESSOR P
 WHERE DEPTNO1=101
   AND S.PROFNO= P.PROFNO;

--ANSI
SELECT S.NAME "STU_NAME"
     , P.NAME "PROF_NAME"
  FROM STUDENT S JOIN PROFESSOR P
    ON DEPTNO1=101
   AND S.PROFNO= P.PROFNO;

--8장 5번 --

SELECT * FROM STUDENT ST; --STUDNO
SELECT * FROM SCORE SC; -- PK 없다 STUDNO TOTAL
SELECT * FROM HAKJUM H; -- PK 없다 MIN-MAX

SELECT ST.NAME "STU_NAME"
     , SC.TOTAL "SCORE"
     , H. GRADE "CREDIT"
  FROM STUDENT ST ,SCORE SC ,HAKJUM H
 WHERE (ST.STUDNO = SC.STUDNO) 
   AND (SC.TOTAL BETWEEN H.MIN_POINT AND H.MAX_POINT); --비등가
   
---ANSI
SELECT ST.NAME "STU_NAME"
     , SC.TOTAL "SCORE"
     , H. GRADE "CREDIT"
  FROM STUDENT ST 
  JOIN SCORE SC
    ON ST.STUDNO=SC.STUDNO
  JOIN HAKJUM H
    ON SC.TOTAL BETWEEN H.MIN_POINT AND H.MAX_POINT;
----------
--8장 6번 --
SELECT * FROM STUDENT S
ORDER BY S.NAME; 
SELECT * FROM PROFESSOR P;
--------풀아우터조인 FULLOUTER JOIN----
--이건 타짜 정답(서치해서 찾았음 FULL OUTER JOIN > 오라클만 됨)
--SELECT S.NAME "STU_NAME"
--     , P.NAME "PROF_NAME"
--  FROM STUDENT S 
--  FULL OUTER JOIN PROFESSOR P 
--    ON S.PROFNO=P.PROFNO
-- ORDER BY S.NAME;
 
SELECT S.NAME "STU_NAME"
     , P.NAME "PROF_NAME"
  FROM STUDENT S 
  LEFT OUTER JOIN PROFESSOR P 
    ON S.PROFNO=P.PROFNO
UNION
SELECT S.NAME "STU_NAME"
     , P.NAME "PROF_NAME"
  FROM STUDENT S 
  RIGHT OUTER JOIN PROFESSOR P 
    ON S.PROFNO=P.PROFNO;
---------
---8장 7번---
SELECT * FROM EMP;

--SELF JOIN 자기자신을 JOIN 했다 
SELECT E.EMPNO "ENO"
     , E.ENAME "ENAME"
     , MGR.EMPNO "MGRNO"
     , MGR.ENAME "MGR_NAME"
  FROM EMP E, EMP MGR 
 WHERE E.MGR=MGR.EMPNO;
-----------