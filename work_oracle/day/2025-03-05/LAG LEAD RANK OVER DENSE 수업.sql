-- 수업
------------------------------
--10 : 스미스씨


SELECT EMPNO
,ENAME
,SAL
--,RANK() OVER (ORDER BY SAL) "RAN_ASC"
--중복은 같은 숫자로 나온후 숫자 건너뛰기
,RANK() OVER (ORDER BY SAL DESC) "RAN_DESC"
--동점자 되어도 숫자 순서대로
,DENSE_RANK() OVER (ORDER BY SAL DESC) "SAL_DENSE"
--중복 무시
-- ,ROW_NUMBER : 실무에서 많이 사용
,ROW_NUMBER() OVER (ORDER BY SAL DESC) "SAL_ROW_NUMBER"

--SAL 기준으로 랭크 1등-12등
FROM EMP;


SELECT ENAME

FROM EMP
--알파벳순 정렬
ORDER BY ename;


--스미스의 순위가 나오네요
SELECT RANK('SMITH') WITHIN GROUP (ORDER BY ENAME) "R"

--오류 정렬했을때 스미스씨랑 상관이 없음.
--SELECT RANK('SMITH') WITHIN GROUP (ORDER BY HIREDATE) "R"

FROM EMP;
--알파벳순 정렬


----------------------
SELECT ENAME
,HIREDATE
,SAL
-- 뒤에서는 LEAD 였다.
-- 뒤에서는 LEAD 였다.
-- 0안넣으면 NULL 출력
, LEAD(SAL,1,0) OVER(ORDER BY HIREDATE) L1
, LEAD(SAL,2,0) OVER(ORDER BY HIREDATE) L2
, LEAD(SAL,2,3) OVER(ORDER BY HIREDATE) L2
, LEAD(SAL,2) OVER(ORDER BY HIREDATE) L3
--,1이 생략
, LEAD(SAL) OVER(ORDER BY HIREDATE) L4
, LEAD(SAL,1) OVER(ORDER BY HIREDATE) L4

, LEAD(SAL,3,'') OVER(ORDER BY HIREDATE) L5
--, LEAD(SAL,3,'A') OVER(ORDER BY HIREDATE) L5
--, LAG(SAL,-1,'') OVER(ORDER BY HIREDATE) L
FROM EMP;
--------------------------------------------------------

SELECT ENAME
,HIREDATE
,SAL
--LAG : 앞에 숫자 위치 문자는 안되는듯하다, 뒤에 숫자는 없을때 출력 
-- 뒤에서는 안되는듯하다..
-- 0안넣으면 NULL 출력
, LAG(SAL,1,0) OVER(ORDER BY HIREDATE) L1
, LAG(SAL,2,0) OVER(ORDER BY HIREDATE) L2
, LAG(SAL,2,3) OVER(ORDER BY HIREDATE) L2
, LAG(SAL,2) OVER(ORDER BY HIREDATE) L3
--,1이 생략
, LAG(SAL) OVER(ORDER BY HIREDATE) L4
, LAG(SAL,1) OVER(ORDER BY HIREDATE) L4

, LAG(SAL,3,'') OVER(ORDER BY HIREDATE) L5
--, LAG(SAL,-1,'') OVER(ORDER BY HIREDATE) L
FROM EMP;