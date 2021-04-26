-- PL / SQL
-- ȭ�� ���
SET SERVEROUTPUT ON; 
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, PL/SQL');
END;
/

-- ���� ���
DECLARE
    V_EMPNO NUMBER(4) := 7788;
    V_ENAME VARCHAR2(10);
BEGIN
    V_ENAME := 'SCOTT';
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : '||v_empno);
    DBMS_OUTPUT.PUT_LINE('V_EMPNO : '||v_ename);
END;
/   

-- ��� ����
DECLARE
    V_TAX CONSTANT NUMBER(1) := 3;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_TAX : ' || V_TAX);
END;
/
    
-- ������ �⺻�� ����
DECLARE
    V_DEPTNO NUMBER(4) DEFAULT 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||V_DEPTNO);
END;
/   

-- NULL �� ����
DECLARE
    V_DEPTNO NUMBER(4) NOT NULL := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('V_DEPTNO : '||V_DEPTNO);
END;
/

-- NULL �� ���� + DEFAULT
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

-- ���ǹ�

DECLARE
    V_NUMBER NUMBER := 13;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Ȧ��');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 16;
BEGIN
    IF MOD(V_NUMBER, 2) = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Ȧ��');
    ELSE
        DBMS_OUTPUT.PUT_LINE('¦��');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    IF V_NUMBER >= 90 THEN
        DBMS_OUTPUT.PUT_LINE('A ����');
    ELSIF V_NUMBER >= 80 THEN 
        DBMS_OUTPUT.PUT_LINE('B ����');
    ELSIF V_NUMBER >= 70 THEN 
        DBMS_OUTPUT.PUT_LINE('C ����');
    ELSIF V_NUMBER >= 60 THEN 
        DBMS_OUTPUT.PUT_LINE('D ����');
    ELSE
        DBMS_OUTPUT.PUT_LINE('F ����');
    END IF;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    CASE TRUNC(V_NUMBER/10)
        WHEN 10 THEN DBMS_OUTPUT.PUT_LINE('A ����');
        WHEN 9 THEN DBMS_OUTPUT.PUT_LINE('B ����');
        WHEN 8 THEN DBMS_OUTPUT.PUT_LINE('C ����');
        WHEN 7 THEN DBMS_OUTPUT.PUT_LINE('D ����');
        ELSE DBMS_OUTPUT.PUT_LINE('F ����');
    END CASE;
END;
/

DECLARE
    V_NUMBER NUMBER := 87;
BEGIN
    CASE 
        WHEN V_NUMBER  >= 90 THEN DBMS_OUTPUT.PUT_LINE('A ����');
        WHEN V_NUMBER  >= 80 THEN DBMS_OUTPUT.PUT_LINE('B ����');
        WHEN V_NUMBER  >= 70 THEN DBMS_OUTPUT.PUT_LINE('C ����');
        WHEN V_NUMBER  >= 60 THEN DBMS_OUTPUT.PUT_LINE('D ����');
        ELSE DBMS_OUTPUT.PUT_LINE('F ����');
    END CASE;
END;
/

-- �ݺ���
DECLARE
    V_NUM NUMBER := 0;
BEGIN
    LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM :' || V_NUM);
        V_NUM := V_NUM + 1;
        EXIT WHEN V_NUM > 4;
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    WHILE V_NUM < 4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM :' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/      

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        DBMS_OUTPUT.PUT_LINE('���� V_NUM :' || V_NUM);
        V_NUM := V_NUM + 1;
    END LOOP;
END;
/

-- 1 ~ 100���� ��
DECLARE
    V_SUM NUMBER := 0;
BEGIN
    FOR i IN 1..100 LOOP
    V_SUM := V_SUM + i;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1~100���� �� :' || V_SUM);
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN 0..4 LOOP
        CONTINUE WHEN MOD(i,2) = 1;
        DBMS_OUTPUT.PUT_LINE('���� i :' || i);
    END LOOP;
END;
/

DECLARE
    V_NUM NUMBER := 0;
BEGIN
    FOR i IN 1..10 LOOP
        CONTINUE WHEN MOD(i,2) = 0;
        DBMS_OUTPUT.PUT_LINE('���� i :' || i);
    END LOOP;
END;
/

-- ���ڵ� : �ڷ����� �ٸ� ���� �����͸� ����
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



-- ���ڵ带 ����� insert
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

-- ���ڵ带 ����� ������Ʈ
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

-- Ŀ�� : SELECT�� �Ǵ� ������ ���۾� ���� SQL�� ���� ��
-- �ش� SQL ���� ó���ϴ� ������ ������ �޸� ������ ����Ű�� ������

