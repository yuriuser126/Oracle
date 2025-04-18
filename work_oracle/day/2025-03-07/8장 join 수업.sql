
------------------------------------------------------

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



------------------------------------------------------------------

-- Non-Equi Join(비등가 조인) : 드문 케이스 

--둘 다 pk 없다 
--18건
SELECT * FROM customer c;

--10건
SELECT * FROM gift g;


--180건.카티션 곱 
SELECT COUNT(*) FROM customer c,gift g;

--18건 
SELECT C.GNAME "CUST_NAME"
     , TO_CHAR(C.POINT) "POINT"
     , G.GNAME "GIFT_NAME"
  FROM customer C,gift G
 WHERE C.POINT BETWEEN G.G_START AND G.G_END;

-------------------------------------------------------------------

--Cartesion Product (카티션 곱)
-- 48 = 12 * 4 , 이건 join아님
SELECT * FROM EMP ,DEPT 
order by ename; --ename 이 부서테이블에 없기 때문에 가능.
--order by emp.ename; --부서 테이블에서 ename 이 있을때는 이렇게 . 을 붙인다
--어느 테이블에 있는 앤지 알려 줘야 함



--ANSI Join (타 DB호환 가능)
SELECT * FROM EMP A join DEPT B
    on A.DEPTNO = B.DEPTNO;

--Oracle Join (오라클에서만 됨. mysql mssql보장 x)
--Equi Join (등가 조인, '='로 연결)
--12건 (사원테이블 12건 기준으로 출력)
SELECT * FROM EMP A,DEPT B
--조인 조건
WHERE A.DEPTNO = B.DEPTNO;


