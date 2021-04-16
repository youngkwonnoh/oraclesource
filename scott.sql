-- scott ������ ��� ���̺� ��ȸ
select * from tab;

-- bonus ���̺��� ��� ���� ��ȸ
select * from bonus;

-- emp ���̺��� ��� ���� ��ȸ
select * from emp;

-- emp ���̺��� empno, ename ��ȸ
select empno, ename from emp;

-- emp ���̺��� empno, job, hiredate ��ȸ
select empno, job, hiredate from emp;

-- �ߺ��� �� ���� : DISTINCT
select deptno from emp;
select DISTINCT deptno from emp;

-- ��Ī
select empno from emp;
select empno as �����ȣ from emp;
select empno �����ȣ from emp;
select empno "�����ȣ" from emp;
select empno as "�����ȣ" from emp;

SELECT enam, sal, sal*12 + comm, comm FROM emp;
SELECT enam, sal, sal*12 + comm AS ����, comm FROM emp;

-- ename(�����), job(��å), ��Ī�� ���� �� emp ��ȸ
select ename �����, job "�� å" from emp;
select ename as �����, job as "�� å" from emp;

-- ���� : ORDER BY �����Ϸ��� �� �̸� ���� �ɼ�(ASC(��������), DESC(��������))
-- ENAME, SAL ��ȸ(SAL ��������)
select ename, sal from emp order by sal DESC;
select ename, sal from emp order by sal;

-- ��ü ������ ��ȸ �� SAL ��������
SELECT * FROM emp ORDER BY sal DESC;

-- EMPNO, ENAME, JOB�� ��ȸ�� �� EMPNO ��������
SELECT EMPNO, ENAME, JOB FROM emp ORDER BY EMPNO;
SELECT EMPNO, ENAME, JOB FROM emp ORDER BY EMPNO ASC;

-- �μ���ȣ�� ���������� �޿��� �������� �����ϱ�
select * from emp Order BY deptno ASC, sal DESC;

-- ��ȸ�� ���̺��� EMP ���̺��̸� ��� ���� ���
-- ��µǴ� ���� ��Ī�� ������ ���� ����
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : EMPLOYEE_NAME
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO
-- �μ� ��ȣ�� �������� ������������ ����
-- �μ� ��ȣ�� ���ٸ� ��� �̸��� �������� �������� ����


SELECT 
EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, 
MGR AS EMPLOYEE_NAME, SAL AS SALARY, COMM AS COMMISSION, 
DEPTNO AS DEPARTMENT_NO  
FROM EMP ORDER BY DEPTNO DESC, ENAME ASC;

-- WHERE : ���ǿ� ���缭 ��ȸ

-- �μ���ȣ�� 30���� ��� ��ȸ
SELECT * FROM emp WHERE deptno = 30;

-- �����ȣ�� 7782�� ��� ���� ��ȸ
SELECT * FROM emp WHERE empno = 7782;

-- �μ���ȣ�� 30�̰� ��� ��å�� SALESMAN�� ��� ��ȸ
SELECT * FROM emp WHERE DEPTNO = 30 AND job = 'SALESMAN';

-- �μ���ȣ�� 30�̰ų� �����å�� CLERK�� ��� ��ȸ
SELECT * FROM emp WHERE DEPTNO = 30 AND job = 'CLERKL';


-- ��������� : * / + -

-- SAL*12�� ���� 36000�� ��� ��ȸ
SELECT * FROM EMP WHERE SAL * 12 = 36000;

-- SAL�� ���� 3000 �̻��� ��� ��ȸ
SELECT * FROM EMP WHERE SAL >= 3000;

-- �޿��� 2500�̰�, ������ ANALYST�� ��� ��ȸ
SELECT * FROM EMP WHERE SAL >= 2500 AND JOB = 'ANALYST';

-- ��� �̸��� ù���ڰ� F�� ���ų� ������ �͸� ��ȸ(F, G, H, I ~~)
SELECT * FROM EMP WHERE ENAME >= 'F';