-- ����� Ŀ�� / ������ Ŀ��
DECLARE
    -- Ư�� ���̺��� �� ���� �����ϱ�
    V_DEPT_ROW SCOTT.DEPT%ROWTYPE;
    -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT
        WHERE DEPTNO=40;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    -- Ŀ���� ���� �о�� ������ ���
    FETCH c1 INTO v_dept_row;
    DBMS_OUTPUT.PUT_LINE('deptno :' || V_DEPT_ROW.deptno);
    DBMS_OUTPUT.PUT_LINE('dname :' || V_DEPT_ROW.dname);
    DBMS_OUTPUT.PUT_LINE('loc :' || V_DEPT_ROW.loc);
    
    -- Ŀ�� �ݱ�
    CLOSE c1;
END;
/

DECLARE
    -- Ư�� ���̺��� �� ���� �����ϱ�
    V_DEPT_ROW SCOTT.DEPT%ROWTYPE;
    -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT;
BEGIN
    -- Ŀ�� ����
    OPEN c1;
    LOOP
    -- Ŀ���� ���� �о�� ������ ���
    FETCH c1 INTO v_dept_row;
        EXIT WHEN c1%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE('deptno :' || V_DEPT_ROW.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || V_DEPT_ROW.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || V_DEPT_ROW.loc);
    END LOOP;
    -- Ŀ�� �ݱ�
    CLOSE c1;
END;
/

DECLARE
    -- ����� Ŀ�� ����
    CURSOR c1 IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT;
BEGIN
    -- Ŀ�� loop ����(open, fetch, close �ڵ�)
    FOR c1_rec IN c1 LOOP
        DBMS_OUTPUT.PUT_LINE('deptno :' || c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || c1_rec.loc);
    END LOOP;
END;
/


DECLARE
    -- Ư�� ���̺��� �� ���� �����ϱ�
    V_DEPT_ROW SCOTT.DEPT%ROWTYPE;
    -- ����� Ŀ�� ����
    CURSOR c1 (p_deptno scott.dept.deptno%TYPE)IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT
        WHERE deptno=p_deptno;
BEGIN
    -- Ŀ�� ����
    OPEN c1(10);
    
    LOOP
    -- Ŀ���� ���� �о�� ������ ���
    FETCH c1 INTO v_dept_row;
        EXIT WHEN c1%NOTFOUND;
    
        DBMS_OUTPUT.PUT_LINE('deptno :' || V_DEPT_ROW.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || V_DEPT_ROW.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || V_DEPT_ROW.loc);
    END LOOP;
    -- Ŀ�� �ݱ�
    CLOSE c1;
END;
/

DECLARE
    -- Ư�� ���̺��� �÷� ���� �����ϱ�
    v_deptno SCOTT.DEPT.deptno%TYPE;
    
    -- ����� Ŀ�� ����
    CURSOR c1 (p_deptno scott.dept.deptno%TYPE)IS
        SELECT DEPTNO, DNAME, LOC
        FROM SCOTT.DEPT
        WHERE deptno=p_deptno;
BEGIN
    -- Ŀ�� ����
    v_deptno := &INPUT_DEPTNO;
    
    -- Ŀ�� ����
    FOR c1_rec IN c1(v_deptno)
    
    LOOP
        DBMS_OUTPUT.PUT_LINE('deptno :' || c1_rec.deptno);
        DBMS_OUTPUT.PUT_LINE('dname :' || c1_rec.dname);
        DBMS_OUTPUT.PUT_LINE('loc :' || c1_rec.loc);
    END LOOP;
END;
/

-- ������ Ŀ�� : DML, SELECT INTO
-- SQL%FOUND(������ Ŀ���� ������ ���� �ִ� ��� TRUE)
-- SQL%NOTFOUND(������ Ŀ���� ������ ���� �ִ� ��� FALSE)
-- SQL%ISOPEN(������ Ŀ���� �ڵ����� SQL �� ���� �� �ݱ� ������ �׻� FALSE)
-- SQL%ROWCOUNT(������ Ŀ���� ������� ������ �� �� ���� DML ���� ���� ���)
BEGIN
    UPDATE userTBL set addr = '����'
    WHERE no = 1;
    DBMS_OUTPUT.PUT_LINE('���ŵ� ���� �� :' || SQL%ROWCOUNT);
    
    IF(SQL%FOUND) THEN
        DBMS_OUTPUT.PUT_LINE('���ŵ� ���� ���� ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('���ŵ� ���� ���� ���� : FALSE');
    END IF;
    
    IF(SQL%ISOPEN) THEN
        DBMS_OUTPUT.PUT_LINE('Ŀ���� ���� ���� : TRUE');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Ŀ���� ���� ���� : FALSE');
    END IF;
END;

SET SERVEROUTPUT ON;

-- ���� - ���� : ������ ����(���� ����) / ��Ÿ�� ����
-- PS/SQL: numeric or value error: character to number conversion error
DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT DNAME INTO v_wrong
    FROM SCOTT.DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('���� �߻��� �� ������ ������� ����');
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
END;
/

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT DNAME INTO v_wrong
    FROM SCOTT.DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('���� �߻��� �� ������ ������� ����');
EXCEPTION
    WHEN TOO_MANY_ROWS THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
    WHEN VALUE_ERROR THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ��ġ �Ǵ� �� ���� �߻�');
END;
/

DECLARE
    v_wrong NUMBER;
BEGIN
    SELECT DNAME INTO v_wrong
    FROM scott.DEPT
    WHERE DEPTNO = 10;
    
    DBMS_OUTPUT.PUT_LINE('���� �߻��� �� ������ ������� ����');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('���� ó�� : ���� ���� �� ���� �߻�');
        DBMS_OUTPUT.PUT_LINE('SQLCODE : '||TO_CHAR(SQLCODE));
        DBMS_OUTPUT.PUT_LINE('SQLERRM : '||SQLERRM);
END;
/

-- ���� ���� ���α׷� : ����Ŭ ���� �����ؼ� �ʿ��� ��(�ٸ� �������α׷�����) ȣ�� ����
-- 1) ���� ���ν���
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

