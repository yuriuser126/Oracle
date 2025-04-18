--2장 31번 강사님
SELECT NO
,IP
  , REGEXP_REPLACE(IP,'\.','/',1,1) R
  , REGEXP_REPLACE(IP,'\.','/',1,2) R
  , REGEXP_REPLACE(IP,'\.','/',1,3) R
  , REGEXP_REPLACE(IP,'\.','/',1,4) R
  , REGEXP_REPLACE(IP,'\.','/',4,1) R
  -- 위치, 첫번째 N번째
  --4번째니까 없어서 안뜨나???????
  FROM t_reg2;




--2장 31번
SELECT NO
,IP
  , REGEXP_REPLACE(IP,'[.]','/') 
  FROM t_reg2;
  
  --,INSTR(IP,'.',1)
--  , REGEXP_REPLACE(IP, ',[SUBSTR(1,INSTR(IP,'.',1)')],'/')




--2장 30번 강사님--
SELECT NO
,IP
  , REGEXP_REPLACE(IP, '\.','')
  FROM t_reg2;

--2장 30번
SELECT IP

  FROM t_reg2
--  알파벳 소문자
  WHERE NOT REGEXP_LIKE(TEXT,'\.');  
--  , REGEXP_REPLACE(TEXT, '[*]','');


---2장 29번 강사님
SELECT NAME
,TEL
FROM STUDENT
--WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');   
--WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');   
WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');  
-- 토막내서 숫자붙이고싶으면 || 사용해서 출력

--^ 두개 넣는거
--WHERE REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');   
--???????????? 안에 AND 뭐지
--공백주지말것
--백슬래시 _ ) 기호찾기


select name
    , tel
     from student
    where REGEXP_LIKE(TEL, '^[0-9]{2}\)[0-9]{4}');




---2장 29번

SELECT NAME
,TEL
--M으로 시작하고 다음에 a나o가 옴
,TEL
FROM STUDENT
WHERE REGEXP_LIKE(TEL,'0(2)') AND REGEXP_LIKE(TEXT,'[0-9]{4}');   






---강사님 2장 28번
--작은 따옴표 없애도 된다
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


--2장 28번
SELECT EMPNO
,ENAME
,SAL
, CASE                                WHEN  SAL BETWEEN 1 AND 1000 THEN 'LEVEL 1'
                                         WHEN  SAL BETWEEN 1001 AND 2000 THEN 'LEVEL 2'
                                         WHEN  SAL BETWEEN '2001' AND '3000' THEN 'LEVEL 3'
                                         WHEN  SAL BETWEEN '3001' AND '4000' THEN 'LEVEL 4'
                                         ELSE 'LEVEL 5'
                                                                                                         END "LEVEL" 
FROM EMP
ORDER BY SAL DESC;


---2장 27번 강사님거 아래 코드
--케이스 주지않고 비트윈 사용 
--어쩌나 했다 으아
SELECT NAME
,SUBSTR(JUMIN,3,2) MONT
, CASE                                WHEN  SUBSTR(JUMIN,3,2) BETWEEN '01' AND '03' THEN '1/4'
                                         WHEN  SUBSTR(JUMIN,3,2) BETWEEN '04' AND '06' THEN '2/4'
                                         WHEN  SUBSTR(JUMIN,3,2) BETWEEN '07' AND '09' THEN '3/4'
                                         WHEN  SUBSTR(JUMIN,3,2) BETWEEN '10' AND '12' THEN '4/4'
--                                                                                                         ELSE'ELSE'
                                                                                                         END "QUA" 
FROM STUDENT;


---2장 27번 
SELECT NAME
,SUBSTR(JUMIN,3,2) MONT
, CASE  SUBSTR(JUMIN,3,2)  WHEN  '01' THEN '1/4'
                                                WHEN  '02' THEN '1/4' 
                                                WHEN  '03' THEN '1/4' 
                                                WHEN  '04' THEN '2/4' 
                                                WHEN  '05' THEN '2/4' 
                                                WHEN  '06' THEN '2/4' 
                                                WHEN  '07' THEN '3/4' 
                                                WHEN  '08' THEN '3/4' 
                                                WHEN  '09' THEN '3/4' 
                                                WHEN  '10' THEN '4/4' 
                                                WHEN  '11' THEN '4/4' 
                                                WHEN  '12' THEN '4/4' 
--   
--                                                                ELSE'ELSE'
                                                                END "QUA" 
FROM STUDENT;


---2장 26번
SELECT NAME
,TEL
, CASE  (SUBSTR(TEL,1,INSTR(TEL,')')-1))  WHEN  '02' THEN 'SEOUL' 
                                                                WHEN  '031' THEN 'GYEONGGI' 
                                                                WHEN  '051' THEN 'BUSAN' 
                                                                WHEN  '052' THEN 'OLSAN' 
                                                                WHEN  '055' THEN 'GYEJONGNAM' 
                                                                ELSE'ETC'
                                                                END "LOC"
FROM STUDENT
WHERE DEPTNO1=201;
-- 잘못 누름 


SELECT NAME
,TEL
,REGEXP_REPLACE(TEL,'( ){1,}','*') STAR
,DECODE((INSTR(TEL,'-')-INSTR(TEL,')')),5
,(REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')')+1,4),'****'))
,(REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')')+1,3),'***'))
) "REPLACE"
FROM EMP2;
-- 위치 지정 + 다른방법 도메인 코드

--숫자를 별표로
--, REGEXP_REPLACE(TEXT, '[0-9]','*') R
--, REGEXP_REPLACE(TEXT, '[[:digit:]]','*') R



--실습문제