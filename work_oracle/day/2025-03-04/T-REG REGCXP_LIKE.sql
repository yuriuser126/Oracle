SELECT *
  FROM t_reg

--소문자로 끝나는 행
--WHERE REGEXP_LIKE(TEXT,'[a-z]$');  
--대문자로 끝나는 행
--WHERE REGEXP_LIKE(TEXT,'[A-Z]$');  
--숫자로 끝나는 행
--WHERE REGEXP_LIKE(TEXT,'[0-9]$');  
--대문자로 시작하지 않는행
--WHERE REGEXP_LIKE(TEXT,'^[^a-z]');  
--소문자로 시작하지 않는행
--WHERE REGEXP_LIKE(TEXT,'^[^A-Z]');  
--숫자로 시작하지 않는행
--WHERE REGEXP_LIKE(TEXT,'^[^0-9]');  

--숫자 OR 소문자로 시작하지 않는 행 OR을 나타낸다.
--WHERE REGEXP_LIKE(TEXT,'^[^0-9a-z]');  
--소문자로만 된 행을 제거
--WHERE REGEXP_LIKE(TEXT,'[^a-z]');  
--소문자가 하나라도 들어가있으면 행 제외
--WHERE NOT REGEXP_LIKE(TEXT,'[a-z]');  
--대문자가 하나라도 들어가있으면 행 제외
--WHERE NOT REGEXP_LIKE(TEXT,'[A-Z]');
--소문자 , 대문자가 들어있는 행 제외
--WHERE NOT REGEXP_LIKE(TEXT,'[a-zA-Z]');  
--소문자 , 대문자, 숫자가 들어있는 행 제외
WHERE NOT REGEXP_LIKE(TEXT,'[a-zA-Z0-9]');  
--숫자가 들어있는 행 제외
--WHERE NOT REGEXP_LIKE(TEXT,'[0-9]');  
--WHERE NOT REGEXP_LIKE(TEXT,'[0-9]');  




SELECT *
  FROM t_reg
--  알파벳 소문자
  WHERE REGEXP_LIKE(TEXT,'[a-z]');
--  알파벳 대문자
--  WHERE REGEXP_LIKE(TEXT,'[A-Z]');
--  알파벳 대문자 소문자
--  WHERE REGEXP_LIKE(TEXT,'[a-zA-Z]');
--  닫기 뒤에 스페이스 눌러놈 - 알파벳 소문자로 시작하고 뒤에 공백주는것 아래것
--    WHERE REGEXP_LIKE(TEXT,'[a-z] ');
--  알파벳 소문자로 시작하고 뒤에 숫자주는것 아래것
--    WHERE REGEXP_LIKE(TEXT,'[a-z][0-9]');
--  알파벳 소문자로 시작하고 뒤에 공백 ,숫자 주는것 아래것
--    WHERE REGEXP_LIKE(TEXT,'[a-z] [0-9]');
--  알파벳 소문자로 시작하고 뒤에 공백2개 ,숫자 주는것 아래것    
--    WHERE REGEXP_LIKE(TEXT,'[a-z]  [0-9]');
--  알파벳 소문자로 시작하고 뒤에 공백3개 ,숫자 (없음 결과 안뜸)    
--    WHERE REGEXP_LIKE(TEXT,'[a-z]   [0-9]');
--공백 주기 중간에 한개든 두개든 다 나왔다.
--    WHERE REGEXP_LIKE(TEXT,'[[:space:]]');
-- 대문자 오류
--    WHERE REGEXP_LIKE(TEXT,'[[:SPACE:]]');
--    WHERE REGEXP_LIKE(TEXT,'[a-z]{1}');
--    WHERE REGEXP_LIKE(TEXT,'[a-z]{2}');
--    WHERE REGEXP_LIKE(TEXT,'[a-z]{3}');
--소문자가 연속으로 4자 이상 
--    WHERE REGEXP_LIKE(TEXT,'[a-z]{4}');
--숫자가 연속으로 4자 이상 
--WHERE REGEXP_LIKE(TEXT,'[0-9]{4}');  
--숫자가 연속으로 3자 이상 
--WHERE REGEXP_LIKE(TEXT,'[0-9]{3}');  
--WHERE REGEXP_LIKE(TEXT,'[0-9]{2}');  
--WHERE REGEXP_LIKE(TEXT,'[0-9]{1}');  
--\소문자 뒤에 숫자 한개 
--WHERE REGEXP_LIKE(TEXT,'[a-z][0-9]{1}');  
--\소문자 뒤에 숫자 두개이상 
--WHERE REGEXP_LIKE(TEXT,'[a-z][0-9]{2}');  
--첫시작이 대문자나 소문자
--WHERE REGEXP_LIKE(TEXT,'^[A-Za-z]');  
--첫시작이 숫자나 대문자
--WHERE REGEXP_LIKE(TEXT,'^[0-9A-Z]');  



SELECT NAME
,ID
--M으로 시작하고 다음에 a나o가 옴
FROM STUDENT
WHERE REGEXP_LIKE(ID,'M(a|o)') ;






