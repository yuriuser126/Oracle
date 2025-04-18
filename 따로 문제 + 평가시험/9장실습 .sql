------9장 -VIEW제공--JOIN으로 VIEW 만들어놓고 쉽게 조회(미리 JOIN 한 틀같은거)-------------------------
-------실시간 반영 가능(병원 조회 시스템)--------------



------------------------------------------
SELECT *
FROM V_EMP2;
--------매번 조인할 필요없이 VIEW 생성-------------------
CREATE OR REPLACE VIEW V_EMP2
AS
SELECT E.EMPNO
,D.DNAME
--사원명과 부서명
FROM EMP E, DEPT D
WHERE E.DEPTNO=D.DEPTNO;
-----------------------------------------
-----------------------------------------
SELECT *
FROM V_EMP1;
------!.뷰는 인덱스 생성이 안된다.!------------------------
CREATE INDEX IDX_VIEW_EMP1
ON V_EMP1(ENAME);
-----!---VIEW 수정 한방에----!--------------
CREATE OR REPLACE VIEW V_EMP1
AS
SELECT EMPNO
,ENAME
,JOB
,HIREDATE
FROM EMP;
------------------------
SELECT *
FROM V_EMP1;
----롤백해도 생성된 뷰는 취소가 안된다---삭제-생성-롤백순-------
ROLLBACK;
---------------VIEW 삭제----------------
DROP VIEW V_EMP1;
----------------VIEW 생성----------------
CREATE VIEW V_EMP1
AS
SELECT EMPNO
,ENAME
,JOB
,HIREDATE
FROM EMP;
-----------------
SELECT EMPNO
,ENAME
,HIREDATE
FROM EMP;
-----------
SELECT *
FROM EMP;

-----------------------------------------