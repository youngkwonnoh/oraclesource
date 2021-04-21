-- JOIN
-- �����(INNER JOIN(��������), �ܼ�����)
SELECT * FROM DEPT;
SELECT * FROM EMP;

-- column ambiguously defined
SELECT EMPNO, ENAME, EMP.DEPTNO, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO;

-- ������ ��� ��Ī���� ���� �� ó��
SELECT EMPNO, ENAME, E.DEPTNO, DNAME
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO;


-- EMP ���̺��� DEPTNO�� DEPT ���̺��� DEPTNO�� ��ġ�ϴ� �������
-- �����ȣ, �̸�, �μ���ȣ, �μ��� ��ȸ(��, �޿��� 3000 �̻��� ��� ���)
SELECT EMPNO, ENAME, EMP.DEPTNO, DNAME
FROM EMP, DEPT
WHERE EMP.DEPTNO = DEPT.DEPTNO AND SAL >= 3000;

-- EMP ���̺� ��Ī�� E��, DEPT ���̺� ��Ī�� D�� �Ͽ� �޿��� 2500 �̻��̰�
-- �����ȣ�� 9999 ������ ������� ���� ���
-- EMPNO, ENAME, SAL, DEPTNO, DNAME, LOC�� ���
SELECT EMPNO, ENAME, E.SAL, D.DEPTNO, D.DNAME, D.LOC 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO AND E.SAL >= 2500 AND E.EMPNO <= 9999;


-- EMP ���̺� ��Ī�� E��, SALGRADE ���̺� ��Ī�� S�� �Ͽ� 
-- �� ����� ������ ����� �޿� ��� ������ ����ϱ�
SELECT * FROM SALGRADE;

-- �� ����
SELECT *
FROM EMP E, SALGRADE S
WHERE SAL BETWEEN S.LOSAL AND S.HISAL;

-- ��ü����(SELF JOIN) : ������ �� �� �ι�° ���̺��� �ڱ� �ڽ�
SELECT * FROM EMP;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO;

-- �ܺ�����
-- ���� �ܺ� ���� WHERE TABLE1.COL1 = TABLE2.COL(+)
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR = E2.EMPNO(+);

-- ������ �ܺ� ���� WHERE TABLE1.COL1(+) = TABLE2.COL
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1, EMP E2
WHERE E1.MGR(+) = E2.EMPNO;

-- + ��ȣ�� ���̴� �ܺ� ���� ����� ��ü �ܺ� ���� ���� �Ұ�
--SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
--FROM EMP E1, EMP E2
--WHERE E1.MGR(+) = E2.EMPNO(+);

-- ǥ�ع��� ����

-- NATURAL JOIN(�����)
SELECT E.EMPNO, E.ENAME, DEPTNO, D.DNAME
FROM EMP E NATURAL JOIN DEPT D ORDER BY DEPTNO, E.EMPNO;


-- JOIN ~ ON
SELECT E.EMPNO, E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E JOIN DEPT D ON E.DEPTNO = D.DEPTNO
ORDER BY DEPTNO, E.EMPNO;


-- ǥ�� JOIN ��
-- OUTER JOIN ~ ON
SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 LEFT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO ORDER BY E1.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 RIGHT OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO ORDER BY E1.EMPNO;

SELECT E1.EMPNO, E1.ENAME, E1.MGR, E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E1 FULL OUTER JOIN EMP E2 ON E1.MGR = E2.EMPNO ORDER BY E1.EMPNO;



-- �� �μ��� ���(�޿�), �ִ�(�޿�), �ּ�(�޿�), ������� ����ϰ���
-- ��, �μ���ȣ, �μ���, ���, �ִ�, �ּ�, ����� ���·� ���
-- EMP ���̺�� DEPT ���̺� ����
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME;

-- ǥ�� ����
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME;


