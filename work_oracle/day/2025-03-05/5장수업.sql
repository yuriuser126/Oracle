---5장 수업
SELECT * FROM PROFESSOR;


------------------데이터 추가 INSERT 오류------------------------------------------------
SELECT * FROM T_MINUS;
ROLLBACK;
COMMIT;

INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(1,1,1);
--NO2 : 정수로만 만들어져있음 오류는 X 정수 3자리값만 들어간다.
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(1.1,1.1,1.1);
--NUMBER : 오류는 안나는데 정수만 들어감
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(-1.1,-1.1,-1.1);
--NUMBER : 오류는 안나는데 정수만 들어감
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(2.22,2.22,2.22);
--NUMBER : 오류는 안나는데 정수만 들어감
--NUMBER(3,2) :  소숫점 두자리까지만 저장됨
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(1.123,1.123,1.123);
-- 오류안남
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(1.1234,1.1234,1.1234);
--난리남
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(10.1234,10.1234,10.1234);
--난리남
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(10.12,10.12,10.12);
--오류
--INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(10.12,10.12,10.1);
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(10.12,10.12,1.12);
--가능 정수 1자리 소숫점 두자리 저장된다. -NUMBER(3,2) :  소숫점 두자리까지만 저장됨 
--3은 1+2 정수 소수 말하는거다.

-- 안됨 소수자리
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(100.1,100.12,100.12);
--가능
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(100.1,100.12,1.12);
--세번째 때문에 안됨. 정수 1 소수2
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(55,55,55);
-- 가능
INSERT INTO T_MINUS(NO1, NO2, NO3) VALUES(55,55,5);




CREATE TABLE T_MINUS
( NO1 NUMBER
, NO2 NUMBER(3)
, NO3 NUMBER(3,2)
);



------------------데이터 추가 INSERT------------------------------------------------

--컬럼명의 순서는 테이블 순서대로 안해도 상관은 없다
--데이터는 순서대로 넣어야한다.
INSERT INTO DEPT2(DCODE, DNAME, PDEPT, AREA) VALUES(9000,'temp_1',1006,'Temp Area');
INSERT INTO DEPT2 VALUES(9001,'temp_2',1006,'Temp Area2');
--안됨
--컬럼명을 생략할때는 데이터를 전부 추가할때만 가능하다.
--1개라도빠지면 오류가 난다.
--INSERT INTO DEPT2 VALUES(9002,'temp_3',1006);
INSERT INTO DEPT2(DCODE, DNAME, PDEPT) VALUES(9002,'temp_3',1006);
--3개만 넣으면 넣어진다. 조회도 된다 대신 안넣은곳은 null값으로 처리한다.
SELECT * FROM DEPT2;
---------------------------------------------------------------------------------