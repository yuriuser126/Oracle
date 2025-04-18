--12장 수업 실습---,금액조정 시작과 끝 조건문-연봉협상---
----사원정보삭제--------------------------------------

CREATE OR REPLACE PROCEDURE REMOVE_EMP
    (V_EMPNO NUMBER) AS
BEGIN
    DELETE FROM emp 
        WHERE empno = V_EMPNO;
    
END;