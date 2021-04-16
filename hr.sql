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
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY < 5000 OR SALARY > 12000;


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

-- 20��, 50�� �μ����� �ٹ��ϴ� ��� ������� LAST_NAME, SALARY�� ��ȸ
-- ��, �޿��� 5000 ~ 12000 ������ ����� ��ȸ�Ѵ�.
SELECT last_name, SALARY FROM employees WHERE department_id IN(20, 50) AND salary BETWEEN 5000 AND 12000 ORDER BY SALARY;

-- ������ 5000 ~ 12000 ���� �̿��� ������� LAST_NAME, SALARY�� ��ȸ
SELECT LAST_NAME, SALARY FROM EMPLOYEES WHERE SALARY NOT BETWEEN 5000 AND 12000;

-- ������ڰ� 2008-02-20 ~ 2008-05-01 ���̿� ���� ������� LAST_NAME, EMPLOYEE_ID, HIRE_DATE
-- �� ��ȸ�� �� ������� ������������ ����(��¥ �����ʹ� '' ���̿� �־ ó��)
SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '2008-02-20' AND '2008-05-01' ORDER BY HIRE_DATE DESC;

-- 2004�⵵�� ���� ������� LAST_NAME, HIRE_DATE�� ��ȸ�� �� �Ի����� �������� �������� ����
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE BETWEEN '2004-01-01' AND '2004-12-31' ORDER BY HIRE_DATE ASC;

-- LIKE
-- 2004�⵵�� ���� ��� ������� LAST_NAME �� HIRE_ADTE�� ��ȸ�Ͽ� �Ի��� �������� ��������
SELECT LAST_NAME, HIRE_DATE FROM EMPLOYEES WHERE HIRE_DATE LIKE '04%' ORDER BY HIRE_DATE;

-- LAST_NAME�� u�� ���ԵǴ� ������� EMPLOYEE_ID, LAST_NAME�� ��ȸ�Ѵ�.
SELECT EMPLOYEE_ID, LAST_NAME FROM employees WHERE LAST_NAME LIKE '%u%';

-- LAST_NAME�� �� ��° ���ڰ� A�� ������� LAST_NAME ��ȸ
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '___a%';

-- LAST_NAME�� AȤ�� E ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME���� ��������
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%a%' OR LAST_NAME LIKE '%e%' ORDER BY LAST_NAME;

-- LAST_NAME�� A�� E ���ڰ� �ִ� ������� LAST_NAME�� ��ȸ�Ͽ� LAST_NAME���� ��������
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%a%e%' OR LAST_NAME LIKE '%e%a%' ORDER BY LAST_NAME DESC;
SELECT LAST_NAME FROM EMPLOYEES WHERE LAST_NAME LIKE '%a%' AND LAST_NAME LIKE '%e%' ORDER BY LAST_NAME DESC;


-- IS NULL
-- �Ŵ����� ���� ������� LAST_NAME, JOB_ID
SELECT LAST_NAME, JOB_ID FROM EMPLOYEES WHERE MANAGER_ID IS NULL;

-- ST_CLERK�� JOB_ID�� ���� ����� ���� �μ�ID ��ȸ. ��, �μ���ȣ�� NULL�� ���� ����
SELECT DISTINCT DEPARTMENT_ID FROM EMPLOYEES WHERE JOB_ID NOT IN ('ST_CLERK') AND DEPARTMENT_ID IS NOT NULL;


-- COMMISSION_PCT�� NULL�� �ƴ� ����� �߿��� COMMISSION = SALARY * COMMISSION_PCT�� ���Ͽ�
-- EMPLOYYE_ID, FIRST_NAME, JOB_ID ���
SELECT EMPLOYEE_ID, FIRST_NAME, JOB_ID, SALARY * COMMISSION_PCT FROM EMPLOYEES WHERE COMMISSION_PCT IS NOT NULL;

-- ���ڿ� �Լ�

-- FIRST_NAME�� Curtis�� ����� first_name, last_name, phone_number, job_id ��ȸ
-- ��, job_id ����� �ҹ��ڷ� ���
SELECT FIRST_NAME, LAST_NAME, PHONE_NUMBER, LOWER(JOB_ID) FROM EMPLOYEES WHERE FIRST_NAME = 'Curtis';