-- ������ MANAGER, SALESMAN, CLERK�� ��� ��ȸ
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- � �� ������( = (����), !=, <>, ^= )
-- SAL��; 3000�� �ƴ� ������� ��ȸ
SELECT * FROM EMP WHERE SAL != 3000;
SELECT * FROM EMP WHERE SAL ^= 3000;
SELECT * FROM EMP WHERE SAL <> 3000;

-- �� ���� ������ : NOT
SELECT * FROM EMP WHERE NOT SAL = 3000;

-- IN�� =�� ���� �����̴�.
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM EMP WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');

-- NOT IN
SELECT * FROM EMP WHERE JOB != 'MANAGER' AND JOB ^= 'SALESMAN' AND JOB <> 'CLERK';
SELECT * FROM EMP WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');

-- �μ���ȣ�� 10, 20 ��� ��ȸ(IN)
SELECT * FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 20;
SELECT * FROM EMP WHERE DEPTNO IN(10, 20);

-- BETWEEN A AND B : Ư�� ������ �����͸� ��ȸ
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- SAL 2000�̻� ~ 3000���ϰ� �ƴ� ��� ��ȸ
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

-- LIKE �����ڿ� ���ϵ� ī��
-- ���ϵ� ī�� : _(� ���ڵ� �� ���� ���ڸ� �ǹ�), %(���̿� ������� ��� ���ڸ� �ǹ�)

-- ��� �̸��� S�� �����ϴ� ��� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

-- ��� �̸��� �ι�° ���ڰ� L�� ��� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '_L%';

-- ��� �̸��� AM�� ���ԵǾ� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';

-- ��� �̸��� AM�� ���ԵǾ� ���� ���� ���
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';

-- IS NULL
-- NULL : ���� �������� ����/ �ش���� ���� / Ȯ������ ���� ��
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE MGR IS NULL;
SELECT * FROM EMP WHERE NOT MGR IS NULL;
SELECT * FROM EMP WHERE MGR IS NOT NULL;

-- ���� ������ : ������ - UNION(�ߺ��� ���� ���ŵ�), UNION ALL, ������ - MINUS, ������ - INTERSECT

-- 10�� �μ��� 20�� �μ� ��ȸ
SELECT * FROM EMP WHERE DEPTNO = 10
UNION
SELECT * FROM EMP WHERE DEPTNO = 20;

SELECT * FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT * FROM EMP WHERE DEPTNO = 20;

SELECT * FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP
MINUS
SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP
INTERSECT
SELECT * FROM EMP WHERE DEPTNO = 10;

-- 20��, 30�� �μ��� �ٹ��ϰ� �ִ� ��� �� �޿��� 2000 �ʰ��� ����� ���� �����ڸ�
-- ����ؼ� ��ȸ�ϱ�
SELECT * FROM EMP WHERE DEPTNO IN(20,30)
INTERSECT
SELECT * FROM EMP WHERE SAL > 2000;

SELECT * FROM EMP WHERE SAL > 2000
MINUS
SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP WHERE DEPTNO = 20 AND SAL > 2000 
UNION
SELECT * FROM EMP WHERE DEPTNO = 30 AND SAL > 2000 ;

-- �Լ�
-- �����Լ� : ����Ŭ���� �⺻���� �����ϴ� �Լ�
-- ����� ���� �Լ�

-- ���� �Լ� 1) ��ҹ���
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

-- ORACLE, oracle, Oracle => �Է°��� �پ��ϴ�.
-- WHERE LOWER(TITLE) LIKE '%oracle%'

-- ���� �Լ� 2) ����
-- LENGTHB : ����Ʈ �� Ȯ��
SELECT LENGTH('�ѱ�'), LENGTHB('�ѱ�') FROM DUAL;

-- ENAME ����
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- ENAME ���̰� 5 �̻��� ��� ��ȸ
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

-- ���� �Լ� 3) ���ڿ� ����
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5) FROM EMP;

-- EMP ���̺��� ��� ��� �̸��� ����° ���ں��� ������ ����ϱ�
SELECT ENAME, SUBSTR(ENAME, 3) FROM EMP;

