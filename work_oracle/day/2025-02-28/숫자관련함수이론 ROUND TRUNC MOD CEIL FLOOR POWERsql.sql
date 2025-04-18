--숫자관련함수 이론 2-2 날짜 관련함수 2-3

SELECT SYSDATE "날짜 관련함수"
---한달이라서 숫자 1나옴 / 위치바꾸면 음수가 나옴
           , MONTHS_BETWEEN('14/09/30','14/08/31') M
           , MONTHS_BETWEEN('14/08/31','14/09/30') M
           ,ADD_MONTHS(SYSDATE,1) A
           --'19/12/01' 기준으로 돌아오는 수요일
           ,NEXT_DAY('19/12/01','수') N 
           --오늘 기준으로 돌아오는 수요일 담주임
           ,NEXT_DAY(SYSDATE,'수') N
--           ,LAST_DAY(SYSDATE,)

   FROM  DUAL;





--올림 내림은 지정해서 할수 없음
SELECT 987.654
           , ROUND(987.654,2) R
           , ROUND(987.654,0) R
           , ROUND(987.654,-1) R
           ,TRUNC(987.654,2) T
           ,TRUNC(987.654,0) T
           ,TRUNC(987.654,-1) T
           ,MOD(121,10) M
           ,CEIL(123.45) C
           ,FLOOR(123.45) F
           ,POWER(12,2) P
           
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