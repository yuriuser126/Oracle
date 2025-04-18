-- 단일행 함수

SELECT 2  "단일행 관련함수" 
    ,2+2 N
    --    ,2+'A' N
    --오류
    --묵시적(자동형 변환)
    ,2+'2' N
    --명시적(수동형 변환)
    ,2+TO_NUMBER(2) N
    FROM DUAL;
    
SELECT 2
    ,SYSDATE
    ,TO_CHAR(SYSDATE) N
    ,TO_CHAR(SYSDATE,'YYYY') N
    ,TO_CHAR(SYSDATE,'YY') N
    ,TO_CHAR(SYSDATE,'YEAR') N
    ,TO_CHAR(SYSDATE,'MONTH') N
--    ,TO_CHAR(SYSDATE,'DATE') N 오류
    ,TO_CHAR(SYSDATE,'DAY') N
    ,TO_CHAR(SYSDATE,'DDTH') N
    ,TO_CHAR(SYSDATE,'YYYY-MM-DD') N
    --실무에서 많이쓰는 날짜 형식 위에거
    
    ,TO_CHAR(SYSDATE,'YYYY-MM-DD-WW') N
        ,TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') N
--    ,TO_CHAR(SYS,'HOUR') N

   FROM  DUAL;
   
   SELECT 2
,TO_CHAR(SYSDATE,'YYYY-MM-DD HH24:MI:SS') N
   FROM DUAL;