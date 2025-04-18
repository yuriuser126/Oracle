--------10장----SUNONYM----------------------
SELECT * FROM user_synonyms;
--스캇계정에 있는 EMP사전이다.
CREATE SYNONYM E FOR EMP;
---- 권한 줘야한다.----
SELECT * FROM E;
-----삭제 DROP E까지만---------------------
DROP SYNONYM E ;