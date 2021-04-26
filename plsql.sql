-- PL / SQL
-- 화면 출력
SET SERVEROUTPUT ON; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL');
END;
/

-- 변수 사용
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : '||v_empno);
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : '||v_ename);
END;
/   

-- 상수 선언
DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/
    
-- 변수의 기본값 지정
DECLARE
    V_DEPTNO NUMBER(4) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||V_DEPTNO);
END;
/   

-- NULL 값 막기
DECLARE
    V_DEPTNO NUMBER(4) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||V_DEPTNO);
END;
/

-- NULL 값 막기 + DEFAULT
DECLARE
    V_DEPTNO NUMBER(4) NOT NULL DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||V_DEPTNO);
END;
/

DECLARE
    V_DEPT_ROW DEPT%ROWTYPE;
BEGIN
    SELECT DEPTNO, DNAME, LOC INTO V_DEPT_ROW
    FROM DEPT
    WHERE DEPTNO=40;
    DBMS_OUTPUT.PUT_LINE('DEPTNO : '||V_DEPT_ROW.DEPTNO);
    DBMS_OUTPUT.PUT_LINE('DNAME : '||V_DEPT_ROW.DNAME);
    DBMS_OUTPUT.PUT_LINE('LOC : '||V_DEPT_ROW.LOC);
END;
/

-- 조건문

DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('홀수');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 16;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('홀수');
    ELSE
        DBMS_OUTPUT.PUT_LINE('짝수');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    IF V_NUMBER >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A 학점');
    ELSIF V_NUMBER >= 80 THEN 
        DBMS_OUTPUT.PUT_LINE('B 학점');
    ELSIF V_NUMBER >= 70 THEN 
        DBMS_OUTPUT.PUT_LINE('C 학점');
    ELSIF V_NUMBER >= 60 THEN 
        DBMS_OUTPUT.PUT_LINE('D 학점');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F 학점');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    CASE TRUNC(V_NUMBER/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A 학점');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('B 학점');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('C 학점');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('D 학점');
        ELSE DBMS_OUTPUT.PUT_LINE('F 학점');
    END CASE;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    CASE 
        WHEN V_NUMBER  >= 90 THEN DBMS_OUTPUT.PUT_LINE('A 학점');
        WHEN V_NUMBER  >= 80 THEN DBMS_OUTPUT.PUT_LINE('B 학점');
        WHEN V_NUMBER  >= 70 THEN DBMS_OUTPUT.PUT_LINE('C 학점');
        WHEN V_NUMBER  >= 60 THEN DBMS_OUTPUT.PUT_LINE('D 학점');
        ELSE DBMS_OUTPUT.PUT_LINE('F 학점');
    END CASE;
END;
/

-- 반복문
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM :' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM :' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/      

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('현재 V_NUM :' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

-- 1 ~ 100까지 합
DECLARE
    V_SUM NUMBER := 0;
BEGIN
    FOR i IN 1..100 LOOP
    V_SUM := V_SUM + i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1~100까지 합 :' || V_SUM);
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i,2) = 1;
        DBMS_OUTPUT.PUT_LINE('현재 i :' || i);
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        DBMS_OUTPUT.PUT_LINE('현재 i :' || i);
    END LOOP;
END;
/

-- 레코드 : 자료형이 다른 여러 데이터를 저장
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2) NOT NULL := 99,
        dname VARCHAR2(12),
        loc VARCHAR2(20));
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 55;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
    DBMS_OUTPUT.PUT_LINE('deptno :' || dept_rec.deptno);
    DBMS_OUTPUT.PUT_LINE('dname :' || dept_rec.dname);
    DBMS_OUTPUT.PUT_LINE('loc :' || dept_rec.loc);
END;
/



-- 레코드를 사용한 insert
CREATE TABLE DEPT_RECORD AS SELECT * FROM SCOTT.DEPT;
SELECT * FROM DEPT_RECORD;
/

DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2) NOT NULL := 99,
        dname VARCHAR2(12),
        loc VARCHAR2(20));
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 55;
    dept_rec.dname := 'DATABASE';
    dept_rec.loc := 'SEOUL';
INSERT INTO dept_record
VALUES dept_rec;
END;
/