-- ���ν��� ����
EXECUTE pro_noparam;

-- ������ ���ν����� �����ϴ� ��� ���� �ۼ��� �������� ��ü
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

-- ���ν��� ����
EXECUTE pro_noparam;

-- �ٸ� PL/SQL ��Ͽ��� ����
BEGIN
    pro_noparam;
END;
/

-- �Ķ���� ó��(IN) : �Ķ���͸� �޾Ƽ� ����.
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
-- �Ķ���� �� �־��ֱ�
EXECUTE pro_param_in(1,2,9,8);

EXECUTE pro_param_in(1,2);

-- wrong number or types of arguments in call to 'PRO_PARAM_IN'
EXECUTE pro_param_in(1);

-- �Ķ���� ó��(OUT : ����)
CREATE OR REPLACE PROCEDURE pro_param_out
    (
        in_empno IN scott.emp.empno%TYPE, -- IN(DEFAULT)
        out_ename OUT scott.emp.ename%TYPE, -- OUT(���ν��� ���� �� ȣ���� ���α׷����� �� ��ȯ)
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

EXECUTE register_user('������', '1996', '�λ��', '01045678965');
select * from userTBL where username='������';

--------------------------------------------------------------------------------
-- �ǽ�[���ν��� ����]
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
    DBMS_OUTPUT.PUT_LINE('�μ���ȣ : ' ||v_deptno);
    DBMS_OUTPUT.PUT_LINE('�μ��� : ' ||v_dname);
    DBMS_OUTPUT.PUT_LINE('SAL : '||v_loc);
END;
/

-- Ʈ����(TRIGGER) : �����ͺ��̽� ���� Ư�� ��Ȳ�̳� ����, �� �̺�Ʈ�� �߻��� ���
-- �ڵ����� ����Ǵ� ���

-- �����Ϳ� ������ ���� �۾��� �����ϱ� ���� ���� PL/SQL �� �Ǵ� ���� ���ν����� ������
-- �������� �ʾƵ� ��

-- ���� ����ڰ� �����ϴ� ������ ���ȼ��� ������ �߱�

-- Ʈ���� ��� ����
-- DML, DDL, �����ͺ��̽� ���۰� ���õ� ����

CREATE TABLE EMP_TRG
AS SELECT * FROM SCOTT.EMP; 

SELECT * FROM emp_trg;

-- DML Ʈ����
CREATE OR REPLACE TRIGGER TRG_EMP_NODML_WEEKEND
BEFORE -- AFTER(Ʈ���� ���� ����)
INSERT OR UPDATE OR DELETE ON EMP_TRG
BEGIN
    IF TO_CHAR(SYSDATE, 'DY') in ('��', '��') THEN
        IF INSERTING THEN
            raise_application_error(-20000, '�ָ� ������� �߰� �Ұ�');
        ELSIF UPDATING THEN
            raise_application_error(-20001, '�ָ� ������� ���� �Ұ�');
        ELSIF DELETING THEN
            raise_application_error(-20002, '�ָ� ������� ���� �Ұ�');
        ELSE
            raise_application_error(-20003, '�ָ� ������� ���� �Ұ�');
        END IF;
    END IF;
END;
/

UPDATE emp_trg SET SAL = 4000 WHERE EMPNO = 7782;

INSERT INTO emp_trg
VALUES(9000,'test', 'manager', null, sysdate, null, null, 10);

-- �α� ��� ���̺�
CREATE TABLE EMP_TRG_LOG( 
    tablename VARCHAR2(10),     -- DML �۾��� ����� ���̺� ��
    dml_type VARCHAR2(10),      -- DML ��ɾ��� ����
    empno NUMBER(4),            -- DML ����� �� �����ȣ
    user_name VARCHAR2(30),     -- DML�� ������ USER ��
    chage_date DATE);           -- DML�� ����� ��¥


CREATE OR REPLACE TRIGGER TRG_EMP_LOG
AFTER -- AFTER(Ʈ���� ���� ����)
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