-- ���� �Լ� 4) Ư�� ������ ��ġ
SELECT INSTR('HELLO, ORACLE!', 'L') AS ù��°, INSTR('HELLO, ORACLE!', 'L', 5) AS �ι�°,
INSTR('HELLO, ORACLE!', 'L', 2, 2) AS ����° FROM DUAL;

SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�') FROM DUAL;
SELECT INSTR('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;
SELECT INSTRB('�̰��� Oracle�̴�. �̰͵� ����Ŭ�̴�', '�̰�', 2) FROM DUAL;

-- ��� �̸��� S�� �ִ� ��� ��ȸ
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') > 0;

-- ���� �Լ� 5) ���ڿ� ��ü
SELECT REPLACE('�̰��� Oracle�̴�', '�̰�', 'This is') FROM DUAL;

-- 010-1234-5678, 010 1234 5678, 01012345678
SELECT '010-1234-5678', REPLACE('010-1234-5678', '-', ' '), REPLACE('010-1234-5678', '-', '') FROM DUAL;

-- ���� �Լ� 6) ���ڿ� ����
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(':', ENAME))
FROM EMP WHERE ENAME = 'SMITH';

--CONCAT() ==  ||
SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
FROM EMP WHERE ENAME = 'SMITH';

-- ���� �Լ� 7) Ư�� ���� ���� - TRIM, LTRIM, RTRIM
SELECT '  �̰���   ', TRIM('   �̰���   ') FROM DUAL;

SELECT '[' || TRIM('  __ORACLE__  ') || ']' as TRIM,
'[' || LTRIM('  __ORACLE__  ') || ']' as LTRIM,
'[' || RTRIM('  __ORACLE__  ') || ']' as RTRIM
FROM DUAL;

-- ���� �Լ� 8) ���ڿ��� �ݴ�� ó��
SELECT REVERSE('ORACLE') FROM DUAL;

-- �����Լ� : �ݿø� / �ø� / ���� / ������ ��
-- �ݿø�
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678, 0) AS ROUND0, 
ROUND(1234.5678, 1) AS ROUND1, ROUND(1234.5678, 2) AS ROUND2,
ROUND(1234.5678, -1) AS ROUND_MINUS1, ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- ����
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678, 0) AS TRUNC0, 
TRUNC(1234.5678, 1) AS TRUNC1, TRUNC(1234.5678, 2) AS TRUNC2,
TRUNC(1234.5678, -1) AS TRUNC_MINUS1, TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- ������ ���ڿ� ���� ����� ������ ã�� CEIL(ū ����), FLOOR(���� ����)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

-- ������
SELECT MOD(15, 6), MOD(10, 2), MOD(11, 2)
FROM DUAL;

-- ��¥ �Լ� : SYSDATE(����Ŭ ������ ��ġ�� OS ���� ��¥�� �ð�)
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;

-- �� ���� ������ ��¥ ���ϱ� : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;

-- �Ի� 10�ֳ��� �Ǵ� ��¥ ���ϱ�
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) FROM EMP;

-- ���� ��¥ �������� �Ի� 38�� �̸��� ��� ��ȸ
SELECT * FROM EMP WHERE ADD_MONTHS(HIREDATE, 540) > SYSDATE;

-- �� ��¥ �ڽ����� ���� : MONTHS_BETWEEN
SELECT * FROM EMP WHERE MONTHS_BETWEEN(SYSDATE, HIREDATE) < 540;

SELECT EMPNO, ENAME, HIREDATE, SYSDATE, MONTHS_BETWEEN(HIREDATE, SYSDATE) AS MONTHS,
MONTHS_BETWEEN(SYSDATE, HIREDATE) AS MONTHS2, TRUNC(MONTHS_BETWEEN(SYSDATE, HIREDATE)) AS MONTH3
FROM EMP;

-- ���ƿ��� ����(NEXT_DAY), ���� ������ ��¥(LAST_DAY)
SELECT SYSDATE, NEXT_DAY(SYSDATE, '������'), LAST_DAY(SYSDATE) FROM DUAL;

