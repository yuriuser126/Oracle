--12장 수업 실습2---,금액조정 시작과 끝 조건문-연봉협상-----
---사원의 급여를조정 2번 프로시저-----------------------
--사원 연봉 구하는(SELECT) 함수-- 구할거다 -------------
--SELECT -> RETURN 타입 IS 연봉 타입----------------
--위에 리턴하는 VSAL이 밑의 RETURN VSAL과 같다------

---아래는 삭제시-------------------------------------
DROP FUNCTION GET_ANNUAL_SAL;
-------------------------------------------------


CREATE OR REPLACE FUNCTION GET_ANNUAL_SAL
    (V_EMPNO NUMBER) RETURN NUMBER IS V_SAL NUMBER;
BEGIN
        SELECT(SAL+NVL(COMM,0)) * 12 INTO v_sal
            FROM EMP
            WHERE empno = v_empno;
            RETURN v_sal;
END;