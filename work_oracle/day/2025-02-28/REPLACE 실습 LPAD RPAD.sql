SELECT NAME
            , SUBSTR (JUMIN,3,4)
--            , SUBSTR (JUMIN,7,2)
FROM STUDENT
WHERE deptno1 = 101;
            
SELECT * FROM STUDENT;

SELECT NAME 
,TEL
, INSTR (TEL,')')
FROM STUDENT
WHERE deptno1 = 201;


SELECT TEL 
, INSTR (TEL,'8',1,2)
FROM STUDENT
WHERE deptno1 = 101;


SELECT NAME 
,TEL
, SUBSTR (TEL,1, INSTR (TEL,')')-1)"AREACODE"
FROM STUDENT
WHERE deptno1 = 201;


SELECT LPAD (ENAME,9,'123456789') "LPAD"
           
   FROM EMP
   WHERE DEPTNO = 10;
   
   
   SELECT RPAD (ENAME,9,RPAD('123456789',9,2 )) "RPAD"  
   FROM EMP
   WHERE DEPTNO = 10; 
   
   
   SELECT RPAD (ENAME,9,SUBSTR('123456789',LENGTH(ENAME)+1)) "RPAD"  
 ,SUBSTR('123456789',LENGTH(ENAME)+1)
  ,SUBSTR('123456789',LENGTH(ENAME))
  --SUBSTR 문자 위치부터 출력
   FROM EMP
   WHERE DEPTNO = 10;
   
   SELECT ENAME
   --SUBSTR : 범위 지정
        ,REPLACE (ENAME,SUBSTR(ENAME,2,2),'--') "REPLACE"
   FROM EMP
   WHERE DEPTNO = 20;
   
   SELECT NAME 
   ,jumin
,REPLACE (jumin,SUBSTR(jumin,7,7),'-/-/-/-') "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;


   SELECT NAME 
   ,jumin
   --*2는 왜 안되는가>?
,REPLACE (jumin,SUBSTR(jumin,7,7),'-/'*2) "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;


--SUBSTR 위치
--INSTR 괄호 위치 
   SELECT NAME 
   ,TEL
   ,INSTR (TEL,')') A
   ,SUBSTR (TEL,INSTR (TEL,')')+1,3) A
,REPLACE (TEL,SUBSTR(TEL,INSTR (TEL,')')+1,3),'***') "REPLACE"
FROM STUDENT
WHERE deptno1 = 102;


   
   SELECT NAME 
   ,TEL
,REPLACE (TEL,SUBSTR(TEL,INSTR (TEL,'-')+1,4),'****') "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;

   SELECT NAME 
   ,TEL
,REPLACE (TEL,SUBSTR(TEL,INSTR (TEL,'-')+1,7),'****') "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;
--7개를 4개로 바꾸는것도 가능? > 오류는 아닌가?

   
   SELECT NAME 
   ,TEL
--   ,RPAD (TEL,15,'*')  > 뒤에 붙여주기만 궁금해서
,REPLACE (TEL,SUBSTR(TEL,INSTR (TEL,'-')+1,7),'****') "REPLACE"
FROM STUDENT
WHERE deptno1 = 101;




   
   
   
   
