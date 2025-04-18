----------------9장 실습문제 풀이----------------------------
SELECT * FROM EMP;
SELECT * FROM DEPT;
SELECT * FROM DEPARTMENT; --DEPTNO
SELECT * FROM PROFESSOR; --PROFNO
SELECT * FROM STUDENT;-- STUDNO

--------------9장-------------------------

select empno, ename, job,mgr,hiredate,sal,comm,deptno from emp;



--------------9장7 강사님-------------------------
SELECT  ROWNUM "Ranking"
,NAME
,PAY
FROM (SELECT PAY
FROM PROFESSOR 
ORDER BY 2 DESC) 
WHERE ROWNUM BETWEEN 1 AND 5
;

-----------------
SELECT  ROWNUM "Ranking"
, PAY
FROM PROFESSOR;
--ROW NUM ???


--------------9장7-------------------------
SELECT * FROM PROFESSOR;

SELECT  P.Ranking
,P2.NAME
,P2.PAY
FROM (SELECT PAY
,RANK () OVER(ORDER BY PAY DESC) Ranking
FROM PROFESSOR 
GROUP BY PAY) P , PROFESSOR P2
WHERE P.NAME = P2.NAME
AND P2.Ranking <= 5
;

SELECT PAY
,RANK() OVER(ORDER BY PAY DESC) Ranking
FROM PROFESSOR ;


--------------9장6 -강사님--------------------------


SELECT S.GRADE
        ,S.NAME
        ,S.HEIGHT
        ,A.AVG_HEIGHT
                    FROM(SELECT GRADE
                        ,AVG(HEIGHT) AVG_HEIGHT
                     FROM STUDENT
                GROUP BY GRADE
                ) A, STUDENT S
WHERE S.GRADE=A.GRADE
AND S.HEIGHT > A.AVG_HEIGHT;

SELECT GRADE
            ,AVG(HEIGHT) AVG_HEIGHT
         FROM STUDENT
    GROUP BY GRADE;

--------------9장6 ---------------------------
SELECT S2.GRADE
    ,S2.NAME
    ,S2.HEIGHT
    ,AVG(S2.HEIGHT)
            FROM(
            SELECT GRADE
            ,NAME
            ,HEIGHT
            FROM STUDENT
             ORDER BY GRADE) S , STUDENT S2
    WHERE S.GRADE = S2.GRADE
ORDER BY GRADE;


--------------9장5 강사님 ---------------------------


SELECT D.DNAME
        ,A.MAX_HEIGHT
        ,S.NAME
        ,S.HEIGHT
                    FROM(SELECT DEPTNO1
                        ,MAX(HEIGHT) MAX_HEIGHT
                     FROM STUDENT
                GROUP BY DEPTNO1
                ) A, STUDENT S,DEPARTMENT D
WHERE S.DEPTNO1=A.DEPTNO1
 AND S.HEIGHT = A.MAX_HEIGHT
AND S.DEPTNO1= D.DEPTNO;



SELECT DEPTNO1
,MAX(HEIGHT) MAX_HEIGHT
FROM STUDENT
GROUP BY DEPTNO1;


--------------9장5 ---------------------------
SELECT * FROM DEPARTMENT;
SELECT * FROM STUDENT;

SELECT D.DNAME
,S.MAX_HEIGHT
FROM
 (SELECT DEPTNO1
                ,NAME N
                ,MAX(HEIGHT) MAX_HEIGHT
                FROM STUDENT
        GROUP BY DEPTNO1,NAME) S, DEPARTMENT D
        WHERE S.DEPTNO1=D.DEPTNO
        GROUP BY D.DNAME
        ORDER BY S.MAX_HEIGHT DESC;


SELECT DEPTNO1 
                ,HEIGHT
                ,MAX(HEIGHT) MAX_HEIGHT
                ,NAME
                FROM STUDENT
        GROUP BY DEPTNO1,NAME,HEIGHT
        ORDER BY MAX(HEIGHT) ;

