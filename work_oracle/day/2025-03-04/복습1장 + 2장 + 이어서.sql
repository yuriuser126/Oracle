SELECT NAME
,TEL
,DECODE((INSTR(TEL,'-')-INSTR(TEL,')')),5
,(REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')')+1,4),'****'))
,(REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')')+1,3),'***'))
) "REPLACE"
FROM EMP2;
-- 위치 지정 + 다른방법 도메인 코드



SELECT NAME
,TEL
,REPLACE(TEL,INSTR(TEL,')',1)
,TEL,INSTR(TEL,'-',1),'****')

DECODE(SUBSTR(TEL,INSTR(TEL,')',1),3,REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')',1)-1),SUBSTR(TEL,INSTR(TEL,'-',1)-1),'***')
4,REPLACE(TEL,SUBSTR(TEL,INSTR(TEL,')',1)-1),SUBSTR(TEL,INSTR(TEL,'-',1)-1),'***')))

FROM EMP2;

SELECT NAME
,INSTR(TEL,')',1) M

,INSTR(TEL,'-',1) M
--,REPLACE(TEL,INSTR(TEL,'-',1)-INSTR(TEL,')',1),?)
,RPAD(TEL,12,SUBSTR('************', LENGTH(TEL)+1)) M
,LENGTH(TEL) M
,SUBSTR(TEL,1,INSTR(TEL,')',1)-1)  M
,INSTR(TEL,')',1) M
FROM EMP2;








SELECT
NAME
,EMAIL
,SUBSTR(EMAIL,INSTR(EMAIL,'@')+1,INSTR(EMAIL,'.')-1-INSTR(EMAIL,'@')) DOMAIN
FROM PROFESSOR;
--------
--위치에서 위치까지의 개수는 빼면된다. - 교수님
SELECT
NAME
,EMAIL
,SUBSTR(EMAIL,INSTR(EMAIL,'@')+1,INSTR(EMAIL,'.')-1 ) DOMAIN
,SUBSTR(EMAIL,9,11) DOMAIN
,SUBSTR(EMAIL,1,INSTR(EMAIL,'@')+1) N
,SUBSTR(EMAIL,1,INSTR(EMAIL,'.')-1) N
,INSTR(EMAIL,'@')+1 A
,INSTR(EMAIL,'.')-1 A

FROM PROFESSOR;
--2B-6

SELECT NAME
,TEL
,SUBSTR(TEL,1,INSTR(TEL,')',1)-1) LOC
,DECODE(SUBSTR(TEL,1,INSTR(TEL,')')-1),02,'SEOUL'
                                                                ,031,'GYEONGGI'
                                                                ,051,'BUSAN'
                                                                ,055,'GYEONGNAM') LOC
FROM STUDENT
WHERE DEPTNO1 = 101 ;
--교수님 거
SELECT NAME
,TEL
,SUBSTR(TEL,1,INSTR(TEL,')',1)-1) LOC
,DECODE(SUBSTR(TEL,1,INSTR(TEL,')',1)-1),02,'SEOUL'
,DECODE(SUBSTR(TEL,1,INSTR(TEL,')',1)-1),031,'GYEONGGI'
,DECODE(SUBSTR(TEL,1,INSTR(TEL,')',1)-1),051,'BUSAN'
,DECODE(SUBSTR(TEL,1,INSTR(TEL,')',1)-1),055,'GYEONGNAM')))) LOC
FROM STUDENT
WHERE DEPTNO1 = 101 ;
--051적고 경남에 051적어놨었다. 오류 이유

SELECT * FROM STUDENT;


SELECT PROFNO
, NAME
,SUBSTR(EMAIL,1,INSTR(EMAIL,'@')-1) "EMAIL_ID"
FROM PROFESSOR
WHERE EMAIL IS NOT NULL;
--INSTR -> INSTAR 로 적음 


SELECT PROFNO
, NAME
,HPAGE
,INSTR(HPAGE,'.',1, 2) "HTTP"
FROM PROFESSOR
WHERE HPAGE IS NOT NULL;
--INSTAR 인 에스티알

SELECT NAME
,HPAGE
,REPLACE(HPAGE,SUBSTR(HPAGE,INSTR(HPAGE,'.',1,2)+1,2),'OK')"OK"
--,INSTR(HPAGE,'.')
FROM PROFESSOR
WHERE HPAGE IS NOT NULL;
--2B-9

SELECT GNAME
, JUMIN
,REPLACE(GNAME,SUBSTR(GNAME,4,3),'337')"337"
FROM CUSTOMER
WHERE SUBSTR(JUMIN,1,2) < '77';
--REPLACE SUBSTR

SELECT ENAME
           , SAL
           , NVL(COMM,0) COMM
           , TO_CHAR(((SAL*12)+ NVL(COMM,0)),'9,999,999') TOTAL
   FROM EMP
 WHERE DEPTNO =30 ;
 ---2B 12,  NVL(COMM,0)-> 안에 집어넣기 NULL값으론 계산 안되니까아

SELECT * FROM  PROFESSOR;

