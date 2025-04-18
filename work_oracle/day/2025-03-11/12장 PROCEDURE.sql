--12장 수업 실습---,금액조정 시작과 끝 조건문-연봉협상--\
-----사원의 급여를조정---------------------------------------
CREATE OR REPLACE PROCEDURE ADJUST_SAL
    (V_FLAG VARCHAR2, V_EMPNO NUMBER, V_PCT NUMBER) AS
BEGIN
    IF V_FLAG = 'INCREASE' THEN
        UPDATE emp SET SAL = SAL+(SAL*(V_PCT/100))
        WHERE empno = V_EMPNO;
    ELSE
        UPDATE emp SET SAL = SAL-(SAL*(V_PCT/100))
        WHERE empno = V_EMPNO;
    END IF;
END;