--------------9장4 강사님 ---------------------------
SELECT D.DNAME
            ,S.MAX_HEIGHT
            ,S.MAX_WEIGHT
        FROM(SELECT DEPTNO1
                ,MAX(HEIGHT) MAX_HEIGHT
                ,MAX(WEIGHT) MAX_WEIGHT
                FROM STUDENT
        GROUP BY DEPTNO1
        ) S , DEPARTMENT D
    WHERE S.DEPTNO1=D.DEPTNO ;

--------------9장4 ---------------------------
SELECT D.DNAME
        ,ST.HEIGHT
        ,ST.WEIGHT
        FROM(SELECT MAX(HEIGHT) HEIGHT
                ,MAX(WEIGHT) WEIGHT
            FROM  STUDENT) ST , DEPARTMENT D
    WHERE ST.DEPTNO1=D.DEPTNO 
    GROUP BY D.DNAME;
    
    -------------섞어쓰기----
    SELECT MAX(HEIGHT) HEIGHT
                ,MAX(WEIGHT) WEIGHT
            FROM  STUDENT
             GROUP BY DEPTNO1;
             
    SELECT DNAME FROM DEPARTMENT;

---------------9장3 강사님-----------------------------
CREATE OR REPLACE VIEW V_PROF_DEPT
AS
SELECT P.PROFNO "교수번호"
,P.NAME "교수명"
,D.DNAME "소속학과명"
FROM PROFESSOR P, DEPARTMENT D
WHERE D.DEPTNO = P.DEPTNO;

--WHERE D.DEPTNO = P.DEPTNO;
-- P.DEPTNO; 요거 틀렸다..교수명에도 DEPTNO 있다아

--------------9장3 ---------------------------
SELECT * FROM V_PROF_DEPT;

CREATE OR REPLACE VIEW V_PROF_DEPT
AS
SELECT P.PROFNO
,P.NAME
,D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE D.DEPTNO = P.PROFNO;

--------------WHERE D.DNAME할까싶음---------------------------
SELECT P.PROFNO
,P.NAME
,D.DNAME
FROM PROFESSOR P, DEPARTMENT D
WHERE D.DEPTNO = P.PROFNO;

--------------9장2 강사님---------------------
SELECT DECODE(DEPTNO, NDEPTNO, NULL, DEPTNO) DEPTNO
             , PROFNO
             ,NAME
        FROM( SELECT LAG(DEPTNO) OVER(ORDER BY DEPTNO)  NDEPTNO
                     ,DEPTNO
                      ,PROFNO
                      ,NAME
              FROM PROFESSOR
    );
----------------------------------------------
SELECT LAG(DEPTNO) OVER(ORDER BY DEPTNO) NDEPTNO
,DEPTNO
,NAME
FROM PROFESSOR;

----------9장2----------------------------------
SELECT DEPTNO2
,NAME
FROM STUDENT
ORDER BY DEPTNO2 ;
--------학과번호 중복---9장 2----------------------
SELECT ST.DEPTNO2
,D.PROFNO
,D.NAME
FROM( SELECT DEPTNO
,PROFNO
,NAME
FROM PROFESSOR
) D , STUDENT ST
WHERE (D.DEPTNO =  ST.DEPTNO2(+))
GROUP BY ST.DEPTNO2,D.PROFNO,D.NAME;




-----INLINE VIEW 인라인 뷰-------------------------
---------쿼리결과를 테이블형태로 받음---------------
SELECT E.DEPTNO
            ,D.DNAME
            ,E.SAL
FROM( SELECT DEPTNO
            ,MAX(SAL) SAL
            FROM  EMP E
            GROUP BY DEPTNO
            ) E , DEPT D
            WHERE E.DEPTNO = D.DEPTNO;
            
            ---비교 -- 결과값이랑 인라인 조인한거
SELECT *          
FROM( SELECT DEPTNO
            ,MAX(SAL) SAL
            FROM  EMP E
            GROUP BY DEPTNO
            );
---------------------------------------
SELECT D.DEPTNO
,D.DNAME
,E.SAL
FROM DEPT D, EMP E
WHERE D.DEPTNO = E.DEPTNO
GROUP BY D.DEPTNO, D.DNAME, E.SAL
ORDER BY SAL DESC;
