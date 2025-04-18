
    SELECT '서진수' 
    , SUBSTR('서진수',1,2 )    
    , SUBSTRB('서진수',1,2 )
    --3바이트 한글자에 밑에만 가능
    , SUBSTRB('서진수',1,3 )
    FROM DUAL;    
    
--마이너스 찾음 첫번째부터 세번째있는 마이너스 찾음 그 자리 번호가 6임
--세번째 자리에서 처음으로 나오는 마이너스 자리는 4임
--세번째에서 찾음
--1,1 이랑 생략이랑 같음 첫번째에서 처음으로 나오는 마이너스
--뒤에서부터 세는데 마이너스 세번째값이 자리가 2
--뒤에서 세번째 처음으로 나오는 마이너스자리 4
--뒤에서 6번째자리

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
    
    
    SELECT 'A-B-C-D' 
    , INSTR ('A-B-C-D','-',1,3)    
--마이너스 찾음 첫번째부터 세번째있는 마이너스 찾음 그 자리 번호가 6임
    FROM DUAL;



SELECT ABS(-352) FROM DUAL;
--절댓값
SELECT SYSDATE FROM DUAL;
--오늘날짜
SELECT 1 FROM DUAL;
SELECT '서진수' 
    FROM DUAL;
    
    
    SELECT '서진수' 
    , LENGTH('서진수' )
    ,LENGTHB('서진수' )
    FROM DUAL;    


--DUAL : TEMP (임시) 테이블은 없는데 임시로 필요할때 테이블끼리 조인이나 작업시 사용
--데이터를 건드리지않고 잠깐 사용시 사용한다.
--데이터 가공처리 부족할때 사용
SELECT 1 FROM DUAL;



SELECT ENAME
           , DEPTNO
           , initcap(ename) 
           , LOWER(ename) 
           , UPPER(ename) 
   FROM EMP;