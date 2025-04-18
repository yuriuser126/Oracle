-- 단일행 함수 숫자-문자

   SELECT ENAME 
   ,COMM A
   ,NVL(COMM,0) A
   ,NVL(COMM,100) A
   ,NVL2(COMM,SAL+COMM,SAL*0) 
   --NULL 이면 널이 아니면 두번째꺼 앞에거 널이면참값이면 0

FROM EMP
WHERE deptno = 30;

   SELECT 
    SYSDATE "오늘날짜"
    ,'2014-05-31'
    ,TO_DATE('2014-05-31')
  
   FROM  DUAL;
   