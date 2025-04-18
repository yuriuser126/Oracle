--6장수업
SELECT * FROM professor;
SELECT * FROM EMP;
SELECT * FROM STUDENT;
SELECT * FROM FRUIT;
SELECT * FROM MEMBER;
SELECT * FROM CUSTOMER;

ROLLBACK;
COMMIT;
-------------------------------------
SELECT * FROM EMP01;



-------------인덱스 삭제------------------------
DROP INDEX index_emp01_ename;

-------------인덱스 걸기------------------------
CREATE INDEX index_emp01_ename
on emp01(ename);

-->>>속도가 20배 빨라졌다. ----

-------'aaa'찾기시간 -0.536------------------
SELECT EMPNO, ENAME
FROM EMP01
WHERE ENAME='aaa';
---------------새로운 행 추가----------------------
INSERT INTO EMP01 (EMPNO, ENAME) VALUES(111,'aaa');

--데이터 뻥튀기 해서 속도테스트------
INSERT INTO EMP01
SELECT * FROM EMP01;
----------------------------------

SELECT COUNT(*) 
FROM EMP01;


CREATE TABLE EMP01
AS
SELECT * 
FROM EMP;
-------------------------------------
SELECT ROWID
FROM EMP;