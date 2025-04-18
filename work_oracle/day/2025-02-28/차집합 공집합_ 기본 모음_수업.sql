SELECT STUDNO
           ,  NAME 
   FROM STUDENT 
 WHERE deptno1 = 101
INTERSECT--중복되는 JAMES SEO 나옴 교집합
--MINUS --차집합 
SELECT STUDNO
           ,  NAME 
   FROM STUDENT 
 WHERE deptno2 = 201;
 



SELECT STUDNO
           ,  NAME 
   FROM  STUDENT 
 WHERE deptno1 = 101
UNION --5 9411~9711 오름차순됨
--UNION ALL --6(JAMES SEO 중복) 정렬X9411~9711,9411,9512
--UNION ALL
SELECT STUDNO
           ,  NAME 
   FROM STUDENT 
 WHERE deptno2 = 201;
 

--4
SELECT STUDNO
           ,  NAME 
   FROM STUDENT 
 WHERE deptno1 = 101;
 
--2
SELECT STUDNO
           ,  NAME 
   FROM STUDENT 
 WHERE deptno2 = 201;

SELECT STUDNO, NAME FROM STUDENT WHERE deptno1 = 101;

SELECT * FROM STUDENT;

     SELECT NAME
           ,  GRADE 
           , HEIGHT
   FROM  STUDENT 
   WHERE HEIGHT >= 165
    AND HEIGHT <= 175;


SELECT STUDNO, NAME 
   FROM STUDENT 
 WHERE deptno1 = 101;

SELECT STUDNO
           ,  NAME 
   FROM STUDENT 
 WHERE deptno1 = 101;


SELECT * FROM STUDENT;