-- ��� �μ������� ��� ������ �μ���ȣ, �μ���, �����ȣ, �����, ����, �޿� ���·� ���
-- EMP ���̺�� DEPT ���̺� ����
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, E.SAL 
FROM DEPT D LEFT OUTER JOIN EMP E 
ON D.DEPTNO = E.DEPTNO;


-- �޿��� 2õ �ʰ��� ������� �μ� ����, ��������� ����ϱ�(SQL ǥ�� �������� �ۼ�)
-- �μ���ȣ, �μ���, �����ȣ, �����, �޿� ������ ���
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.SAL
FROM EMP E JOIN DEPT D ON E.SAL > 2000;

-- �� ���� ���̺� ����
-- �⺻ ���
SELECT E1.EMPNO AS EMPNO_E1, E2.EMPNO AS EMPONO_E2, E3.EMPNO AS EMPNO_E3
FROM EMP E1, EMP E2, EMP E3
WHERE E1.EMPNO = E2.EMPNO AND E2.EMPNO = E3.EMPNO;

-- ǥ�� ���
SELECT E1.EMPNO AS EMPNO_E1, E2.EMPNO AS EMPONO_E2, E3.EMPNO AS EMPNO_E3
FROM EMP E1 JOIN EMP E2 ON E1.EMPNO = E2.EMPNO JOIN EMP E2 ON E3.EMPNO = E3.EMPNO;

-- ��� �μ� ������ ��� ������ �μ���ȣ, �μ���, �����ȣ, �����, 
-- ����, �Ŵ�����ȣ, �޿�, LOSAL, HISAL, GRADE, ���ӻ���� ������ ���
-- �μ���ȣ, ����̸� ������ �������� ����

-- ������ �ܺ� ����(RIGHT OUTER JOIN)
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME
FROM EMP E, DEPT D
WHERE E.DEPTNO(+) = D.DEPTNO ORDER BY DEPTNO;


SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, 
    E.MGR, E.SAL, S.LOSAL, S.HISAL, S.GRADE, 
    E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E, DEPT D, SALGRADE S, EMP E2
WHERE E.DEPTNO(+) = D.DEPTNO AND E.SAL BETWEEN S.LOSAL(+) AND S.HISAL(+)
    AND E.MGR = E2.EMPNO(+) 
ORDER BY D.DEPTNO, E.ENAME;


-- ǥ��
SELECT D.DEPTNO, D.DNAME, E.EMPNO, E.ENAME, E.JOB, 
    E.MGR, E.SAL, S.LOSAL, S.HISAL, S.GRADE, 
    E2.EMPNO AS MGR_EMPNO, E2.ENAME AS MGR_ENAME
FROM EMP E RIGHT OUTER JOIN DEPT D ON E.DEPTNO = D.DEPTNO
    LEFT OUTER JOIN SALGRADE S ON E.SAL BETWEEN S.LOSAL AND S.HISAL
    LEFT OUTER JOIN EMP E2 ON E.MGR = E2.EMPNO
ORDER BY D.DEPTNO, E.ENAME;


-- JONES ��� ����� �޿����� ���� �޿��� �޴� ��� ��ȸ
-- �������� ��� ��
SELECT SAL FROM EMP WHERE ename = 'JONES';
SELECT * FROM EMP WHERE SAL > 2975;

-- �������� ��� ��
SELECT * FROM EMP WHERE SAL > (SELECT SAL FROM EMP WHERE ename='JONES');

-- ALLEN ����� �߰����纸�� ���� �߰������� �޴� ��� ��ȸ
SELECT * FROM EMP WHERE COMM > (SELECT COMM FROM EMP WHERE ename='ALLEN');

-- WARD���� ���� �Ի��� ���
SELECT * FROM EMP WHERE hiredate < (SELECT hiredate FROM EMP WHERE ename='WARD');

