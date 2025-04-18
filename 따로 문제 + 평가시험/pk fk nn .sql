---실전 테이블 만들기-
--학생과 과목 점수 테이블 세개 만들거다
commit;
rollback;

select * from student2;
select * from subject2;
select * from score2;
-------------------------------------------------------------
--옵션변경------------------------------------

--점수데이터 스코어에서 한번삭제
--스코어 조회하면 점수데이터 없음
--학생은 점수데이터 존재 과목도.
--롤백을 한다

--조회시 세개다 있다.
--학생데이터 삭제 된다.
-- 옵션을 주었더니 삭제가 되었나보다
--학생 없고 점수에도 없다 과목에는 있다.

--옵션을 걸어서 나온 결과이다.
--on delete cascade
    --on delete cascade : 부모 데이터 삭제시 자식데이터 같이삭제
    --좀비데이터를 만들지 않기위해 동시에 삭제된다.


-----------------------------------------------------------------
DELETE  from student2;
--fk걸려있어서 점수데이터가 삭제 되지 않는다. 
DELETE  from score2;
--점수 데이터는 삭제된다
--롤백하면 살아난다

--점수를 삭제를 score에서 하게되면 학생을 지울수 있다. 과목만 남고 데이터 점수가 사라짐
--롤백하면 다시 다 살아난다.
--점수 과목 학생 다 살아난다.
----------------------------------------------------------------------


INSERT INTO student2 VALUES ('A0001','AA');
INSERT INTO student2 VALUES ('B','BB');
INSERT INTO subject2 VALUES ('100','A1');
INSERT INTO score2 VALUES ('A0001',100,100,'A');
--학생아이디 과목아이디 앞 두개는 같아야 한다. 세번째 네번째 제약조건은 스코어 클래스에서 잘 봐야한다.
--INSERT INTO score2 VALUES ('111',111,100,'G');


--h(trim(' ' from stu_id) ) = 5), trim 사용해서 공백 못들어가는 함수 넣었다.
--픽스를 했는데 아이디 B 가 들어간다. NULL 값 네개가 들어갔다.
---char니까 픽스를 한다.
--varchar2 가변값
-- not null 필수값

DROP TABLE STUDENT2;
DROP TABLE score2;

-----------------------------------------------------------------------------------
create table student2
(
    stu_id char(5) CONSTRAINT student2_stu_id_pk primary key
--    자바스크립, 제이쿼리 체크를 못해주면 데이터 insert때 오류발생
--                           CONSTRAINT student2_stu_id_ck check(length(stu_id) = 5),
                           CONSTRAINT student2_stu_id_ck check(length(trim(' ' from stu_id) ) = 5),
    stu_name varchar2(10) CONSTRAINT student2_stu_name_nn not null
    
);

create table subject2
(
    sub_id number(3) CONSTRAINT subject2_sub_id_pk primary key,
    sub_name varchar2(20) CONSTRAINT subject2_sub_name_nn not null

);

--not null, unique -> pk
-- (ex> 학생 id : pk  a학생이 java과목에 100점, b학생이 java 과목에 100점 
--ex> 학생 id : pk 과목id : pk-> 학생과 과목이 중복이 아니다.

--점수만 있으면 학생이 누군지 모른다 학생이 누구 ,과목은? fk사용
create table score2
(
    stu_id char(5) CONSTRAINT score2_stu_id_nn not null,
     sub_id number(3) CONSTRAINT score2_sub_id_nn not null,
     score number(3) CONSTRAINT score2_score_nn not null,
     grade char(1) CONSTRAINT score2_grade_nn check(grade  in ('A','B','C','D','F')),
     CONSTRAINT score2_pk PRIMARY key (stu_id, sub_id), 
     
     --score2_stu_id_nn : 이름 같으면 테이블 생성이 안됨
     
--     점수, 학점을 입력하는데 없는 학생, 과목이오면 안되겠죠-> fk가 필요하다
--안걸면 좀비데이터 쌓임
--학생테이블에있는 학생아이디/서브젝트 테이블에있는 서브젝트 아이디 뒤에 레퍼런스 뒤에 지정
--    CONSTRAINT score2_fk1 FOREIGN key (stu_id) REFERENCES student2(stu_id),
--    CONSTRAINT score2_fk2 FOREIGN key (sub_id) REFERENCES subject2(sub_id)

    --on delete cascade : 부모 데이터 삭제시 자식데이터 같이삭제
    
        CONSTRAINT score2_fk1 FOREIGN key (stu_id) REFERENCES student2(stu_id) on delete cascade,
    CONSTRAINT score2_fk2 FOREIGN key (sub_id) REFERENCES subject2(sub_id) on delete cascade
--    sub_name varchar2(20) CONSTRAINTscore2_sub_name_nn not null

);

