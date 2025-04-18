-----11이후 실습-----서브쿼리----------------------
SELECT * FROM EMP2;

SELECT *
FROM DEPT;

SELECT DNAME
FROM DEPT2;
-------------------------------------------------------

SELECT E.NAME
--스칼라 서브쿼리(메모리에 올려놓고 사용 : 성능이 좋음)
            , (SELECT DNAME
                FROM DEPT2 D
                WHERE E.DEPTNO = D.DCODE) "DNAME"
FROM EMP2 E;
-------서브쿼리 뻥튀기됨 --부서명을 부서2번에서 가지고 온다
----조인은 전체를 다 걸고 서브쿼리는 저부분만 건다---------

---사원명과 부서명 조인------------
SELECT E.NAME
, D.DNAME
FROM EMP2 E, DEPT2 D
WHERE E.DEPTNO = D.DCODE;


-----------EXSIT----------
--40번 : 전체 행이 출력 (EXSITS 뒤에 참이면SELECT *FROM DEPT 실행됨 전부가 나옴 )-
SELECT *
FROM DEPT
--서브쿼리
WHERE EXISTS (SELECT DEPTNO
                                FROM DEPT
                                WHERE DEPTNO=&DNO);

--------------------------------------------
--40번에대한 부서정보가 나옴 부서번호, 부서명, 위치(3개의 컬럼)가 나옴
--50번은 없음

SELECT *
FROM DEPT
--서브쿼리
WHERE DEPTNO IN(SELECT DEPTNO
                                FROM DEPT
                                WHERE DEPTNO=&DNO);


--40번은 1건 50번은 없음
SELECT DEPTNO

FROM DEPT
WHERE DEPTNO=&DNO;

------자신의 직급보다 평균연봉이 같거나 많이 받는 사람들의 이름, 직급, 현재 연봉-------------------
SELECT * FROM EMP2;

SELECT NAME
, POSITION
,TO_CHAR(PAY,'$999,999,999') "SALARY"
FROM EMP2 A
--서브쿼리 조건안에 셀렉트
WHERE PAY >=(SELECT AVG(PAY)
                            FROM EMP2 B --9건
                            WHERE A.POSITION= B.POSITION); --6건 중복된 3건 없애줌
--                            WHERE POSITION);


--조건 기본은PK
-- WHERE POSITION); -> 데이터가 뻥튀기 된다 포지션이 여러개
--조건을 걸어줘야한다.
----------------------------------------------------------------------------
-
SELECT NAME
, POSITION
,TO_CHAR(PAY,'$999,999,999') "SALARY"
FROM EMP2;