-- 20�� �μ��� ���� ��� �� ��ü ����� ��� �޿����� ���� �޿��� �޴� �������
-- (�����ȣ, �����, ����, �޿�)�� �ҼӺμ�����(�μ���ȣ, �μ���, ������ġ)�� ��ȸ
SELECT EMPNO, ENAME, JOB, SAL, D.DEPTNO, D.DNAME, D.LOC
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO
AND D.DEPTNO=20 AND SAL > (SELECT AVG(SAL) FROM EMP);

-- �� �μ��� �ְ� �޿��� ������ �޿� �� ū �޿��� �޴� ��� ������ ��ȸ
-- single-row subquery returns more than one row
-- >= : ������ ��������
SELECT * FROM EMP WHERE SAL >= (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

SELECT * FROM EMP WHERE SAL IN (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- �� �μ��� �ְ� �޿��� ������ �޿� �� ū �޿��� �޴� ��� ������ ��ȸ
SELECT * FROM EMP WHERE SAL = ANY (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);
SELECT * FROM EMP WHERE SAL = SOME (SELECT MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- 30�� �μ� ������� �ִ� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ�
SELECT *
FROM EMP
WHERE SAL < (SELECT MAX(SAL) FROM EMP WHERE DEPTNO=30);

SELECT *
FROM EMP
WHERE SAL < ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);

-- ANY(SOME) : ���������� ��ȯ�� ���� ����� �� ���� ������ ���ǽ��� ����� �����
-- �ϳ��� ��ġ�ϸ� TRUE

-- 30�� �μ� ������� �ּ� �޿����� ���� �޿��� �޴� ��� ���� ����ϱ�
SELECT *
FROM EMP
WHERE SAL > ANY(SELECT SAL FROM EMP WHERE DEPTNO=30);


-- ALL : ���������� ��� ����� ���ǽĿ� �¾� �������� 
-- ���� ������ ���ǽ��� TRUE ��
SELECT *
FROM EMP
WHERE SAL < ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

SELECT *
FROM EMP
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE DEPTNO=30);

-- EXISTS : ���������� ��� ���� �ϳ� �̻� �����ϸ� ���ǽ��� ��� TRUE, �������� ������ FALSE
SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=50);

SELECT *
FROM EMP
WHERE EXISTS (SELECT DNAME FROM DEPT WHERE DEPTNO=20);

SELECT EMPNO, DEPTNO
FROM EMP
WHERE NOT EXISTS 
(SELECT DEPTNO FROM DEPT WHERE DEPTNO IN (20, 30)
AND EMP.DEPTNO = DEPT.DEPTNO);

SELECT E.JOB, E.EMPNO, E.SAL, E.DEPTNO, D.DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.JOB IN (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

SELECT E.JOB, E.EMPNO, E.SAL, E.DEPTNO, D.DNAME 
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO 
AND E.JOB = (SELECT JOB FROM EMP WHERE ENAME = 'ALLEN');

SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E, DEPT D, SALGRADE S
WHERE E.DEPTNO = D.DEPTNO AND E.SAL BETWEEN S.LOSAL AND S.HISAL 
                AND E.SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY E.SAL DESC, E.EMPNO ASC;

-- ���߿� ��������
-- �ڽ��� �μ� ������ �ְ� ������ ������ �޿��� �޴� ��� ����
SELECT *
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MAX(SAL) FROM EMP GROUP BY DEPTNO);

-- ��������(FROM ���� ����ϴ� �������� : �ζ��� ��)
-- Ư�� ���̺� ��ü �����Ͱ� �ƴ� SELECT ���� ���� �Ϻ� �����͸� ���� ������ �� �� 
-- ��Ī�� �ٿ��� ����ϴ� ���

SELECT E10.EMPNO, E10.ENAME, E10.DEPTNO, D.DNAME, D.LOC
FROM (SELECT * FROM EMP WHERE DEPTNO=10) E10,
    (SELECT * FROM DEPT) D
WHERE E10.DEPTNO = DEPTNO;

