select * from all_users;

-- hr ������� ������ Ǯ�� ��й�ȣ�� hr�� ����
ALTER USER hr IDENTIFIED BY hr account unlock;

-- shop ����(��Ű�� ����)
CREATE USER shop IDENTIFIED BY 12345;
-- ���� �ο�
GRANT CONNECT, RESOURCE TO shop;