-- �μ���ȣ�� 60, 70, 80, 90�� ������� employee_id, first_name, hire_date, job_id ��ȸ
-- ��, job_id�� IT_PROG�� ����� ��� ���α׷��ӷ� �����ؼ� ���

SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE,  REPLACE(JOB_ID, 'IT_PROG', '���α׷���')
FROM EMPLOYEES WHERE DEPARTMENT_ID IN(60, 70, 80, 90);

-- job_id�� AD_PRES, PU_CLERK�� ������� EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
-- DEPARTMENT_ID, JOB_ID ��ȸ, �� ������� FIRST_NAME�� LAST_NAME�� �����Ͽ� ���
SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)), DEPARTMENT_ID, JOB_ID FROM EMPLOYEES WHERE JOB_ID IN('AD_PRES', 'PU_CLERK');
SELECT EMPLOYEE_ID, FIRST_NAME || ' ' || LAST_NAME, DEPARTMENT_ID, JOB_ID FROM EMPLOYEES WHERE JOB_ID IN('AD_PRES', 'PU_CLERK');


-- -- �ǽ�����(ORACLE PPT 18������) 4��
SELECT LAST_NAME, SALARY,
    DECODE(TRUNC(SALARY/2000, 0),
        0, 0.00,
        1, 0.09,
        2, 0.20,
        3, 0.30,
        4, 0.40,
        5, 0.42,
        6, 0.44,
        0.45) AS TAX_RATE 
FROM employees WHERE DEPARTMENT_ID = 80;

SELECT LAST_NAME, SALARY,
    CASE 
        WHEN SALARY BETWEEN 0 AND 1999 THEN 0
        WHEN SALARY BETWEEN 2000 AND 3999 THEN 0.09
        WHEN SALARY BETWEEN 4000 AND 5999 THEN 0.2
        WHEN SALARY BETWEEN 6000 AND 7999 THEN 0.3
        WHEN SALARY BETWEEN 8000 AND 9999 THEN 0.4
        WHEN SALARY BETWEEN 10000 AND 11999 THEN 0.42
        WHEN SALARY BETWEEN 12000 AND 13999 THEN 0.44
        ELSE 0.45
    END AS TAX_RATE 
FROM EMPLOYEES;

-- ȸ�� ���� �ִ� ���� �� �ּ� ������ ���� ��ȸ
SELECT MAX(SALARY) - MIN(SALARY) AS SAL_GAP FROM EMPLOYEES; 

-- �Ŵ����� �ٹ��ϴ� ������� �� ���� ��ȸ
SELECT COUNT(DISTINCT MANAGER_ID) AS �Ŵ��� FROM EMPLOYEES;

-- �μ��� ������ ���� ���Ͽ�, �μ���ȣ�� ������������ ���
SELECT DEPARTMENT_ID, COUNT(EMPLOYEE_ID) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;

-- �μ��� �޿��� ��� ������ ����ϱ�(�μ���ȣ, ��� ������ �������� �ϰ�
-- �μ���ȣ�� �������� ��ȸ)
SELECT DEPARTMENT_ID, ROUND(AVG(SALARY)) FROM EMPLOYEES GROUP BY DEPARTMENT_ID ORDER BY DEPARTMENT_ID;

-- ������ ������ ���� ������� ���� ��ȸ
SELECT JOB_ID, COUNT(EMPLOYEE_ID) FROM EMPLOYEES GROUP BY JOB_ID;

-- �Ŵ����� ����� �� �ּ� ������ �޴� ����� ���� ��ȸ
-- �Ŵ����� ���� ��� ���� / �ּ� ������ 6000�̸� ���� / ���� ���� ���� ���
SELECT MANAGER_ID, MIN(SALARY)
FROM EMPLOYEES WHERE MANAGER_ID IS NOT NULL
GROUP BY MANAGER_ID HAVING MIN(SALARY) >= 6000 ORDER BY MIN(SALARY) DESC;


     