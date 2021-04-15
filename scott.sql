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


