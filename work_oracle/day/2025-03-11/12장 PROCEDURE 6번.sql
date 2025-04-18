
--실행---같은창=----
--스미스의 연봉이 SAL이 800->880 ---
--스미스의 연봉이 SAL이 880 -> 792--10퍼센트 빠짐-


---------------------------------------------------------
--패키지 만들어서 스미스 SAL 871.2
SELECT * FROM EMP;
EXEC emp_mgmt.adjust_sal('INCREASE',7369,10);

SELECT emp_mgmt.get_hiredate(7369,'YYYY-MM-DD hh24:mi:ss') FROM DUAL ;
--값이 없어서 00:00:00 이다.
--1980-12-17 00:00:00



-------------------------------------------------
SELECT help('adjust_sala') FROM DUAL;



SELECT empno "사번"
            , ename "성명"
            , get_annual_sal(empno) "연봉"
            , get_retire_money(empno) "퇴직금"
            , get_hiredate(empno,'YYYY-MM-DD') "입사일"
FROM EMP;



--9504 --연봉이다.
SELECT get_annual_sal(7369) FROM DUAL;
--35046 --퇴직급여
SELECT get_retire_money(7369) FROM DUAL;
--1980-12-17--날짜
SELECT get_hiredate(7369,'YYYY-MM-DD') FROM DUAL;


EXEC adjust_sal('INCREASE',7369,10);
EXEC adjust_sal('D',7369,10);


SELECT * FROM EMP;