-- �ڷ��� ��ȯ �Լ�
-- 1) TO_CHAR() : ��¥, ���� �����͸� ���ڷ� ��ȯ
SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD') AS ���糯¥ FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'MM') AS ����� FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'MON') AS ����� FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'DD') AS �������� FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'DAY') AS �������� FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH:MI:SS') AS ����ð� FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH12:MI:SS') AS ����ð� FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'HH24:MI:SS') AS ����ð� FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'HH:MI:SS PM') AS ����ð� FROM DUAL;

SELECT TO_CHAR(SYSDATE, 'YYYY/MM/DD HH:MI:SS PM') AS ����ð� FROM DUAL;

-- TO_NUMBER() : ���ڸ� ���� ������ �������� ��ȯ
SELECT 1300-'1500', '1300'+1500 FROM DUAL;

SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM DUAL;

-- invalid number
-- SELECT 1300-'1500', '1300'+1500 FROM DUAL;
-- SELECT 1300-TO_NUMBER('1500'), TO_NUMBER('1300')+1500 FROM DUAL;
-- ,�� ���� �ʴ´�.
SELECT 1300-TO_NUMBER('1,500', '999,999'), TO_NUMBER('1,300', '999,999')+1500 FROM DUAL;

-- TO_DATE() : ���� �����͸� ��¥�� �����ͷ� ��ȯ
SELECT TO_DATE('2021-04-16') AS TDOATE1, TO_DATE('20210416') AS TODATE2 FROM DUAL;
SELECT TO_DATE('2021-04-16') - TO_DATE('2021-04-12') FROM DUAL;

-- ��ó�� �Լ� : NVL(), NVL2(), 
SELECT EMPNO, ENAME, SAL, COMM, SAL + COMM FROM EMP;
SELECT EMPNO, ENAME, SAL, COMM, SAL + NVL(COMM, 0) FROM EMP;

-- NVL2(�� ��, ���� �ƴ� ��� ��ȯ�� ��, ���� ��� ��ȯ�� ��)
SELECT EMPNO, ENAME, SAL, COMM, 
    NVL2(COMM, 'O', 'X'), SAL + NVL2(COMM, SAL * 12 + COMM, SAL * 12)
FROM EMP;

-- DECODE �Լ�
SELECT EMPNO, ENAME, JOB, SAL, 
    DECODE(JOB, 'MANAGER', SAL * 1.1, 
                'SALESMAN', SAL * 1.05, 
                'ANALYST', SAL, SAL * 1.03) 
    AS UPSAL
FROM EMP;

-- CASE(DECODE ���뼺�� ����)
SELECT EMPNO, ENAME, JOB, SAL, 
    CASE JOB 
        WHEN 'MANAGER' THEN SAL * 1.1 
        WHEN 'SALESMAN' THEN SAL * 1.05 
        WHEN 'ANALYST' THEN SAL ELSE SAL * 1.03 
        END AS UPSAL
FROM EMP;

SELECT EMPNO, ENAME, JOB, SAL, 
    CASE
        WHEN COMM IS NULL THEN '�ش���� ����'
        WHEN COMM = 0 THEN '���� ����'
        WHEN COMM >0 THEN '���� : ' || COMM
    END AS COMM_TEXT FROM EMP;


-- �ǽ�����(ORACLE PPT 18������) 1��
SELECT EMPNO, ENAME, SAL, 
    TRUNC(SAL/21.5, 2) AS DAY_PAY, 
    ROUND(SAL/(21.5*8), 1) AS TIME_PAY 
FROM EMP;


-- �ǽ����� 2��
SELECT EMPNO, ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '������') AS R_JOB,
-- NVL(COMM, 'N/A') AS COMM FROM EMP;
-- invalid number�� �߸鼭 �ȵ�.
-- ���� �迭�� ���ڰ� ����ִµ� N/A��� ���ڸ� �������ؼ� ������ ��
-- 'N/A'�� �����̹Ƿ� COMM�� ���ڷ� �ٲ���Ѵ�.
    NVL(TO_CHAR(COMM), 'N/A') AS COMM 
