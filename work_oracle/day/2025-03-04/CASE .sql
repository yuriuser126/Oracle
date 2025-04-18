--* 정규(표현)식(Regular Expression) -> 자바스크립트에서도 존재
--오라클10G부터 지원 현재는 (11G)사용중임
--대표 함수

REGEXP_LIKE
REGEXP_REPLACE
REGEXP_COUNT

--CASE 변형


SELECT CASE   WHEN '2' = '1' THEN 'A' 
--                            WHEN '3' = '1' THEN 'B' 
--                            WHEN '1' = '1' THEN 'B' 
                            ELSE 'ETC'
                            END "TEST"

FROM DUAL;
--결과에따라 참값나옴


--ELSE가 없으면 NULL로 뜬다 결과값이.
--ELSE 생략가능

SELECT CASE '4' WHEN '1' THEN 'A' 
                            WHEN '2' THEN 'B' 
                            WHEN '3' THEN 'C'
--                            ELSE 'ETC'
                            END "TEST"

FROM DUAL;



--DECODE 비슷한 CASE
--DECODE 는 오라클에서 있고, 성능을 위해서 CASE 사용  퍼포먼스 
--SWITCH CASE와 비슷
-- END 뒤에는 컬럼명 

SELECT CASE '1' WHEN '1' THEN 'A' 
                            WHEN '2' THEN 'B' 
                            WHEN '3' THEN 'C'
                            ELSE 'ETC'
                            END "TEST"

FROM DUAL;


SELECT 1 FROM DUAL;
SELECT * FROM DUAL;

--CASE 시작