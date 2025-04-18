




SELECT * FROM EMP;

SELECT ENAME, JOB,SAL  FROM EMP WHERE SAL >= 2000 ;
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