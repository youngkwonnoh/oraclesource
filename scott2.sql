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
-- EMP ���̺��� DEPT ���̺� ����
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM EMP E, DEPT D
WHERE E.DEPTNO = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME;

-- ǥ�� ����
SELECT D.DEPTNO, D.DNAME, FLOOR(AVG(E.SAL)), MAX(E.SAL), MIN(E.SAL), COUNT(*)
FROM EMP E JOIN DEPT D
ON E.DEPTNO = D.DEPTNO GROUP BY D.DEPTNO, D.DNAME;


-- ��� �μ������� ��� ������ �μ���ȣ, �μ���, �����ȣ, �����, ����, �޿� ���·� ���
-- EMP ���̺��� DEPT ���̺� ����
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
