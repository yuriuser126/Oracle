
-------------
REVOKE CREATE TABLE FROM TEST;
REVOKE CREATE SESSION FROM TEST;

GRANT CREATE TABLE TO TEST;
GRANT CREATE SESSION TO TEST;

GRANT CREATE SESSION, CREATE TABLE TO TEST;
-------------------------

CREATE TABLE aaa
( NO NUMBER(3)
,NAME VARCHAR2(10)
,BIRTH DATE
);

-------------------데이터사전조회-
SELECT * from dba_sys_privs
where grantee='TEST';
----------------------
create USER test
IDENTIFIED by 1234
DEFAULT TABLESPACE storm
TEMPORARY TABLESPACE temp
QUOTA UNLIMITED on storm;
-
--데이터 테이블
alter database datafile'C:\oraclexe\app\oracle\oradata\XE\app_data_dbf' 
autoextend on next 100M  maxsize unlimited;


alter TABLESPACE storm add datafile'C:\oraclexe\app\oracle\oradata\XE\app_data2_dbf' 
size 50M;



create tablespace storm
datafile 'C:\oraclexe\app\oracle\oradata\XE\app_data_dbf'
size 100M autoextend on next 10M maxsize 500M
default storage
(
initial 10k
next 10k
MINEXTENTS 2
MAXEXTENTS 50
PCTINCREASE 50
);
