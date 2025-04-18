
--20건  STUDNO: PK   PROFNO     DEPTNO1
SELECT * FROM STUDENT S;

--16건  STUDNO:없음  PROFNO: PK DEPTNO
SELECT * FROM PROFESSOR P;

-----

--320건. 이거는 원한 데이터가 아님 ! 
SELECT COUNT(*) FROM STUDENT S,PROFESSOR P;

--조인 후보 1. DEPTNO 2.PROFNO 

--DEPTNO JOIN하니까 50건이 나왔음.뭔가 이상하다
SELECT * FROM STUDENT S,PROFESSOR P
WHERE S.DEPTNO1=P.DEPTNO;

--PROFNO JOIN 하니까 15건 나왔음.
--20,16 조인인데? 15가 나왔다 **학생 테이블에 PROFNO NULL이 있어서 5건 사라진것
-- 등가조인 = INNER JOIN (이너 조인 )
SELECT * FROM STUDENT S,PROFESSOR P
WHERE S.PROFNO=P.PROFNO;

SELECT S.NAME , P.NAME
  FROM STUDENT S, PROFESSOR P
 WHERE S.PROFNO=P.PROFNO;

--ANSI INNER JOIN
SELECT S.NAME , P.NAME
  FROM STUDENT S JOIN PROFESSOR P
    ON S.PROFNO=P.PROFNO;

--교수가 없더라도 학생 이름이 보이는것 << 더 선호
--EX) 책이 다 팔렸다 : 재고 0 인데 주문과 책을 조인했다 할때
-- 재고 0인 애는 NULL 로 아예 안보이게 되어버릴수도있다
-- 그냥 등가조인만 하면 재고가 없는 애를 보이게 할 수 없음
-- =>OUTER JOIN 사용 (아우터 조인)

--LEFT OUTER JOIN:
SELECT S.NAME, P.NAME
  FROM STUDENT S, PROFESSOR P
 WHERE S.PROFNO=P.PROFNO(+);
--뒤에 (+)해서 NULL값까지 20건 나왔다

--RIGHT OUTER JOIN: NULL이 왼쪽으로 나온다. 반대로 감(교수먼저 나오고, 없으면 NULL)
SELECT S.NAME, P.NAME
  FROM STUDENT S, PROFESSOR P
 WHERE S.PROFNO(+)=P.PROFNO;

---
--안시 조인을 OUTER JOIN으로 해보자 
--ANSI LEFT OUTER JOIN
SELECT S.NAME, P.NAME
  FROM STUDENT S LEFT OUTER JOIN PROFESSOR P
    ON S.PROFNO=P.PROFNO;
    
--ANSI RIGHT OUTER JOIN
SELECT S.NAME, P.NAME
  FROM STUDENT S RIGHT OUTER JOIN PROFESSOR P
    ON S.PROFNO=P.PROFNO;
