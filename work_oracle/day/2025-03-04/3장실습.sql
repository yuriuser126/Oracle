
SELECT * FROM CAL;
SELECT ASCII('29' ) FROM DUAL; --50
SELECT ASCII('8' ) FROM DUAL; --56


SELECT MAX(DECODE(DAY,'SUN',DAYNO)) SUN
                ,MAX(DECODE(DAY,'MON',DAYNO)) MON
                ,MAX(DECODE(DAY,'TUE',DAYNO)) TUE
                ,MAX(DECODE(DAY,'WED',DAYNO)) WED
                ,MAX(DECODE(DAY,'THU',DAYNO)) THU
                ,MAX(DECODE(DAY,'FRI',DAYNO)) FRI
                ,MAX(DECODE(DAY,'SAT',DAYNO)) SAT
                FROM CAL
GROUP BY WEEKNO 
ORDER BY WEEKNO;


SELECT MAX(DECODE(DAY,'SUN',DAYNO)) SUN
                ,MAX(DECODE(DAY,'MON',DAYNO)) MON
                ,MAX(DECODE(DAY,'TUE',DAYNO)) TUE
                ,MAX(DECODE(DAY,'WED',DAYNO)) WED
                ,MAX(DECODE(DAY,'THU',DAYNO)) THU
                ,MAX(DECODE(DAY,'FRI',DAYNO)) FRI
                ,MAX(DECODE(DAY,'SAT',DAYNO)) SAT
                FROM CAL
                GROUP BY WEEKNO;
                


SELECT MAX(DECODE(DAY,'SUN',DAYNO)) SUN
                ,MAX(DECODE(DAY,'MON',DAYNO)) MON
                ,MAX(DECODE(DAY,'TUE',DAYNO)) TUE
                ,MAX(DECODE(DAY,'WED',DAYNO)) WED
                ,MAX(DECODE(DAY,'THU',DAYNO)) THU
                ,MAX(DECODE(DAY,'FRI',DAYNO)) FRI
                ,MAX(DECODE(DAY,'SAT',DAYNO)) SAT
                FROM CAL;


--새로운 시트 시작 CAL TABLE 실습
---3장 1번 혼자
SELECT (DECODE(DAY,'SUN',DAYNO)) SUN
                ,(DECODE(DAY,'MON',DAYNO)) MON
                ,(DECODE(DAY,'TUE',DAYNO)) TUE
                ,(DECODE(DAY,'WED',DAYNO)) WED
                ,(DECODE(DAY,'THU',DAYNO)) THU
                ,(DECODE(DAY,'FRI',DAYNO)) FRI
                ,(DECODE(DAY,'SAT',DAYNO)) SAT
                
                FROM CAL
                GROUP BY WEEKNO,DAY,DAYNO HAVING MAX(DAYNO) <=5 
                ORDER BY DAYNO ;

---3장 1번 혼자




---3장 0번 강사님
---3장 0번 혼자
SELECT DEPTNO
   ,AVG(NVL(SAL,0)) "AVL_SAL"
   ,ROUND(AVG(NVL(SAL,0)),2) "AVL_SAL"
FROM EMP
--WHERE은 오류가 난다.
--HAVING 도 컬럼이름 안됨 
--12건에서 9건이 되었다.
GROUP BY DEPTNO HAVING AVG(NVL(SAL,0)) >2000 ;


--3장 실습