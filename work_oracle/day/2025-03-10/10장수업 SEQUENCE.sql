------------10장 수업--------SEQUENCE-------------------------
--SCOTT도 볼수있는 데이터 사전
SELECT * FROM user_sequences;
--현재번호 : 처음에 오류
SELECT JNO_SEQ.CURRVAL FROM DUAL;
--100부터 시작 -- 볼수 있음--
SELECT JNO_SEQ.NEXTVAL FROM DUAL;
--줄어든다 0다음 20으로 순환
SELECT JNO_SEQ_REV.NEXTVAL FROM DUAL;

------DROP 삭제-------------------------
DROP SEQUENCE JNO_SEQ_REV;

--------------------------------
CREATE SEQUENCE JNO_SEQ_REV
INCREMENT BY -2
START WITH 10
MAXVALUE 20
MINVALUE 0
CYCLE 
--순환하겠다
CACHE 2;
------변경---120 이상이면 오류가 나온다---------------------------
ALTER SEQUENCE JNO_SEQ
MAXVALUE 120
NOCYCLE 
CACHE 10;

--------------------------------
CREATE SEQUENCE JNO_SEQ
INCREMENT BY 1
START WITH 100
MAXVALUE 110
MINVALUE 90
CYCLE 
--순환하겠다
CACHE 2;
--2개씩 번호  메모리에 올린다--
--마지막 넘버 100번--?--
-----------------------------------------------------

-----------------------------------------------