-- 레코드를 사용한 업데이트
DECLARE
    TYPE REC_DEPT IS RECORD(
        deptno NUMBER(2) NOT NULL := 99,
        dname VARCHAR2(12),
        loc VARCHAR2(20));
    dept_rec REC_DEPT;
BEGIN
    dept_rec.deptno := 60;
    dept_rec.dname := 'SERVER';
    dept_rec.loc := 'BUSAN';
UPDATE dept_record SET ROW = dept_rec
WHERE deptno = 55;
END;
/

-- 커서 : SELECT문 또는 데이터 조작어 같은 SQL문 실행 시
-- 해당 SQL 문을 처리하는 정보를 저장한 메모리 공간을 가리키는 포인터

-- 명시적 커서 / 묵시적 커서
DECLARE
    -- 특정 테이블에서 행 구조 참조하기
    V_DEPT_ROW SCOTT.DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT
        WHERE DEPTNO=40;
BEGIN
    -- 커서 열기
    OPEN c1;
    -- 커서를 통해 읽어온 데이터 사용
    FETCH c1 INTO v_dept_row;
    DBMS_OUTPUT.PUT_LINE('deptno :' || V_DEPT_ROW.deptno);
    DBMS_OUTPUT.PUT_LINE('dname :' || V_DEPT_ROW.dname);
    DBMS_OUTPUT.PUT_LINE('loc :' || V_DEPT_ROW.loc);
    
    -- 커서 닫기
    CLOSE c1;
END;
/

DECLARE
    -- 특정 테이블에서 행 구조 참조하기
    V_DEPT_ROW SCOTT.DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT;
BEGIN
    -- 커서 열기
    OPEN c1;
    LOOP
    -- 커서를 통해 읽어온 데이터 사용
    FETCH c1 INTO v_dept_row;
        EXIT WHEN c1%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE('deptno :' || V_DEPT_ROW.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || V_DEPT_ROW.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || V_DEPT_ROW.loc);
    END LOOP;
    -- 커서 닫기
    CLOSE c1;
END;
/

DECLARE
    -- 명시적 커서 선언
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT;
BEGIN
    -- 커서 loop 시작(open, fetch, close 자동)
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('deptno :' || c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || c1_rec.loc);
    END LOOP;
END;
/


DECLARE
    -- 특정 테이블에서 행 구조 참조하기
    V_DEPT_ROW SCOTT.DEPT%ROWTYPE;
    -- 명시적 커서 선언
    CURSOR c1 (p_deptno scott.dept.deptno%TYPE)IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT
        WHERE deptno=p_deptno;
BEGIN
    -- 커서 열기
    OPEN c1(10);
    
    LOOP
    -- 커서를 통해 읽어온 데이터 사용
    FETCH c1 INTO v_dept_row;
        EXIT WHEN c1%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE('deptno :' || V_DEPT_ROW.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || V_DEPT_ROW.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || V_DEPT_ROW.loc);
    END LOOP;
    -- 커서 닫기
    CLOSE c1;
END;
/

DECLARE
    -- 특정 테이블에서 컬럼 구조 참조하기
    v_deptno SCOTT.DEPT.deptno%TYPE;
    
    -- 명시적 커서 선언
    CURSOR c1 (p_deptno scott.dept.deptno%TYPE)IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT
        WHERE deptno=p_deptno;
BEGIN
    -- 커서 열기
    v_deptno := &INPUT_DEPTNO;
    
    -- 커서 열기
    FOR c1_rec IN c1(v_deptno)
    
    LOOP
        DBMS_OUTPUT.PUT_LINE('deptno :' || c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || c1_rec.loc);
    END LOOP;
END;
/

