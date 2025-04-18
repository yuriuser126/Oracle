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