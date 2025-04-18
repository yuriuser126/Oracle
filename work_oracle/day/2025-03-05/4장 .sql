--4장 시작

-----------------DROP 삭제------------------------
SELECT * FROM DEPT7;

ALTER TABLE DEPT7
DROP COLUMN LOCATION;
--LOCATION 컬럼 삭제 다시 조회하면 삭제되서 없다.

--------------ALTER-----------------------
SELECT * FROM DEPT7;

ALTER TABLE DEPT7
MODIFY(LOC VARCHAR(20));
--VARCHAR(10)을 20으로 변경하겠다. 
--테이블 구조보는 DESC로 보면 볼수 있다. 그림 노션참조

DESC DEPT7;


--테이블 이름이 변경되었다
--DEPT7에 데이터가 존재 DEPT6에 데이터 존재하지 않는다.
RENAME DEPT6 TO DEPT7;


--컬럼명 변경
ALTER TABLE DEPT6
RENAME COLUMN LOCATION2 TO LOC;
--컬럼명이 LOC로 바뀌어 있다.


--컬럼 추가
ALTER TABLE DEPT6
ADD (location2 VARCHAR2(10) DEFAULT 'seoul');
--변경되었다고 한다
--LOCATION 2 컬럼이 생기며 데이터 세개가 다서울로 바뀌어 있다.

ALTER TABLE DEPT6
ADD (location VARCHAR2(10));
-- LOCATION이름으로 10개 입력할수있는걸 추가하겠다. 변경되었다.
--LOCATION이 들어가 있다고 한다...

SELECT * FROM DEPT6;
SELECT * FROM DEPT7;
SELECT * FROM DEPT2;
SELECT * FROM DEPT3;
SELECT * FROM DEPT4;
SELECT * FROM DEPT5;
SELECT * FROM DEPT6;

--------------CREATE--복사----------------------
--IF > 1300만건 백업시 용량 부담

--데이터를 골라서 복사가 가능하다
CREATE TABLE DEPT6
AS
SELECT DCODE, DNAME  FROM DEPT2
WHERE DCODE IN(1000,1001,1002) ;


--테이블 구조만 복사 가능하다.
--데이터는 제외하고 진행
CREATE TABLE DEPT5
AS
SELECT *  FROM DEPT2
--거짓을 걸어서 테이블 생성
WHERE 1=2;

--컬럼을 골라서 백업 가능하다 
--컬럼 골라서 복사할거다.
CREATE TABLE DEPT4
AS
SELECT DCODE, DNAME  FROM DEPT2;

--컬럼 통째로 전부복사
--13건
CREATE TABLE DEPT3
AS
SELECT * FROM DEPT2;
--복사함 DEPT2를 DEPT3에 복사본 만든거다.

SELECT * FROM DEPT2;
SELECT * FROM DEPT3;
SELECT * FROM DEPT4;--ㅜㅜㅜㅜㅜㅜㅜㅜ???
SELECT * FROM DEPT5;
SELECT * FROM DEPT6;--ㅜㅜㅜ 4번 이용해서 뜨지 않음....

---------------ROLLBACK, COMMIT----------------------------
ROLLBACK;
--등록된 데이터가 사라져있음
COMMIT;
--커밋해놓으면 롤백해도 데이터가 남아있음
--------------------------------------------------------
-----------기본 CREATE---INSERT입력 행추가---------------
SELECT * FROM NEW_TABLE;
SELECT * FROM TT_02;
--한글 테이블은 모델링할때 사용
--체계가 없는 회사는 모델링을 1개만 한다.(모델링 X)
--모델링 2개(논리, 물리) 개논물아닌가..?
--논리 : 한글작명 (가독성 좋다)
--물리 : 영어작명 (호환성이 좋다)
SELECT * FROM 한글테이블;




---------------기본 CREATE-----------------------------
SELECT * FROM TT_02;
SELECT * FROM NEW_TABLE;


CREATE TABLE 한글테이블
--컬럼명 숫자 자리수 0~999, 0~3아님
( 컬럼1 NUMBER --소수점 1자리, 전체 3자리(정수2자리) 
,컬럼2 VARCHAR2(10) --10자 이하로 이름을 짓겠다. (3바이트 한글) 이름석자
,컬럼3 DATE 
);

INSERT INTO TT_02(NO) VALUES(1) ;
--데이터를 입력하겠다 tt 에있는 넘버에 값 1을
--DEFAULT값 있어야 입력가능

CREATE TABLE TT_02
--컬럼명 숫자 자리수 0~999, 0~3아님
( NO NUMBER(3,1) DEFAULT 0--소수점 1자리, 전체 3자리(정수2자리) 
,NAME VARCHAR2(10) DEFAULT 'NO NAME'--10자 이하로 이름을 짓겠다. (3바이트 한글) 이름석자
,HIREDATE DATE DEFAULT SYSDATE
);

INSERT INTO NEW_TABLE(NO) VALUES(1) ;
-- DEFAULT값 없어서 NAME, BIRTH 널값이 나옴.

CREATE TABLE NEW_TABLE
--컬럼명 숫자 자리수 0~999, 0~3아님
( NO NUMBER(3) 
,NAME VARCHAR2(10) --10자 이하로 이름을 짓겠다. (3바이트 한글) 이름석자
,BIRTH DATE
);






