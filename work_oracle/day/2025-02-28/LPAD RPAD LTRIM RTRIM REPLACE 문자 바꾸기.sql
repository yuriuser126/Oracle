
--A : 딱 맞춤열에
--빈자리 왼쪽에 별채움
SELECT NAME 
,ID
,LPAD (ID,10,'*')
,RPAD (ID,10,'*')  
,LTRIM (ID,'M') A --잘라내기 오
,RTRIM (ID,'n') A --잘라내기 왼
,REPLACE (ID,SUBSTR(ID,1,2),'**') A --잘라내기 왼 
FROM STUDENT
WHERE deptno1 = 201;

--빈자리 오른쪽에 별채움
