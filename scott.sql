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

-- 