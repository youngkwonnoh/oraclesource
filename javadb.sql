-- 사용자 생성 - JAVADB, 12345
-- 권한 부여 - CONNECT, RESOURCE
-- JAVADB 안에 테이블 생성
-- 테이블 명 - userTBL
-- no 정수형(4) primary key 제약조건명 pk_userTBL
-- username 가변형문자열(20) not null
-- birthYear 정수형(4) not null
-- addr 가변형 문자열(15) not null
-- mobile 가변형 문자열(12)
CREATE TABLE userTBL(
    no NUMBER(4) constraint pk_userTBL primary key, 
    username varchar2(20) not null,
    birthYear number(4) not null,
    addr varchar2(15) not null,
    mobile varchar2(12));

CREATE SEQUENCE USER_SEQ;

-- 시퀀스 생성하기 - user_seq
-- userTBL 안에 no는 sequence 값으로 생성하여 테스트 데이터 5개 정도 삽입하기

INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'홍길동',2000,'서울시','01012341234');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'성춘향',2001,'서울시','01012351235');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'김수정',2002,'부산시','01012361236');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'오지호',2003,'경기도','01012371237');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'송중기',2004,'부산시','01012381238');

commit;