-- 묵시적 커서 : DML, SELECT INTO
-- SQL%FOUND(묵시적 커서가 추출한 행이 있는 경우 TRUE)
-- SQL%NOTFOUND(묵시적 커서가 추출한 행이 있는 경우 FALSE)
-- SQL%ISOPEN(묵시적 커서는 자동으로 SQL 문 실행 후 닫기 때문에 항상 FALSE)
-- SQL%ROWCOUNT(묵시적 커서에 현재까지 추출한 행 수 옥인 DML 영향 받은 행수)
BEGIN
    UPDATE userTBL set addr = '전라도'
    WHERE no = 1;
    DBMS_OUTPUT.PUT_LINE('갱신된 행의 수 :' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('갱신된 행의 존재 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('갱신된 행의 존재 여부 : FALSE');
    END IF;
    
    IF(SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('커서의 오픈 여부 : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('커서의 오픈 여부 : FALSE');
    END IF;
END;

SET SERVEROUTPUT ON;

-- 오류 - 예외 : 컴파일 에러(문법 오류) / 런타임 에러
-- PS/SQL: numeric or value error: character to number conversion error
DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT DNAME INTO v_wrong
    FROM SCOTT.DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('예외 발생시 이 문장은 실행되지 않음');
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT DNAME INTO v_wrong
    FROM SCOTT.DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('예외 발생시 이 문장은 실행되지 않음');
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 수치 또는 값 오류 발생');
END;
/

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT DNAME INTO v_wrong
    FROM scott.DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('예외 발생시 이 문장은 실행되지 않음');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('예외 처리 : 사전 정의 외 오류 발생');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : '||TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : '||SQLERRM);
END;
/

-- 저장 서브 프로그램 : 오라클 내에 저장해서 필요할 때(다른 응용프로그램에서) 호출 가능
-- 1) 저장 프로시저
CREATE PROCEDURE pro_noparam
IS
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'scott';
    DBMS_OUTPUT.PUT_LINE('v_empno : '||v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : '||v_ename);
END;
/

-- 프로시저 실행
EXECUTE pro_noparam;

-- 동일한 프로시저가 존재하는 경우 현재 작성한 내용으로 대체
CREATE OR REPLACE PROCEDURE pro_noparam
IS
    v_empno NUMBER(4) := 7788;
    v_ename VARCHAR2(10);
BEGIN
    v_ename := 'scott';
    DBMS_OUTPUT.PUT_LINE('v_empno : '||v_empno);
    DBMS_OUTPUT.PUT_LINE('v_ename : '||v_ename);
END;
/

-- 프로시저 실행
EXECUTE pro_noparam;

-- 다른 PL/SQL 블록에서 실행
BEGIN
    pro_noparam;
END;
/

-- 파라미터 처리(IN) : 파라미터를 받아서 쓴다.
CREATE OR REPLACE PROCEDURE pro_param_in
    (
        param1 IN NUMBER,
        param2 NUMBER,
        param3 NUMBER := 3,
        param4 NUMBER DEFAULT 4
    )
IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('param1 : '||param1);
    DBMS_OUTPUT.PUT_LINE('param2 : '||param2);
    DBMS_OUTPUT.PUT_LINE('param3 : '||param3);
    DBMS_OUTPUT.PUT_LINE('param4 : '||param4);
END;
/
-- 파라미터 값 넣어주기
EXECUTE pro_param_in(1,2,9,8);

EXECUTE pro_param_in(1,2);

-- wrong number or types of arguments in call to 'PRO_PARAM_IN'
EXECUTE pro_param_in(1);

-- 파라미터 처리(OUT : 리턴)
CREATE OR REPLACE PROCEDURE pro_param_out
    (
        in_empno IN scott.emp.empno%TYPE, -- IN(DEFAULT)
        out_ename OUT scott.emp.ename%TYPE, -- OUT(프로시저 실행 후 호출한 프로그램으로 값 반환)
        out_sal OUT scott.emp.sal%TYPE
    )
IS
BEGIN
    SELECT ENAME, SAL INTO out_ename, out_sal
    FROM scott.emp
    WHERE empno = in_empno;
END;
/

DECLARE
    v_ename scott.emp.ename%TYPE;
    v_sal scott.emp.sal%TYPE;
BEGIN
    pro_param_out(7782, v_ename, v_sal);
    DBMS_OUTPUT.PUT_LINE('ENAME :' ||v_ename);
    DBMS_OUTPUT.PUT_LINE('SAL :'||v_sal);
END;
/

-- IN/OUT
CREATE OR REPLACE PROCEDURE pro_param_inout
    (
        in_out_no IN OUT NUMBER
    )
IS
BEGIN
    in_out_no := in_out_no*2;
END;
/

DECLARE
    no NUMBER;
BEGIN
    no := 5;
    pro_param_inout(no);
    DBMS_OUTPUT.PUT_LINE('no :' ||no);
END;
/

CREATE OR REPLACE PROCEDURE register_user
    (
        username IN usertbl.username%TYPE, -- IN(DEFAULT)
        birthyear usertbl.birthyear%TYPE,
        addr usertbl.addr%TYPE,
        mobile usertbl.mobile%TYPE
    )
IS
BEGIN
    INSERT INTO usertbl(no,username,birthyear,addr,mobile)
    VALUES(user_seq.nextval,username,birthyear,addr,mobile);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE(username || birthyear || addr || mobile);
END;
/

EXECUTE register_user('대조영', '1996', '부산시', '01045678965');
select * from userTBL where username='대조영';

--------------------------------------------------------------------------------
-- 실습[프로시저 생성]
CREATE OR REPLACE PROCEDURE pro_dept_in
    (
    inout_DEPTNO in out scott.dept.deptno%type,
    out_DNAME out scott.dept.dname%type,
    out_LOC out scott.dept.loc%type
    )
IS
BEGIN
    SELECT deptno, dname, loc INTO inout_DEPTNO, out_dname, out_loc
    FROM scott.dept
    WHERE deptno = inout_deptno;
END;
/

DECLARE
    v_deptno scott.dept.deptno%TYPE;
    v_dname scott.dept.dname%TYPE;
    v_loc scott.dept.loc%TYPE;
BEGIN
    v_deptno := 10;
    pro_dept_in(v_deptno,v_dname,v_loc);
    DBMS_OUTPUT.PUT_LINE('부서번호 : ' ||v_deptno);
    DBMS_OUTPUT.PUT_LINE('부서명 : ' ||v_dname);
    DBMS_OUTPUT.PUT_LINE('SAL : '||v_loc);
END;
/

-- 트리거(TRIGGER) : 데이터베이스 안의 특정 상황이나 동작, 즉 이벤트가 발생할 경우
-- 자동으로 실행되는 기능

-- 데이터와 연관된 여러 작업을 수행하기 위해 여러 PL/SQL 문 또는 저장 프로시저를 일일히
-- 수행하지 않아도 됨

-- 여러 사용자가 공유하는 데이터 보안성과 안전성 추구

-- 트리거 사용 구문
-- DML, DDL, 데이터베이스 동작과 관련된 구문

CREATE TABLE EMP_TRG
AS SELECT * FROM SCOTT.EMP; 

SELECT * FROM emp_trg;

-- DML 트리거
CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE -- AFTER(트리거 동작 시점)
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') in ('토', '일') THEN
        IF INSERTING THEN
            raise_application_error(-20000, '주말 사원정보 추가 불가');
        ELSIF UPDATING THEN
            raise_application_error(-20001, '주말 사원정보 수정 불가');
        ELSIF DELETING THEN
            raise_application_error(-20002, '주말 사원정보 삭제 불가');
        ELSE
            raise_application_error(-20003, '주말 사원정보 변경 불가');
        END IF;
    END IF;
END;
/

UPDATE emp_trg SET SAL = 4000 WHERE EMPNO = 7782;

INSERT INTO emp_trg
VALUES(9000,'test', 'manager', null, sysdate, null, null, 10);

-- 로그 기록 테이블
CREATE TABLE EMP_TRG_LOG( 
    tablename VARCHAR2(10),     -- DML 작업이 수행된 테이블 명
    dml_type VARCHAR2(10),      -- DML 명령어의 종류
    empno NUMBER(4),            -- DML 대상이 된 사원번호
    user_name VARCHAR2(30),     -- DML을 수행한 USER 명
    chage_date DATE);           -- DML이 수행된 날짜


CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER -- AFTER(트리거 동작 시점)
INSERT OR UPDATE OR DELETE ON EMP_TRG
FOR EACH ROW
BEGIN
    IF INSERTING THEN 
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'INSERT', :new.empno, SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    ELSIF UPDATING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'UPDATE', :old.empno, SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    ELSIF DELETING THEN
        INSERT INTO EMP_TRG_LOG
        VALUES('EMP_TRG', 'DELETE', :old.empno, SYS_CONTEXT('USERENV', 'SESSION_USER'), sysdate);
    END IF;
END;
/

