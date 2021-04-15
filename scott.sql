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

-- LIKE 연산자와 와일드 카드
-- 와일드 카드 : _(어떤 문자든 한 개의 문자를 의미), %(길이와 상관없는 모든 문자를 의미)

-- 사원 이름이 S로 시작하는 사원 조회
SELECT * FROM EMP WHERE ENAME LIKE 'S%';

-- 사원 이름의 두번째 글자가 L인 사원 조회
SELECT * FROM EMP WHERE ENAME LIKE '_L%';

-- 사원 이름에 AM이 포함되어 있는 사원 조회
SELECT * FROM EMP WHERE ENAME LIKE '%AM%';

-- 사원 이름에 AM이 포함되어 있지 않은 사원
SELECT * FROM EMP WHERE ENAME NOT LIKE '%AM%';

-- IS NULL
-- NULL : 값이 존재하지 않음/ 해당사항 없음 / 확정되지 않은 값
SELECT * FROM EMP WHERE COMM IS NULL;
SELECT * FROM EMP WHERE MGR IS NULL;
SELECT * FROM EMP WHERE NOT MGR IS NULL;
SELECT * FROM EMP WHERE MGR IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION(중복된 값은 제거됨), UNION ALL, 차집합 - MINUS, 교집합 - INTERSECT

-- 10번 부서와 20번 부서 조회
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

-- 20번, 30번 부서에 근무하고 있는 사원 중 급여가 2000 초과인 사원을 집합 연산자를
-- 사용해서 조회하기
SELECT * FROM EMP WHERE DEPTNO IN(20,30)
INTERSECT
SELECT * FROM EMP WHERE SAL > 2000;

SELECT * FROM EMP WHERE SAL > 2000
MINUS
SELECT * FROM EMP WHERE DEPTNO = 10;

SELECT * FROM EMP WHERE DEPTNO = 20 AND SAL > 2000 
UNION
SELECT * FROM EMP WHERE DEPTNO = 30 AND SAL > 2000 ;

-- 함수
-- 내장함수 : 오라클에서 기본으로 제공하는 함수
-- 사용자 정의 함수

-- 문자 함수 1) 대소문자
SELECT ENAME, UPPER(ENAME), LOWER(ENAME), INITCAP(ENAME) FROM EMP;

-- ORACLE, oracle, Oracle => 입력값이 다양하다.
-- WHERE LOWER(TITLE) LIKE '%oracle%'

-- 문자 함수 2) 길이
-- LENGTHB : 바이트 수 확인
SELECT LENGTH('한글'), LENGTHB('한글') FROM DUAL;

-- ENAME 길이
SELECT ENAME, LENGTH(ENAME) FROM EMP;

-- ENAME 길이가 5 이상인 사원 조회
SELECT ENAME FROM EMP WHERE LENGTH(ENAME) >= 5;

-- 문자 함수 3) 문자열 추출
SELECT JOB, SUBSTR(JOB, 1, 2), SUBSTR(JOB, 3, 2), SUBSTR(JOB, 5) FROM EMP;

-- EMP 테이블의 모든 사원 이름을 세번째 글자부터 끝까지 출력하기
SELECT ENAME, SUBSTR(ENAME, 3) FROM EMP;

-- 문자 함수 4) 특정 문자의 위치
SELECT INSTR('HELLO, ORACLE!', 'L') AS 첫번째, INSTR('HELLO, ORACLE!', 'L', 5) AS 두번째,
INSTR('HELLO, ORACLE!', 'L', 2, 2) AS 세번째 FROM DUAL;

SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것') FROM DUAL;
SELECT INSTR('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;
SELECT INSTRB('이것이 Oracle이다. 이것도 오라클이다', '이것', 2) FROM DUAL;

-- 사원 이름에 S가 있는 사원 조회
SELECT * FROM EMP WHERE INSTR(ENAME, 'S') > 0;

-- 문자 함수 5) 문자열 대체
SELECT REPLACE('이것이 Oracle이다', '이것', 'This is') FROM DUAL;

-- 010-1234-5678, 010 1234 5678, 01012345678
SELECT '010-1234-5678', REPLACE('010-1234-5678', '-', ' '), REPLACE('010-1234-5678', '-', '') FROM DUAL;

-- 문자 함수 6) 문자열 연결
SELECT CONCAT(EMPNO, ENAME), CONCAT(EMPNO, CONCAT(':', ENAME))
FROM EMP WHERE ENAME = 'SMITH';

--CONCAT() ==  ||
SELECT EMPNO || ENAME, EMPNO || ':' || ENAME
FROM EMP WHERE ENAME = 'SMITH';

-- 문자 함수 7) 특정 문자 제거 - TRIM, LTRIM, RTRIM
SELECT '  이것이   ', TRIM('   이것이   ') FROM DUAL;

SELECT '[' || TRIM('  __ORACLE__  ') || ']' as TRIM,
'[' || LTRIM('  __ORACLE__  ') || ']' as LTRIM,
'[' || RTRIM('  __ORACLE__  ') || ']' as RTRIM
FROM DUAL;

-- 문자 함수 8) 문자열을 반대로 처리
SELECT REVERSE('ORACLE') FROM DUAL;

-- 숫자함수 : 반올림 / 올림 / 버림 / 나머지 값
-- 반올림
SELECT ROUND(1234.5678) AS ROUND, ROUND(1234.5678, 0) AS ROUND0, 
ROUND(1234.5678, 1) AS ROUND1, ROUND(1234.5678, 2) AS ROUND2,
ROUND(1234.5678, -1) AS ROUND_MINUS1, ROUND(1234.5678, -2) AS ROUND_MINUS2
FROM DUAL;

-- 버림
SELECT TRUNC(1234.5678) AS TRUNC, TRUNC(1234.5678, 0) AS TRUNC0, 
TRUNC(1234.5678, 1) AS TRUNC1, TRUNC(1234.5678, 2) AS TRUNC2,
TRUNC(1234.5678, -1) AS TRUNC_MINUS1, TRUNC(1234.5678, -2) AS TRUNC_MINUS2
FROM DUAL;

-- 지정한 숫자와 가장 가까운 정수를 찾는 CEIL(큰 정수), FLOOR(작은 정수)
SELECT CEIL(3.14), FLOOR(3.14), CEIL(-3.14), FLOOR(-3.14)
FROM DUAL;

-- 나머지
SELECT MOD(15, 6), MOD(10, 2), MOD(11, 2)
FROM DUAL;

-- 날짜 함수 : SYSDATE(오라클 서버가 설치된 OS 현재 날짜와 시간)
SELECT SYSDATE FROM DUAL;

SELECT SYSDATE AS NOW, SYSDATE-1 AS YESTERDAY, SYSDATE+1 AS TOMORROW FROM DUAL;

-- 몇 개월 이후의 날짜 구하기 : ADD_MONTHS
SELECT SYSDATE, ADD_MONTHS(SYSDATE, 3) FROM DUAL;

-- 입사 10주년이 되는 날짜 구하기
SELECT EMPNO, ENAME, HIREDATE, ADD_MONTHS(HIREDATE, 120) FROM EMP;

-- 현재 날짜 기준으로 입사 38년 미만인 사원 조회
SELECT * FROM EMP WHERE ADD_MONTHS(HIREDATE, 540) > SYSDATE;


