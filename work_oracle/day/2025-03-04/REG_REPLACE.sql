
SELECT TEXT
--  aa 글자 개수 글자수 
--aa 검색 세가지 방법 셋다 같음
, REGEXP_COUNT(TEXT,'aa') A
, REGEXP_COUNT(TEXT,'a{2}') A
, REGEXP_COUNT(TEXT,'(a)(a)') A

  FROM t_reg;



SELECT TEXT
--  모든문자 글자수 
--점은 모든문자
, REGEXP_COUNT(TEXT,'.') D
--결과 같다
, LENGTH(TEXT) D
--점의 개수 구하기 백슬래시 사용
, REGEXP_COUNT(TEXT,'\.') D
--특수문자 찾을때
--아래거는 백슬래시 없이 그냥 찾기
, REGEXP_COUNT(TEXT,'\A') D
, REGEXP_COUNT(TEXT,'\a') D

  FROM t_reg;


SELECT TEXT
--  알파벳 소문자 a 개수
, REGEXP_COUNT(TEXT,'a') C
--  알파벳 소문자 bc 개수
, REGEXP_COUNT(TEXT,'bc') C
--  숫자 12 개수
, REGEXP_COUNT(TEXT,'12') C
, REGEXP_COUNT(TEXT,'c') C
--5번째 위치에서 부터 c의 갯수 / 위치 지정
, REGEXP_COUNT(TEXT,'c',5) C
--첫번째부터니까 똑같음
, REGEXP_COUNT(TEXT,'c',1) C
--대소문자 포함 대문자 C까지 다 계산후 카운트 함
, REGEXP_COUNT(TEXT,'c',1,'i') C
  FROM t_reg;
--  알파벳 소문자


SELECT  REGEXP_REPLACE('aaa bbb','( ){2,}','*') STAR
--                  aaa bbb 사이 스페이스 공백 두개 아래코드
--                  공백 2개이상이 별표로 바뀌었다.
                    ,REGEXP_REPLACE('aaa  bbb','( ){2,}','*') STAR
--                  공백 3개이상이 별표로 바뀌었다.
                    ,REGEXP_REPLACE('aaa   bbb','( ){2,}','*') STAR

--                , REGEXP_REPLACE('aaa bb  c   d','( ){1}',' ') R

FROM DUAL;


SELECT  REGEXP_REPLACE('aaa bb  c   d','( ){1}','') R
--              원 데이터랑 동일 아래코드 공백을 공백으로 만들었다.
--              공백 하나이상을 공백으로 만들겠다. 공백-> 공백
                , REGEXP_REPLACE('aaa bb  c   d','( ){1}',' ') R
--                공백 2개를 1개로 만들었다.
                , REGEXP_REPLACE('aaa bb  c   d','( ){2}',' ') R
--                공백 3개를 1개로 만들었다
                , REGEXP_REPLACE('aaa bb  c   d','( ){3}',' ') R
--                공백 2개 이상을 제거
                , REGEXP_REPLACE('aaa bb  c   d','( ){2,}','') R
                --                공백 3개 이상을 제거
                , REGEXP_REPLACE('aaa bb  c   d','( ){3,}','') R
                --                공백 1개 이상을 제거
                , REGEXP_REPLACE('aaa bb  c   d','( ){1,}','') R            
                
--aaa다음 스페이스 1 bb다음 스페이스 2 c 다음 스페이스 3
--괄호는 스페이스 하나 준다
--공백을 전부 붙여줬다 
FROM DUAL;


SELECT TEXT
--숫자를 별표로
--, REGEXP_REPLACE(TEXT, '[0-9]','*') R
, REGEXP_REPLACE(TEXT, '[[:digit:]]','*') R
--대문자오류
--, REGEXP_REPLACE(TEXT, '[[:DIGIT:]]','*') R
  FROM t_reg;
  
--  WHERE NOT REGEXP_LIKE(TEXT,'[0-9]');  