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

-- 