--데이터 테이블


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
