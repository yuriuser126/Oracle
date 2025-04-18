---5장 수업



-----------------데이터를 엑셀로 ----백업진행----------------------------

--DEPT 3 마우스 오른쪽으로 익스포트(백업)
-- 복원 (임포트)한다.
--백업파일에서 진행한다.

ROLLBACK;
COMMIT;
SELECT * FROM DEPT3;

DELETE FROM DEPT3;
--커밋후 롤백해도 데이터는 삭제되고 없음 ~



---------------데이터 통째로 삭제-DROP TRUNCATE----------------------
SELECT * FROM DEPT7;
SELECT * FROM DEPT4;
ROLLBACK;

--TRUNCATE -- 테이블은 살아있음 데이터만 전부 삭제
--롤백 안됨 주의!!!
TRUNCATE TABLE DEPT7;

--DROP--테이블 자체가 사라진다 삭제된다.
--롤백 안된다!!!
DROP TABLE DEPT4;


--------------데이터 삭제 DELETE-------------------
ROLLBACK;
SELECT * FROM DEPT2;

--현재는 16건
SELECT * FROM DEPT2
WHERE DCODE >=9000 AND DCODE <=9999;

DELETE DEPT2
WHERE DCODE >=9000 AND DCODE <=9999;



--------------데이터 업데이트 UPDATE-------------------
SELECT * FROM PROFESSOR;
ROLLBACK;

--BONUS NULL->200값으로 바꾸기

UPDATE PROFESSOR
  SET BONUS = 200
WHERE POSITION = 'assistant professor';

SELECT * FROM PROFESSOR
WHERE POSITION = 'assistant professor';

