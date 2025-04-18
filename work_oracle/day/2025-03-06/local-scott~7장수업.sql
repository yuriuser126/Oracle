--7장 수업-
--검색속도 태운다 - 빨라진다고함
--
--pk랑 유니크는 인덱스 자동생성
------------------------------------
SELECT * FROM NEW_EMP11;
SELECT * FROM dept2;
-------------------------------------------
-----------------변경-----
alter table new_emp11
modify(loc_code CONSTRAINT new_emp11_nn not null);
------실제 제약조건은 남아있다--

-------------------추가------
alter table new_emp11
add CONSTRAINT new_emp11_uk unique(name);


--new_emp11_uk : 이름을 준다 유니크 네임컬럼에


--------------------------
CREATE TABLE NEW_EMP11
( NO NUMBER(4)  primary key
,name VARCHAR2(20) not NULL
--주민번호 , 전화번호 - 하이픈, 대시 이거 관리 안한다. 
,jumin varchar2(13) not null unique
--not null unique -> pk
--위치코드 5개만 입력한다~~~
,loc_code number(1)  check(loc_code < 5)
--10개 0~9개
--REFERENCES 참조를 하겠다.
,deptno varchar2(6) REFERENCES dept2(dcode)
);

foreign key