-- ��������(SELECT ���� ����ϴ� �������� : ��Į�� ��������)
SELECT EMPNO, ENAME, JOB, SAL, (SELECT GRADE
                                FROM SALGRADE
                                WHERE E.SAL BETWEEN LOSAL AND HISAL) AS SALGRADE,
                                DEPTNO,(SELECT DNAME
                                        FROM DEPT
                                        WHERE E.DEPTNO = DEPT.DEPTNO) AS DNAME
FROM EMP E;

SELECT EMPNO, ENAME, JOB, DEPTNO, DNAME, LOC
FROM EMP;

-- 10�� �μ��� �ٹ��ϴ� ��� �� 30�� �μ����� �������� �ʴ� ��å�� ����
-- ������� �������, �μ� ������ ����ϴ� SQL�� �ۼ�

SELECT E1.EMPNO, E1.ENAME, E1.JOB, E1.DEPTNO, D1.DNAME, D1.LOC
FROM EMP E1, DEPT D1
WHERE E1.DEPTNO = D1.DEPTNO AND E1.DEPTNO = 10 AND E1.JOB NOT IN (SELECT JOB FROM EMP WHERE DEPTNO=30);


-- ��å�� SALESMAN�� ������� �ְ� �޿����� ���� �޿��� �޴� �������
-- �������, �޿���� ������ ����ϴ� SQL�� �ۼ�
-- (��, ���������� Ȱ���� �� �������Լ��� ����ϴ� ����� ��������ʴ� �����
-- ���� �����ȣ�� �������� �������� �����Ͽ� ���)

