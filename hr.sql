-- hr�� �ִ� ��� ���̺� Ȯ��
select * from tab;

-- employees ���̺��� ��� ���� Ȯ��
select * from employees;

-- employees ���̺��� first_name, last_name, job_id �� ��ȸ
SELECT first_name, last_name, job_id FROM employees;

-- employee
-- �����ȣ�� 176�� ����� LAST_NAME �� �μ� ��ȣ�� ��ȸ�Ѵ�.
SELECT last_name, department_id FROM employees WHERE employee_id = 176;

-- SALARY�� 12000 �̻�Ǵ� ��������  LAST_NAME �� SALARY�� ��ȸ�Ѵ�.
SELECT last_name, salary FROM employees WHERE salary > 12000;

-- SALARY�� 5000���� 12000�� ���� �̿��� ������� LAST_NAME �� SALARY�� ��ȸ�Ѵ�.
SELECT last_name, salary FROM employees WHERE salary < 5000 AND salary > 12000;


-- 20��, 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME �� �μ���ȣ�� ���ĺ� ������ ��ȸ
SELECT last_name, department_id FROM employees WHERE department_id = 20 OR department_id = 50 ORDER BY last_name ASC;
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY last_name ASC;

-- COMMISSION_PCT�� ���� ��� ������� LAST_NAME, SALARY, COMMISSION_PCT�� ��ȸ
-- SALARY, COMMISSION_PCT ������������ ����
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM employees WHERE commission_pct > 0 ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- SALARY�� 2500, 3500, 7000�� �ƴϸ� ������ SA_REP Ȥ�� ST_CLERK�� ��� ��ȸ
SELECT * FROM employees WHERE SALARY NOT IN(2500, 3500, 7000) AND JOB_ID IN('SA_REP', 'ST_CLERK');

-- ������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� LAST_NAME, EMPLOYEE_ID, HIRE_DATE
-- �� ��ȸ�� �� ������� ������������ ����(��¥ �����ʹ� '' ���̿� �־ ó��)
SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE FROM employees WHERE HIRE_DATE >= '2008-02-20' AND HIRE_DATE <= '2008-05-01' ORDER BY HIRE_DATE DESC; 

-- 2004�⵵�� ���� ������� LAST_NAME, HIRE_DATE�� ��ȸ�� �� �Ի����� �������� �������� ����
SELECT last_name, HIRE_DATE FROM employees WHERE HIRE_DATE >= '2004-01-01' AND HIRE_DATE <= '2004-12-31' ORDER BY HIRE_DATE ASC;


