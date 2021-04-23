-- ����� ���� - JAVADB, 12345
-- ���� �ο� - CONNECT, RESOURCE
-- JAVADB �ȿ� ���̺� ����
-- ���̺� �� - userTBL
-- no ������(4) primary key �������Ǹ� pk_userTBL
-- username ���������ڿ�(20) not null
-- birthYear ������(4) not null
-- addr ������ ���ڿ�(15) not null
-- mobile ������ ���ڿ�(12)
CREATE TABLE userTBL(
    no NUMBER(4) constraint pk_userTBL primary key, 
    username varchar2(20) not null,
    birthYear number(4) not null,
    addr varchar2(15) not null,
    mobile varchar2(12));

CREATE SEQUENCE USER_SEQ;

-- ������ �����ϱ� - user_seq
-- userTBL �ȿ� no�� sequence ������ �����Ͽ� �׽�Ʈ ������ 5�� ���� �����ϱ�

INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'ȫ�浿',2000,'�����','01012341234');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'������',2001,'�����','01012351235');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'�����',2002,'�λ��','01012361236');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'����ȣ',2003,'��⵵','01012371237');
INSERT INTO usertbl(no,userName,birthYear,addr,mobile)
VALUES(user_seq.nextval,'���߱�',2004,'�λ��','01012381238');

commit;