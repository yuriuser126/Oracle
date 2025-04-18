 SELECT NAME , GRADE, HEIGHT FROM  STUDENT WHERE HEIGHT >= 170 ORDER BY HEIGHT DESC ;
 
 SELECT NAME
           ,  GRADE 
           , HEIGHT
   FROM STUDENT 
 WHERE HEIGHT >= 170
 ORDER BY HEIGHT DESC;
 
 
SELECT STUDNO
           ,  NAME 
           ,GRADE
   FROM  STUDENT 
 WHERE GRADE >= 3 
     AND deptno1 = 101;
     
SELECT NAME
           ,  GRADE 
           , HEIGHT
   FROM  STUDENT 
   WHERE HEIGHT
 BETWEEN 165 
     AND 175;
     
     SELECT NAME
           ,  GRADE 
           , HEIGHT
   FROM  STUDENT 
   WHERE HEIGHT >= 165
    AND HEIGHT <= 175;

SELECT NAME
           ,  ID 
           ,DEPTNO1
   FROM  STUDENT 
 WHERE NAME LIKE 'Bi%' ;
 
 
  
SELECT STUDNO
           ,  NAME 
           ,GRADE
   FROM  STUDENT 
 WHERE GRADE >= 3 
     AND deptno1 = 101;    
     
     
     
     
SELECT STUDNO
   FROM STUDENT 
 WHERE deptno1 = 101
 MINUS
 SELECT profno
   FROM STUDENT 
 WHERE deptno1 = 101;
 
 
 SELECT DEPTNO
   FROM PROFESSOR 
   INTERSECT--중복
    SELECT DEPTNO
   FROM DEPARTMENT 
   MINUS--차집합 학생쪽
   SELECT DEPTNO1
   FROM STUDENT;
   
--       SELECT DEPTNO
--   FROM DEPARTMENT ;
   
--보너스 커미션 보너스 받지않는 교수 학번
    SELECT NAME
                , PAY
                ,DEPTNO
   FROM PROFESSOR 
   WHERE BONUS IS NULL;
   
       SELECT PROFNO
                ,NAME
                , PAY
                ,DEPTNO
   FROM PROFESSOR 
   WHERE BONUS IS NULL
   ORDER BY BONUS;
   
       SELECT PROFNO
                ,NAME
                , PAY
                ,PAY*12
                ,DEPTNO
   FROM PROFESSOR 
   WHERE BONUS IS NULL
   ORDER BY DEPTNO DESC , ( PAY*12) ASC;
   --PAY*12 만 해도됨
   
SELECT 
                 PAY
                ,BONUS
   FROM PROFESSOR 
   WHERE  PAY > = 300 AND  BONUS IS NOT NULL OR  PAY >= 450;
   
   
    --   WHERE DEPTNO IN(10,201)
 SELECT PROFNO --교수번호
            , NAME
   FROM PROFESSOR 
      WHERE deptno =201
   UNION--중복
SELECT studNO
            , NAME
    FROM STUDENT
  WHERE deptno1 = 201;     
   
 
   
   
   
   
 
   
   

     
    
 