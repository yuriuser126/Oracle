--12장 수업 실습---,금액조정 시작과 끝 조건문-연봉협상---(EX > 2025-03-11)
----사원 입사일자--------VARCHAR2타입----길이설정필요--String length------------------------


CREATE OR REPLACE FUNCTION GET_HIREDATE
    (V_EMPNO NUMBER, V_FMT VARCHAR2 ) RETURN VARCHAR2 IS V_HIREDATE VARCHAR2(20);
BEGIN
        SELECT TO_CHAR(hiredate, v_fmt)
            INTO v_hiredate
            FROM EMP
            WHERE empno = v_empno;
            RETURN v_hiredate;
END;