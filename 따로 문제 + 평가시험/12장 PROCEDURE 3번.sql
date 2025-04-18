--12장 수업 실습2---,금액조정 시작과 끝 조건문-사원 퇴직급여-----
--사원 퇴직급여 구하는(SELECT) 함수-- 구할거다 -------------
--SELECT -> RETURN 타입 IS 연봉 타입----------------
--위에 리턴하는 VSAL이 밑의 RETURN VSAL과 같다------

---아래는 삭제시-------------------------------------
DROP FUNCTION GET_ANNUAL_SAL;
-------------------------------------------------


CREATE OR REPLACE FUNCTION GET_RETIRE_MONEY
    (V_EMPNO NUMBER) RETURN NUMBER IS V_SAL NUMBER;
BEGIN
        SELECT ROUND((SAL+NVL(COMM,0)) * ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE), 0) / 12 , 0) INTO v_sal
            FROM EMP
            WHERE empno = v_empno;
            RETURN v_sal;
END;