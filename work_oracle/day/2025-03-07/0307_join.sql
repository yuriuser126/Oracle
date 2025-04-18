--Cartesion Product (카티션 곱)
-- 48 = 12 * 4 , 이건 join아님
SELECT * FROM EMP ,DEPT 
order by ename; --ename 이 부서테이블에 없기 때문에 가능.
--order by emp.ename; --부서 테이블에서 ename 이 있을때는 이렇게 . 을 붙인다
--어느 테이블에 있는 앤지 알려 줘야 함



--ANSI Join (타 DB호환 가능)
SELECT * FROM EMP A join DEPT B
    on A.DEPTNO = B.DEPTNO;

--Oracle Join (오라클에서만 됨. mysql mssql보장 x)
--Equi Join (등가 조인, '='로 연결)
--12건 (사원테이블 12건 기준으로 출력)
SELECT * FROM EMP A,DEPT B
--조인 조건
WHERE A.DEPTNO = B.DEPTNO;