-- ������� �ʴ� ���
SELECT EMPNO, ENAME, SAL, (SELECT GRADE FROM SALGRADE WHERE E1.SAL BETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP E1
WHERE SAL > (SELECT MAX(SAL) FROM EMP WHERE JOB = 'SALESMAN');


-- ����ϴ� ���
SELECT EMPNO, ENAME, SAL, (SELECT GRADE FROM SALGRADE WHERE E1.SAL BETWEEN LOSAL AND HISAL) AS GRADE
FROM EMP E1
WHERE SAL > ALL (SELECT SAL FROM EMP WHERE JOB = 'SALESMAN');




-- ������ ����
-- ���̺� ����(���̺� ������ ������ ��� ����)
CREATE TABLE DEPT_TEMP AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP;

-- INSERT ���� ����
INSERT INTO DEPT_TEMP VALUES(50, 'DATABASE', 'SEOUL');
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(50, 'DATABASE', 'SEOUL');

INSERT INTO DEPT_TEMP(DEPTNO, DNAME) VALUES(60, 'NETWORK');
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(70, 'WEB', NULL);
-- "not enough values"
INSERT INTO DEPT_TEMP VALUES(70, 'DATABASE2');

-- value larger than specified precision allowed for this column
INSERT INTO DEPT_TEMP(DEPTNO, DNAME, LOC) VALUES(800, 'DATABASE', 'SEOUL');

-- ���̺� ������ ����
CREATE TABLE EMP_TEMP AS SELECT * FROM EMP WHERE 1<>1;
SELECT * FROM EMP_TEMP;

INSERT INTO EMP_TEMP VALUES(9999, 'ȫ�浿', 'PRESODENT', NULL, '2001/01/01', 4000, NULL, 10);

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(1111, '������', 'MANAGER', NULL, '2003-01-01', 5000, 1000, 10);

INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
VALUES(2222, '����ȣ', 'MANAGER', 1111, SYSDATE, 5000, NULL, 10);

-- EMP ���̺��� SALGRADE ���̺��� �����Ͽ� �޿� ����� 1�� ������� EMP_TEMP �߰�
INSERT INTO EMP_TEMP(EMPNO, ENAME, JOB, MGR, HIREDATE, SAL, COMM, DEPTNO)
SELECT E.EMPNO, E.ENAME, E.JOB, E.MGR, E.HIREDATE, E.SAL, E.COMM, E.DEPTNO
FROM EMP E, SALGRADE S
WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE=1;

commit;

-- update : ������ ����
-- update ������ ���̺� ��
-- set ������ �� �� = ������ ��, ������ �� �� = ������ ��, ������ �� �� = ������ ��
-- where ����(�ʼ��� �ƴ�)

select * from dept_temp;

-- ���̺��� Ư�� �� ���� ��ü ����
UPDATE dept_temp 
SET LOC = 'SEOUL';

-- ���̺��� Ư�� �� ���� ���ǿ� ���� ����
UPDATE dept_temp 
SET LOC = 'SEOUL'
WHERE DEPTNO = 80;

-- COMMIT ���·� �ǵ�����.
ROLLBACK;

SELECT * FROM EMP_TEMP;
-- �޿��� 3õ ������ ����� �߰������� 50���� ����
UPDATE EMP_TEMP
SET COMM = 50
WHERE SAL <= 3000;

-- ���� ������ ����Ͽ� ������ ����(select ���� �ȿ� select ������ �� ��)
CREATE TABLE DEPT_TEMP2 AS SELECT * FROM DEPT;
SELECT * FROM DEPT_TEMP2;

UPDATE dept_temp2
SET (DNAME, LOC) = (SELECT DNAME, LOC
                    FROM DEPT
                    WHERE DEPTNO = 40)
WHERE DEPTNO = 30;
ROLLBACK;

UPDATE DEPT_TEMP2
SET LOC = 'SEOUL'
WHERE DEPTNO = (SELECT DEPTNO
                FROM DEPT_TEMP2
                WHERE DNAME = 'OPERATIONS');

-- DELETE : ���̺� �ִ� ������ ����
-- DELETE ���̺��
CREATE TABLE EMP_TEMP2 AS SELECT * FROM EMP;
SELECT * FROM EMP_TEMP2;

ROLLBACK;

-- ��ü ���� : �����ؼ� ������ ����
DELETE EMP_TEMP2;

-- �κ� ����
-- JOB�� MANAGER�� ��� ����
DELETE FROM EMP_TEMP2
WHERE JOB = 'MANAGER';

-- ���������� ����Ͽ� ������ ����
-- �޿� ����� 3����̰�, 30�� �μ��� ����� ����
DELETE FROM EMP_TEMP2
WHERE EMPNO IN (SELECT EMPNO
                FROM EMP_TEMP2 E, SALGRADE S 
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 3 AND E.DEPTNO = 30);

-- EMP_TEMP2 ���̺��� �޿��� 5õ �̻��� ��� ����
DELETE FROM EMP_TEMP2 WHERE SAL >= 5000;


-- PPT 5�� �ǽ����� 1
CREATE TABLE EXAM_EMP AS SELECT * FROM EMP;
SELECT * FROM EXAM_EMP;

CREATE TABLE EXAM_DEPT AS SELECT * FROM DEPT;
SELECT * FROM EXAM_DEPT;

CREATE TABLE EXAM_SALGRADE AS SELECT * FROM SALGRADE;
SELECT * FROM EXAM_SALGRADE;

-- PPT 5�� �ǽ����� 2

INSERT INTO EXAM_EMP VALUES(7201, 'TEST_USER1', 'MANAGER', 7788, '2016-01-02', 4500, NULL, 50);
INSERT INTO EXAM_EMP VALUES(7202, 'TEST_USER2', 'CLERK', 7201, '2016-02-21', 1800, NULL, 50);
INSERT INTO EXAM_EMP VALUES(7203, 'TEST_USER3', 'ANALYST', 7201, '2016-04-11', 3400, NULL, 60);
INSERT INTO EXAM_EMP VALUES(7204, 'TEST_USER4', 'SALESMAN', 7201, '2016-05-31', 2700, 300, 60);
INSERT INTO EXAM_EMP VALUES(7205, 'TEST_USER5', 'CLERK', 7201, '2016-07-20', 2600, NULL, 70);
INSERT INTO EXAM_EMP VALUES(7206, 'TEST_USER6', 'CLERK', 7201, '2016-09-08', 2600, NULL, 70);
INSERT INTO EXAM_EMP VALUES(7207, 'TEST_USER7', 'LECTURER', 7201, '2016-10-28', 2300, NULL, 80);
INSERT INTO EXAM_EMP VALUES(7208, 'TEST_USER8', 'STUDENT', 7201, '2018-03-09', 1200, NULL, 80);

ROLLBACK;

-- PPT 5�� �ǽ����� 3
UPDATE EXAM_EMP 
SET DEPTNO = 70 
WHERE SAL > (SELECT AVG(SAL) FROM EXAM_EMP WHERE DEPTNO=50);

-- PPT 5�� �ǽ����� 4
UPDATE EXAM_EMP
SET SAL = SAL * 1.1, DEPTNO = 80
WHERE HIREDATE > (SELECT MIN(HIREDATE) FROM EXAM_EMP WHERE DEPTNO = 60);

-- PPT 5�� �ǽ����� 5
DELETE FROM EXAM_EMP
WHERE EMPNO IN (SELECT E.EMPNO 
                FROM EXAM_EMP E, EXAM_SALGRADE S
                WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL AND S.GRADE = 5);

COMMIT;


-- Ʈ����� : �۾� ������ �ּ� ����
-- commit(�ݿ�) / rollback(���)
CREATE TABLE DEPT_TCL AS SELECT * FROM DEPT;

-- DML ����
INSERT INTO DEPT_TCL VALUES(50, 'DATABASE', 'SEOUL');
UPDATE DEPT_TCL SET LOC = 'BUSAN' WHERE DEPTNO = 40;
DELETE FROM DEPT_TCL WHERE DNAME = 'RESEARCH';
SELECT * FROM DEPT_TCL;

ROLLBACK;

COMMIT;

-- ���� : � Ȱ���� ���� �ð��̳� �Ⱓ
--       �����ͺ��̽� ������ �������� ���� �����ͺ��̽����� ���� �۾��� ������ ��
--       ������ �����ϱ� ������ ��ü �Ⱓ
SELECT * FROM DEPT_TCL;

DELETE FROM DEPT_TCL WHERE DEPTNO = 50;
COMMIT;

UPDATE DEPT_TCL SET LOC = 'SEOUL'
WHERE DEPTNO = 30;

commit;

-- ������ ���Ǿ�(DDL) : ���� ��ü�� ����, ����, ���� ��� ����
--                    Auto commit ����
-- CREATE, ALTER, DROP

-- ���̺� ����
-- CREATE TABLE ���̺��(��1 �̸� �ڷ���, ��2 �̸� �ڷ���......);

-- ���̺� �� ���� ��Ģ
-- ���ڷ� ����(����, �ѱ�, ���� 0-9, Ư������, $, _, # ����)
-- ���̺���� 30BYTE ����
-- ���� ����� ������ ���̺� �̸��� �ߺ� �ȵ�
-- Ű����� ���̺�� ��� �Ұ�(SELECT, DELETE......)

CREATE TABLE EMP_DDL(
 EMPNO NUMBER(4),
 ENAME VARCHAR2(10), -- ���� Ÿ��
 JOB VARCHAR2(9),
 MGR NUMBER(4),
 HIREDATE DATE,
 SAL NUMBER(7, 2), -- ��ü �ڸ����� 7�ڸ��ε� �� �� �Ҽ��� �ڸ����� 2�ڸ��� �ϰڴ�
 COMM NUMBER(7, 2),
 DEPT NUMBER(2)
);

-- ���� Ÿ�� : CHAR(10), NCHAR(10), VARCHAR2(10), NVARCHAR2(10)
-- N : �����ڵ�, V : Variable(����)
-- CHAR : �������� ������
-- NCHAR : �����ڵ� �������� ������
-- VARCHAR2 : �������� ������
-- NVARCHAR2 : �����ڵ� �������� ������

CREATE TABLE TEST(
    ID NUMBER(4),
    NAME VARCHAR2(3));

DESC TEST;

-- value too large for column "SCOTT"."TEST"."NAME" (actual: 9, maximum: 3)
INSERT INTO TEST(ID, NAME) VALUES(10, 'ȫ�浿');
INSERT INTO TEST(ID, NAME) VALUES(10, 'LKG');

CREATE TABLE TEST2(
    ID NUMBER(4),
    NAME NCHAR(3)); -- ���� �״���� ������ �ǹ�(�������̸� ����Ѵ�.)
    
INSERT INTO TEST2(ID, NAME) VALUES(10, 'ȫ�浿');
INSERT INTO TEST2(ID, NAME) VALUES(20, '��');

SELECT * FROM TEST2 WHERE NAME='��';

CREATE TABLE TEST3(
    ID NUMBER(4),
    NAME NVARCHAR2(3)); -- ���� �״���� ������ �ǹ�(�������̸� ����Ѵ�.)
    
INSERT INTO TEST3(ID, NAME) VALUES(10, 'ȫ�浿');
INSERT INTO TEST3(ID, NAME) VALUES(20, '��');

CREATE TABLE DEPT_DDL AS SELECT * FROM DEPT;

CREATE TABLE DEPT_DDL_30 AS SELECT * FROM DEPT WHERE DEPTNO = 30;

CREATE TABLE DEPT_DDL2 AS SELECT * FROM DEPT WHERE 1<>1;

-- DROP : ����
DROP TABLE DEPT_DDL2;

-- ALTER : ����

CREATE TABLE EMP_ALTER AS SELECT * FROM EMP;
SELECT * FROM EMP_ALTER;

-- ���̺� �÷� �߰��ϱ� : ADD
ALTER TABLE EMP_ALTER ADD HP VARCHAR2(20);

-- �� �̸� �����ϱ� : RENAME
ALTER TABLE EMP_ALTER RENAME COLUMN HP TO TEL;

-- �� �ڷ����̳� ���̺����ϱ�
ALTER TABLE EMP_ALTER MODIFY EMPNO NUMBER(5);
DESC EMP_ALTER;

-- Ư�� �� ����
ALTER TABLE EMP_ALTER DROP COLUMN TEL;

-- ���̺��� �̸� ���� : RENAME
RENAME EMP_ALTER TO EMP_RENAME;
DESC EMP_RENAME;

-- PPT 6�� �ǽ�1
CREATE TABLE MEMBER(
    ID CHAR(8),
    NAME VARCHAR2(10), -- NVARCHAR2(3)
    ADDR VARCHAR2(50), -- NVARCHAR2(20)
    NATION NCHAR(4),
    EMAIL VARCHAR2(50),
    AGE NUMBER(7, 2)
);

-- PPT 6�� �ǽ�2 (1)
ALTER TABLE MEMBER ADD BIGO VARCHAR2(20);
-- PPT 6�� �ǽ�2 (2)
ALTER TABLE MEMBER MODIFY BIGO VARCHAR2(30);
-- PPT 6�� �ǽ�2 (3)
ALTER TABLE MEMBER RENAME COLUMN BIGO TO REMARK;
-- PPT 6�� �ǽ�3 (5)
UPDATE MEMBER SET REMARK=' ';
-- PPT 6�� �ǽ�3 (6)
DROP TABLE MEMBER;

-- PPT 6�� �ǽ�3 (4)
INSERT INTO MEMBER(ID, NAME, ADDR, NATION, EMAIL, AGE) 
            VALUES('hong1243', 'ȫ�浿', '����� ���α� ������', '���ѹα�', 'hong123@naver.com', 25);

DESC MEMBER;
SELECT * FROM MEMBER;