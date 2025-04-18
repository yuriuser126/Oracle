---- 관련된 Procedure 및 Function들을 Package로 묶는다.--as는 추가



---PACKAGE 생성(BODY)---------

CREATE OR REPLACE PACKAGE BODY emp_mgmt as
    -----사원의 급여를조정---------------------------------------
    PROCEDURE ADJUST_SAL
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
    
   --사원 연봉 구하는(SELECT) 함수-- 구할거다 -------------
        FUNCTION GET_ANNUAL_SAL
            (V_EMPNO NUMBER) RETURN NUMBER IS V_SAL NUMBER;
        BEGIN
                SELECT(SAL+NVL(COMM,0)) * 12 INTO v_sal
                    FROM EMP
                    WHERE empno = v_empno;
                    RETURN v_sal;
        END;
        
    --사원 퇴직급여 구하는(SELECT) 함수-- 구할거다 -------------
        FUNCTION GET_RETIRE_MONEY
            (V_EMPNO NUMBER) RETURN NUMBER IS V_SAL NUMBER;
        BEGIN
                SELECT ROUND((SAL+NVL(COMM,0)) * ROUND(MONTHS_BETWEEN(SYSDATE, HIREDATE), 0) / 12 , 0) INTO v_sal
                    FROM EMP
                    WHERE empno = v_empno;
                    RETURN v_sal;
        END;
    
     ----사원정보삭제--------------------------------------
        PROCEDURE REMOVE_EMP
            (V_EMPNO NUMBER) AS
        BEGIN
            DELETE FROM emp 
                WHERE empno = V_EMPNO;
            
        END;

     ----사원 입사일자--------VARCHAR2타입----길이설정필요--String length------------------------
        FUNCTION GET_HIREDATE
            (V_EMPNO NUMBER, V_FMT VARCHAR2 ) RETURN VARCHAR2 IS V_HIREDATE VARCHAR2(20);
        BEGIN
                SELECT TO_CHAR(hiredate, v_fmt)
                    INTO v_hiredate
                    FROM EMP
                    WHERE empno = v_empno;
                    RETURN v_hiredate;
        END;
END ;