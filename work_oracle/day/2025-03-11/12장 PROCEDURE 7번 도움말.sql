
--- 개발자를 위해각Procedure, Function의 사용법을 알려 주는-Function을 생성한다
---HELP FUNCTION 도움말---
---EX> 프로시저 , 함수 이름을 검색하면 알려준다---
--실행---같은창----



CREATE OR REPLACE FUNCTION help(v_module VARCHAR2)
    RETURN VARCHAR2 IS v_usage VARCHAR2(100);
BEGIN
    v_usage := v_module || '는(은) 등록되지 않은 모듈 입니다.';
    IF upper(v_module) = 'ADJUST_SAL' THEN
        v_usage := '종류 : proc, 사용법: adjust_sal(INCREASE|DECREASE,사번,증감율)';
    ELSIF upper(v_module) ='GET_ANNUAL_SAL' THEN
        v_usage := '종류 : func, 사용법: get_annual_sal(사번) ';
    ELSIF upper(v_module) ='GET_RETIRE_MONEY' THEN
    v_usage := '종류 : func, 사용법:  get_retire_money(사번) ';
        ELSIF upper(v_module) ='REMOVE_EMP' THEN
    v_usage := '종류 : proc, 사용법:  get_retire_money(사번) ';
     ELSIF upper(v_module) ='GET_HIREDATE' THEN
    v_usage := '종류 : func, 사용법:  get_hiredate (사번,형식) ';
    END IF;
    RETURN v_usage;

END;