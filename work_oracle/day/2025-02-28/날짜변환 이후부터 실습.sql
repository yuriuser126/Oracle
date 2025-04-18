   ---실습 날짜변환 이후
   
   
   SELECT STUDNO 
   ,NAME 
   ,BIRTHDAY
   ,SUBSTR(BIRTHDAY,4,2)  "1월글자따옴" 
       ,TO_CHAR(BIRTHDAY,'MONTH') N
       ,TO_CHAR(BIRTHDAY,'DDTH') N
FROM STUDENT
WHERE SUBSTR(BIRTHDAY,4,2)= 01 ;
--WHERE BIRTHDAY = TO_CHAR(BIRTHDAY,'MONTH') ;

  SELECT STUDNO 
   ,NAME 
   ,BIRTHDAY
FROM STUDENT
WHERE TO_CHAR(BIRTHDAY,'MM')='01' ;


SELECT EMPNO
--,DUAL=1
,ENAME
,HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM')='01' 
OR TO_CHAR(HIREDATE,'MM')= '02'
OR TO_CHAR(HIREDATE,'MM')= '03';

SELECT EMPNO
--,DUAL=1
,ENAME
,HIREDATE
FROM EMP
WHERE TO_CHAR(HIREDATE,'MM') IN('01','02','03') ;

SELECT ENAME
FROM EMP
WHERE ENAME = 'ALLEN';

SELECT EMPNO
,ENAME
,SAL "급여"
,COMM "커미션 보너스"
, TO_CHAR((SAL*12)+COMM,'99,999') "SALARY"
FROM EMP
WHERE ENAME = 'ALLEN';



SELECT NAME
,PAY
,BONUS "급여"
   ,NVL(BONUS,0) 
--     ,NVL2(BONUS,SAL+BONUS,SAL*0) 
, TO_CHAR((PAY*12)+BONUS,'99,999') "SALARY"
FROM PROFESSOR
WHERE DEPTNO = '201';



SELECT * FROM PROFESSOR;

SELECT NAME
,PAY
,BONUS "급여"
   ,NVL(BONUS,0) 

, TO_CHAR((PAY*12)+BONUS,'99,999') "TOTAL"
FROM PROFESSOR
WHERE DEPTNO = '201';
--NULL - 화면에 표시 안됨 빈칸임







SELECT EMPNO
,ENAME
,TO_CHAR(HIREDATE,'YYYY-MM-DD') "HIREDATE"
, TO_CHAR((SAL*12)+COMM,'$99,999') "SAL"
, TO_CHAR(((SAL*12)+COMM)*1.15,'99,999') "15% UP"

FROM EMP
WHERE COMM IS NOT NULL;





SELECT PROFNO
,NAME
,PAY
,BONUS
--   ,NVL(BONUS,0) "BONUS"
, TO_CHAR((PAY*12)+NVL(BONUS,0),'99,999') "TOTAL"
FROM PROFESSOR
WHERE DEPTNO = '201';



SELECT EMPNO
,ENAME
,COMM
   ,NVL2(COMM,'EXSIST','NULL') "NVL2"

FROM EMP
WHERE DEPTNO = '30';


--단축키SHIFT DEL 한줄삭제









SELECT EMPNO
,ENAME
,COMM ||'--' ||
   NVL2(COMM,'EXSIST','NULL') "S널 참거짓"
FROM EMP
WHERE DEPTNO = '30';






SELECT '   *'
,'   *'
,'   *'
,'   *'
,'   *'
,'   *'
FROM DUAL;

--열을 행으로 내릴수 없나?
--데이터만 행?
--
--DUAL 만들ㄸ ㅐ 행 만들수 없나?
--D안됨






--끌어다 쓰려고 밑에 둠
SELECT 2
    ,SYSDATE
    ,TO_CHAR(SYSDATE) N
    ,TO_CHAR(SYSDATE,'YYYY') N
    ,TO_CHAR(SYSDATE,'YY') N
    ,TO_CHAR(SYSDATE,'YEAR') N
    ,TO_CHAR(SYSDATE,'MONTH') N
    ,TO_CHAR(SYSDATE,'MM') N
--    ,TO_CHAR(SYSDATE,'DATE') N 오류
    ,TO_CHAR(SYSDATE,'DAY') N
    ,TO_CHAR(SYSDATE,'DDTH') N
    ,TO_CHAR(SYSDATE,'YYYY-MM-DD') N
    --실무에서 많이쓰는 날짜 형식 위에거
    
    ,TO_CHAR(SYSDATE,'YYYY-MM-DD-WW') N
        ,TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') N
--    ,TO_CHAR(SYS,'HOUR') N

   FROM  DUAL;
   
   
   
   
   
    SELECT 'A-B-C-D' 
    , INSTR ('A-B-C-D','-',1,3)    A
    , INSTR ('A-B-C-D','-',3,1)    A
    , INSTR ('A-B-C-D','-',3)    A
    , INSTR ('A-B-C-D','-')     A
    , INSTR ('A-B-C-D','-',1,1)     A
    , INSTR ('A-B-C-D','-',-1,3)    A
    , INSTR ('A-B-C-D','-',-3,1)    A
    , INSTR ('A-B-C-D','-',-6,1)    A
    , INSTR ('A-B-C-D','-',-6,2)    A

    FROM DUAL;    
    
    
       SELECT ENAME 
   ,COMM "값없는거 널"
   ,NVL(COMM,0) "널 숫자 0으로"
   ,NVL(COMM,100) "널 숫자 바꿔줌"
   ,NVL2(COMM,SAL+COMM,SAL*0) "S널 참거짓"
   --NULL 이면 널이 아니면 두번째꺼 앞에거 널이면참값이면 0

FROM EMP;