FROM EMP;

-- NVL2 ����
SELECT EMPNO, ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '������') AS R_JOB,
    NVL2(COMM, TO_CHAR(COMM), 'N/A') AS COMM 
FROM EMP;

-- CASE ����
SELECT EMPNO, ENAME, HIREDATE, NEXT_DAY(ADD_MONTHS(HIREDATE, 3), '������') AS R_JOB,
    CASE
        WHEN COMM IS NULL THEN 'N/A'
        WHEN COMM IS NOT NULL THEN TO_CHAR(COMM)
    END AS COMM
FROM EMP;


-- �ǽ����� 3��
SELECT EMPNO, ENAME, MGR, 
    DECODE(SUBSTR(TO_CHAR(MGR), 1, 2),
        NULL, '0000',
        '75', '5555',
        '76', '6666',
        '77', '7777',
        '78', '8888',
        SUBSTR(TO_CHAR(MGR), 1))
    AS CHG_MGR 
FROM EMP;

-- CASE ����
SELECT EMPNO, ENAME, MGR, 
    CASE 
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '75' THEN '5555'
        WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '76' THEN '6666'
        WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '77' THEN '7777'
        WHEN SUBSTR(TO_CHAR(MGR), 1, 2) = '78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR 
FROM EMP;


-- ������ �Լ� : SUM, COUNT, MAX, MIN
SELECT SUM(COMM) FROM EMP;
SELECT COUNT(*) FROM EMP;
SELECT COUNT(*) FROM EMP WHERE DEPTNO = 30;
SELECT COUNT(SAL) FROM EMP;
SELECT COUNT(DISTINCT SAL), COUNT(SAL) FROM EMP;
SELECT MAX(SAL), MIN(ASL) FROM EMP;

-- �μ� ��ȣ�� 
SELECT MIN(HIREDATE) FROM EMP WHERE DEPTNO = 20;

SELECT AVG(SAL) FROM EMP;

-- GROUP BY : ��� ���� ���ϴ� ���� ���� ���
SELECT DEPTNO, AVG(SAL) FROM EMP GROUP BY DEPTNO;

-- �μ���ȣ, ��å�� ��� �޿� ���ϱ�
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB ORDER BY DEPTNO, JOB;

-- �� �μ��� ��å�� ��� �޿��� ���ϵ�, ��� �޿��� 2000�̻��� �׷� ���
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

-- �μ��� ��å�� ��� �޿��� 500 �̻��� ������� �μ���ȣ, ��å, �μ��� ��å�� ��� �޿� ��ȸ
SELECT DEPTNO, JOB, AVG(SAL) FROM EMP 
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 500
ORDER BY DEPTNO, JOB;

--group function is not allowed here
--SELECT DEPTNO, JOB, AVG(SAL) FROM EMP 
--WHERE AVG(SAL) >= 500
--ORDER BY DEPTNO, JOB;

-- �μ���ȣ, ��ձ޿�, �ְ�޿�, ����� ����ϱ�
-- �� ,��� �޿��� ����� �� �Ҽ����� �����ϰ� �� �μ����� ���
SELECT DEPTNO, FLOOR(AVG(SAL)), MAX(SAL), COUNT(ENAME) 
FROM EMP GROUP BY DEPTNO;

-- ���� ��å�� �����ϴ� ����� 3�� �̻��� ��å�� �ο��� ���
SELECT JOB, COUNT(*) FROM EMP GROUP BY JOB HAVING COUNT(JOB) >= 3;

-- ������� �Ի翬���� �⺻���� �μ����� ������� ���
SELECT DEPTNO, TO_CHAR(HIREDATE,'YYYY') AS �Ի翬��, COUNT(*) 
FROM EMP GROUP BY DEPTNO, TO_CHAR(HIREDATE,'YYYY');

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP 
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM EMP  WHERE SAL <= 3000
GROUP BY DEPTNO, JOB HAVING AVG(SAL) >= 2000 ORDER BY DEPTNO, JOB;

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