SELECT NAME
            ,TO_CHAR(HIREDATE,'YYYY-MM-DD') "HIREDATE"
           ,PAY
           ,BONUS
           ,TO_CHAR(((PAY*12)+BONUS),'$99,999') TOTAL
           ,TO_CHAR((((PAY*12)+BONUS)*0.9),'$99,999') "10%DOWN"
           ,TO_CHAR((((PAY*12)+BONUS)*0.9)*1200,'99,999,999') WON
   FROM  PROFESSOR
   WHERE BONUS IS NOT NULL;
   --TO밑에 짝대기 잘 긋자.... 

SELECT NAME
           , HIREDATE
   FROM  PROFESSOR
   WHERE TO_CHAR(HIREDATE,'MM') IN ('03','08','10');
--정답 2B-10

SELECT NAME
           , HIREDATE
   FROM  PROFESSOR
   WHERE TO_CHAR(HIREDATE,'MM') = 03 
   OR TO_CHAR(HIREDATE,'MM') = 08
    OR TO_CHAR(HIREDATE,'MM') = 10;
 ---   
    SELECT HIREDATE 
    FROM PROFESSOR
       WHERE TO_CHAR(HIREDATE,'MM') = 03 ;
---연습

SELECT DNAME
           , LPAD(DNAME,9,'123456789') "LPAD"
           , LOC
           ,LENGTH(LOC)+1
           ,SUBSTR('123456789', LENGTH(LOC)+1)
           , RPAD(LOC,9,SUBSTR('123456789', LENGTH(LOC)+1)) "RPAD"
   FROM  DEPT;
   --LPAD RPAD
   --LOC 는 나라 ㅋㅋㅋ
   -- 나라 9글자 빈칸주고 왼쪽에서 자를건데 123456789 넣는데 그거 자르는게 나라 길이 +1자리부터

SELECT UPPER(NAME) NAME
           , EMAIL
           ,  INSTR(EMAIL,'@') "@"
   FROM  PROFESSOR
   WHERE EMAIL IS NOT NULL;
--이메일 있음 + INSTR @위치 찾기

SELECT GNAME,
SUBSTR(jumin,1,2) YEAR
           , POINT
   FROM  CUSTOMER
  WHERE POINT >= 100000
  ORDER BY POINT;
--JUMIN 컬럼 사용 조건 하나 출력 두개 정렬, SUBSTR 사용 연도 출력

SELECT UPPER(NAME) NAME
        , LOWER(ID)
           , initcap(POSITION) 
           ,  LENGTH (EMAIL) EMAIL_SIZE 
   FROM  PROFESSOR
   WHERE EMAIL IS NOT NULL;
   --괄호 잘 치기



SELECT ENAME
            , SAL
            , COMM
    FROM EMP 
    WHERE (SAL >= 1000 
    AND COMM >0)
    OR SAL >= 3000;

SELECT ENAME
            , DEPTNO
            , SAL
            , SAL*12
    FROM EMP 
    ORDER BY DEPTNO DESC, SAL*12;

SELECT ENAME
            , JOB
            , EMPNO
    FROM EMP 
  WHERE COMM IS NULL;
  --커미션 안받는분 출력

SELECT * FROM EMP;

SELECT ENAME
            , JOB
            , EMPNO  
    FROM EMP 
  WHERE ENAME LIKE 'JA%';
  --JA로 시작하는 사원 LIKE+ '%' 형식 기억하기

SELECT ENAME
            , JOB
            , SAL  
    FROM EMP 
  WHERE SAL >= 2000  
      AND SAL <= 3000;
      --비교연산자 사용
      
SELECT ENAME
            , EMPNO
            , SAL  
    FROM EMP 
  WHERE SAL > 1000 
      AND DEPTNO = 20;
--조건 2개 WHERE AND

SELECT * FROM EMP;

SELECT ENAME
           , JOB
           , SAL  
   FROM EMP 
 WHERE SAL > 2000 
 ORDER BY SAL DESC ;
--월급이 2000보다 큰 사원의 이름,직업,월급 출력 큰순 ASC : 자동 오름차순이라 안적음

SELECT NAME
           ,  pay 
           ,  PAY*12 "Y_PAY" 
   FROM  PROFESSOR;
   ---연봉 출력 월급*12
   
SELECT NAME || '교수의 이메일은' ||
           EMAIL ||'이고, 홈페이지는' ||
           HPAGE || '이다.'
   FROM  PROFESSOR;
   --합성연산자로 출력

SELECT PROFNO "학과번호 "
           , NAME "교수명"
           ,  POSITION "위치"
           ,  hpage 홈페이지
   FROM  PROFESSOR;


SELECT PROFNO "학과번호 "
           , NAME "교수명"
           ,  POSITION "위치"
           ,  hpage "홈페이지"
   FROM  PROFESSOR;
---칼럼명 지정 복습 별명지정

SELECT DISTINCT
              PROFNO
   FROM  PROFESSOR;
   --중복되는 행 제외 학과번호

SELECT NAME
           ,  ID
           ,  EMAIL 
   FROM  PROFESSOR;

SELECT * FROM TAB;

DESC  PROFESSOR;

SELECT * FROM PROFESSOR;