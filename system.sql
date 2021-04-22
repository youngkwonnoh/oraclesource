SELECT * FROM all_users;

-- hr ������� ������ Ǯ�� ��й�ȣ�� hr�� ����
ALTER USER hr IDENTIFIED BY hr account unlock;

-- shop ����(��Ű�� ����)
CREATE USER shop IDENTIFIED BY 12345;
-- ���� �ο�
GRANT CONNECT, RESOURCE TO shop;
-- CONNECT => CREATE SESSION
-- RESOURCE => CREATE TRIGGER, CREATE SEQUENCE, CREATE PROCEDURE, CREATE TABLE...

-- VIEW ���� �ο�
GRANT CREATE VIEW TO SCOTT;

-- DBA_ : �����ͺ��̽� ���� ������ ���� ����ڸ�
SELECT * FROM DBA_TABLES;
SELECT * FROM DBA_USERS WHERE USERNAME='SCOTT';

-- ����� ����
CREATE USER TEST IDENTIFIED BY 12345;

-- user TEST lacks CREATE SESSION privilege; logon denied
-- ���� �ο� GRANT
GRANT CREATE SESSION TO TEST;

-- ����� ��й�ȣ ����
ALTER USER TEST IDENTIFIED BY 54321;

-- ����� ����
DROP USER TEST;

