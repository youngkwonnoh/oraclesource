-- hr에 있는 모든 테이블 확인
select * from tab;

-- employees 테이블의 모든 내용 확인
select * from employees;

-- employees 테이블의 first_name, last_name, job_id 만 조회
SELECT first_name, last_name, job_id FROM employees;

-- employee
-- 사원번호가 176인 사람의 LAST_NAME 과 부서 번호를 조회한다.
SELECT last_name, department_id FROM employees WHERE employee_id = 176;

-- SALARY가 12000 이상되는 직원들의  LAST_NAME 과 SALARY를 조회한다.
SELECT last_name, salary FROM employees WHERE salary > 12000;

-- SALARY가 5000에서 12000의 범위 이외의 사람들의 LAST_NAME 과 SALARY를 조회한다.
SELECT last_name, salary FROM employees WHERE salary < 5000 AND salary > 12000;


-- 20번, 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 부서번호를 알파벳 순으로 조회
SELECT last_name, department_id FROM employees WHERE department_id = 20 OR department_id = 50 ORDER BY last_name ASC;
SELECT last_name, department_id FROM employees WHERE department_id IN(20, 50) ORDER BY last_name ASC;

-- COMMISSION_PCT을 버는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT를 조회
-- SALARY, COMMISSION_PCT 내림차순으로 정렬
SELECT LAST_NAME, SALARY, COMMISSION_PCT FROM employees WHERE commission_pct > 0 ORDER BY SALARY DESC, COMMISSION_PCT DESC;

-- SALARY이 2500, 3500, 7000이 아니며 직업이 SA_REP 혹은 ST_CLERK인 사원 조회
SELECT * FROM employees WHERE SALARY NOT IN(2500, 3500, 7000) AND JOB_ID IN('SA_REP', 'ST_CLERK');

-- 고용일자가 2008-02-20 ~ 2008-05-01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE
-- 를 조회한 후 고용일자 내림차순으로 정렬(날짜 데이터는 '' 사이에 넣어서 처리)
SELECT LAST_NAME, EMPLOYEE_ID, HIRE_DATE FROM employees WHERE HIRE_DATE >= '2008-02-20' AND HIRE_DATE <= '2008-05-01' ORDER BY HIRE_DATE DESC; 

-- 2004년도에 고용된 사람들의 LAST_NAME, HIRE_DATE를 조회한 후 입사일을 기준으로 오름차순 정렬
SELECT last_name, HIRE_DATE FROM employees WHERE HIRE_DATE >= '2004-01-01' AND HIRE_DATE <= '2004-12-31' ORDER BY HIRE_DATE ASC;


