
SELECT DEPTNO NO
---부서별평균급여
--부서 3개에 대한 급여 평균이 되었다.
   ,AVG(NVL(SAL,0)) "AVL_SAL"
FROM EMP
--12건에서 9건이 되었다.
GROUP BY DEPTNO
--오류 GROUP BY 는 ALIAS 가 안됨 컬럼이름으로 안됨
--GROUP BY NO
--ORDER BY DEPTNO;
ORDER BY NO ;


---부서별 직업별 평균급여
SELECT DEPTNO
--부서번호 열두건 평균은 열두건을 각각을 평균 X 
   ,JOB
   ,AVG(NVL(SAL,0)) "AVL_SAL"
FROM EMP
--12건에서 9건이 되었다.
GROUP BY DEPTNO,JOB
ORDER BY DEPTNO;


SELECT DEPTNO
--부서번호 열두건 평균은 열두건을 각각을 평균 X 
   ,JOB
   ,SAL
FROM EMP
ORDER BY DEPTNO,JOB
--부서안에서 알파벳순 정렬
--SAL 중복된 데이터 있음 1250
 ;



SELECT DEPTNO
--부서번호 열두건 평균은 열두건을 각각을 평균 X 
   ,AVG(NVL(SAL,0)) "AVG" 
FROM EMP
--그룹함수가 아닌 DEPTNO 를 기준으로 그룹함수 AVG 출력하게한다.
GROUP BY deptno;

SELECT *
FROM EMP
ORDER BY DEPTNO;

SELECT *
FROM EMP;


SELECT COUNT (COMM) C
--급여중에 제일 많이 받는사람 5000
,MAX(SAL) S
--급여 제일 적게 800
,MIN(SAL) S
--신입
,MAX(HIREDATE) M
--제일 오래된 사람
,MIN(HIREDATE) M
--표준편차
,STDDEV(SAL) S 
--분산
,VARIANCE(SAL) V

FROM EMP;


SELECT COUNT (COMM) C
--4건 커미션 있는아이
,SUM(COMM) S
--4건 다 더하게된다면
--550
,AVG(COMM) A 
--183.3 회계나 실무에서 많이 사용한다
--550을 12로 나눈것 전체로 나눠서 계산된다!!!!
,AVG(NVL(COMM,0)) A

FROM EMP;

SELECT COUNT (*)
--12건

FROM EMP;


--GROUP 함수 3장