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

