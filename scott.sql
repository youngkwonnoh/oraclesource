-- scott 소유의 모든 테이블 조회
select * from tab;

-- bonus 테이블의 모든 내용 조회
select * from bonus;

-- emp 테이블의 모든 내용 조회
select * from emp;

-- emp 테이블의 empno, ename 조회
select empno, ename from emp;

-- emp 테이블의 empno, job, hiredate 조회
select empno, job, hiredate from emp;

-- 중복된 값 제거 : DISTINCT
select deptno from emp;
select DISTINCT deptno from emp;

-- 별칭
select empno from emp;
select empno as 사원번호 from emp;
select empno 사원번호 from emp;
select empno "사원번호" from emp;
select empno as "사원번호" from emp;

SELECT enam, sal, sal*12 + comm, comm FROM emp;
SELECT enam, sal, sal*12 + comm AS 연봉, comm FROM emp;

-- ename(사원명), job(직책), 별칭을 붙은 후 emp 조회
select ename 사원명, job "직 책" from emp;
select ename as 사원명, job as "직 책" from emp;

-- 정렬 : ORDER BY 정렬하려는 열 이름 정렬 옵션(ASC(오름차순), DESC(내림차순))
-- ENAME, SAL 조회(SAL 내림차순)
select ename, sal from emp order by sal DESC;
select ename, sal from emp order by sal;

-- 전체 데이터 조회 시 SAL 내림차순
SELECT * FROM emp ORDER BY sal DESC;

-- EMPNO, ENAME, JOB을 조회할 때 EMPNO 오름차순
SELECT EMPNO, ENAME, JOB FROM emp ORDER BY EMPNO;
SELECT EMPNO, ENAME, JOB FROM emp ORDER BY EMPNO ASC;

-- 부서번호의 오름차순과 급여의 내림차순 정렬하기
select * from emp Order BY deptno ASC, sal DESC;

-- 조회할 테이블은 EMP 테이블이며 모든 열을 출력
-- 출력되는 열의 별칭을 다음과 같이 지정
-- EMPNO : EMPLOYEE_NO
-- ENAME : EMPLOYEE_NAME
-- MGR : EMPLOYEE_NAME
-- SAL : SALARY
-- COMM : COMMISSION
-- DEPTNO : DEPARTMENT_NO
-- 부서 번호를 기준으로 내림차순으로 정렬
-- 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬


SELECT 
EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME, 
MGR AS EMPLOYEE_NAME, SAL AS SALARY, COMM AS COMMISSION, 
DEPTNO AS DEPARTMENT_NO  
FROM EMP ORDER BY DEPTNO DESC, ENAME ASC;

-- WHERE : 조건에 맞춰서 조회

-- 부서번호가 30번인 사원 조회
SELECT * FROM emp WHERE deptno = 30;

-- 사원번호가 7782인 사원 정보 조회
SELECT * FROM emp WHERE empno = 7782;

-- 부서번호가 30이고 사원 직책이 SALESMAN인 사원 조회
SELECT * FROM emp WHERE DEPTNO = 30 AND job = 'SALESMAN';

-- 부서번호가 30이거나 사원직책이 CLERK인 사원 조회
SELECT * FROM emp WHERE DEPTNO = 30 AND job = 'CLERKL';


-- 산술연산자 : * / + -

-- SAL*12의 값이 36000인 사원 조회
SELECT * FROM EMP WHERE SAL * 12 = 36000;

-- SAL의 값이 3000 이상인 사원 조회
SELECT * FROM EMP WHERE SAL >= 3000;

-- 급여가 2500이고, 직업이 ANALYST인 사원 조회
SELECT * FROM EMP WHERE SAL >= 2500 AND JOB = 'ANALYST';

-- 사원 이름의 첫문자가 F와 같거나 뒤쪽인 것만 조회(F, G, H, I ~~)
SELECT * FROM EMP WHERE ENAME >= 'F';

-- 직무가 MANAGER, SALESMAN, CLERK인 사원 조회
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';

-- 등가 비교 연산자( = (동등), !=, <>, ^= )
-- SALㅇ; 3000이 아닌 사원정보 조회
SELECT * FROM EMP WHERE SAL != 3000;
SELECT * FROM EMP WHERE SAL ^= 3000;
SELECT * FROM EMP WHERE SAL <> 3000;

-- 논리 부정 연산자 : NOT
SELECT * FROM EMP WHERE NOT SAL = 3000;

-- IN은 =과 같은 개념이다.
SELECT * FROM EMP WHERE JOB = 'MANAGER' OR JOB = 'SALESMAN' OR JOB = 'CLERK';
SELECT * FROM EMP WHERE JOB IN('MANAGER', 'SALESMAN', 'CLERK');

-- NOT IN
SELECT * FROM EMP WHERE JOB != 'MANAGER' AND JOB ^= 'SALESMAN' AND JOB <> 'CLERK';
SELECT * FROM EMP WHERE JOB NOT IN('MANAGER', 'SALESMAN', 'CLERK');

-- 부서번호가 10, 20 사원 조회(IN)
SELECT * FROM EMP WHERE DEPTNO = 10 OR DEPTNO = 20;
SELECT * FROM EMP WHERE DEPTNO IN(10, 20);

-- BETWEEN A AND B : 특정 범위의 데이터를 조회
SELECT * FROM EMP WHERE SAL >= 2000 AND SAL <= 3000;
SELECT * FROM EMP WHERE SAL BETWEEN 2000 AND 3000;

-- SAL 2000이상 ~ 3000이하가 아닌 사원 조회
SELECT * FROM EMP WHERE SAL NOT BETWEEN 2000 AND 3000;

