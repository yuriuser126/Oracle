--4장 실습문제



--------------실습문제 4장 7--------컬럼삭제-----------------------

ALTER TABLE new_emp2
DROP COLUMN BIRTH ;
--BIRTH 컬럼이 원래는 있었다.

DESC new_emp2; --확인 가능
SELECT *  FROM new_emp2;
--------------실습문제 4장 6-------타입길이변경---------------------

ALTER TABLE new_emp2
MODIFY(EMPNO NUMBER(7));


ALTER TABLE new_emp2
--MODIFY(HIREDATE NUMBER(7));
--MODIFY(HIREDATE VARCHAR2(7));
--MODIFY(HIREDATE DATE(7));
--MODIFY(HIREDATE DATE(5));
--고정
--NUMBER VARCHAR 만 수정가능


SELECT *  FROM new_emp2;
---NUMBER(4)를 변경한거다.
--ALTER 테이블 타입 테이블명
--MODIFY 변경 (컬럼명 타입길이)



--------------실습문제 4장 5----------컬럼명변경----------------
--컬럼명 변경
ALTER TABLE new_emp2
RENAME COLUMN BIRTHDAY TO BIRTH;

SELECT *  FROM new_emp2;

--ALTER TABLE 테이블명
--RENAME COLUMN컬럼 컬럼 본명 TO 바꾸는 컬럼명;

--------------실습문제 4장 4-----------------------------------
--컬럼 이름만 복사때
CREATE TABLE new_emp3
AS
SELECT *  FROM new_emp2
WHERE 1=2;

ROLLBACK;

SELECT * FROM new_emp3;

DROP TABLE new_emp4;
DROP TABLE new_emp3;
 
--------------실습문제 4장 3-----------------------------------
ALTER TABLE new_emp2
ADD (BIRTHDAY VARCHAR2(10) DEFAULT SYSDATE);

SELECT * FROM new_emp2;
SELECT * FROM new_emp3;

--ALTER TABLE 컬럼명
--ADD(새 컬럼명 VARCHAR2(몇자리) DEFAULT 데이터 고정값)

--------------실습문제 4장 2------------------------------------

--컬럼명 골라서 복사
CREATE TABLE new_emp2
AS
SELECT EMPNO,ENAME,HIREDATE FROM EMP;

SELECT * FROM new_emp2;

--------------실습문제 4장 1------------------------------------
DESC new_emp;
INSERT INTO new_emp(NO) VALUES(1) ;
INSERT INTO new_emp100(NO) VALUES(1) ;
SELECT * FROM new_emp;
SELECT * FROM new_emp100;

--한꺼번에는 순서대로 입력
--컬럼명을 적으면 뒤 벨류값 순서 안지켜도됨
--순서대로 적으면 컬럼명 생략 가능
--INSERT INTO new_emp(NO,) VALUES(1,) ;
INSERT INTO new_emp(NO) VALUES(1) ;
INSERT INTO new_emp(NO) VALUES(1) ;
INSERT INTO new_emp(NO) VALUES(1) ;

--컬럼명 대신 숫자 사용 불가 ORDERBY만 숫자로 사용가능하다.


CREATE TABLE new_emp100
( NO NUMBER(5) DEFAULT 0
,NAME VARCHAR2(20) DEFAULT 'VARCHAR2(20)'
,HIREDATE DATE DEFAULT '2018/12/12'
,BONUS VARCHAR2(30) DEFAULT 'NUMBER(6,2)'
);
---??? DEFAULT 값 데이터 넣는거 아니였나> 타입 문제였다

CREATE TABLE new_emp100
( NO NUMBER(5) DEFAULT 'NUMBER(5)'
,NAME VARCHAR2(20) 
,HIREDATE DATE 
,BONUS 
);
----------?


CREATE TABLE new_emp
( NO NUMBER(5) 
,NAME VARCHAR2(20) 
,HIREDATE DATE
,BONUS  NUMBER(6,2)
);






---------------------------------------------------

SELECT * FROM NEW_EMP;
SELECT * FROM TT_03;

INSERT INTO TT_03(NO) VALUES(1) ;

CREATE TABLE TT_03
--컬럼명 숫자 자리수 0~999, 0~3아님
( NO NUMBER(3,1) DEFAULT 0--소수점 1자리, 전체 3자리(정수2자리) 
,NAME VARCHAR2(10) DEFAULT 'NO NAME'--10자 이하로 이름을 짓겠다. (3바이트 한글) 이름석자
,HIREDATE DATE DEFAULT SYSDATE
);