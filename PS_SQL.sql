--HR 계정의 EMPLOYEES 테이블을 복사하기
--테이블을 복사하면 PK,FK는 복사되지 않는다.
CREATE TABLE employees
    AS (SELECT * FROM HR.employees);
    
desc user_constraints;

SELECT *
  FROM user_constraints
 WHERE table_name = 'EMPLOYEES';

--복사한 테이블에 기본키 지정하기
alter table employees add constraint employees_pk primary key (employee_id);

--PL/SQL
--접속마다 최초 1회만 하면 된다.
--결과를 화면에 띄우기
SET SERVEROUTPUT ON;

/*기본구성
--DECLARE
        변수 선언;
    BEGIN
        작업;
    END;
*/


--화면출력
BEGIN
    DBMS_OUTPUT.PUT_LINE('HELLO PL/SQL ');
END;

DECLARE
    my_name VARCHAR2(20);
    my_age NUMBER(3);
BEGIN

    my_name := '에밀리';
    my_age := 30;
    DBMS_OUTPUT.PUT_LINE('내 이름은 ' || my_name || '입니다.');
    DBMS_OUTPUT.PUT_LINE('내 나이는' ||my_age||'입니다.');
END;

--변수 선언(참조변수)
--기존의 칼럼의 타입을 그대로 상ㅇ한다.
--계정, 테이블, 칼럼 %TYPE

DECLARE
    v_first_name EMPLOYEES.FIRST_NAME%TYPE;
    v_last_name EMPLOYEES.LAST_NAME%TYPE;
    
BEGIN

    /*SELECT first_name INTO v_first_name
      FROM employees
     WHERE employee_id = 100;
    SELECT last_name INTO v_last_name
      FROM employees
     WHERE employee_id = 100;
     */
    SELECT first_name, last_name
      INTO v_first_name, v_last_name
      FROM employees
     WHERE employee_id = 100;
    DBMS_OUTPUT.PUT_LINE(v_first_name || ' ' || v_last_name);
END;



--IF문
DECLARE
    score NUMBER(3);
    grade CHAR(1);
BEGIN
    score := 50;
    IF score >= 90 THEN
        grade := 'A';
    ELSIF score >= 80 THEN
        grade := 'B';
    ELSIF score >= 70 THEN
        grade := 'C';
    ELSIF score >= 60 THEN
        grade := 'D';
    ELSE
        grade := 'F';
    END IF;
    DBMS_OUTPUT.PUT_LINE('점수는'||score||'이고 학점은'||grade||'입니다.');
END;


--CASE문
DECLARE
    score NUMBER(3);
    grade CHAR(1);
BEGIN
    score := 90;
    CASE
        WHEN score >= 90 THEN
            grade := 'A';
        WHEN score >= 80 THEN
            grade := 'B';
        WHEN score >= 70 THEN
            grade := 'C';
        WHEN score >= 60 THEN
            grade := 'D';
        ELSE
            grade := 'F';
    END CASE;
    DBMS_OUTPUT.PUT_LINE('점수는'||score||'이고 학점은'||grade||'입니다.');
END;


--문제 . 사원번호가 200인 사원의 연봉을 가져와서,
-- 5000이상이면 '고액연봉자',아니면 공백을 출력하시오


--WHILE 문
--1~100
DECLARE
    n NUMBER(3);
    total NUMBER(4);
BEGIN
    n := 1;
    total := 0;
    WHILE n <= 100 LOOP
        total := total + n;
        n := n+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합계:' || total);
END;


--FOR문
DECLARE
    n NUMBER(3);
    total NUMBER(4);
BEGIN
    total:=0;
    FOR n IN 1 .. 100 LOOP
        total := total +n;
    END LOOP;
        DBMS_OUTPUT.PUT_LINE('합계:' || total);
END;


--EXIT문 (java의 break문)
--1부터 누적합계를 구하다 최초 누적합계가 3000이상인경우

DECLARE
    n NUMBER(3);
    total NUMBER(4);
BEGIN
    n := 1;
    total := 0;
    WHILE TRUE LOOP
    total := total +n;
    IF total >= 3000 THEN
        EXIT;
        
        END IF;
        n := n+1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합계:' || total);
END;


DECLARE
    n NUMBER(3);
    total NUMBER(4);
BEGIN
    n := 1;
    total := 0;
    WHILE n <= 100 LOOP
        n := n+1;
        IF MOD(n, 2) = 1 THEN --n이 홀수이면 
            CONTINUE;
        END IF;
        total := total + n;
        
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('합계:' || total);
END;

DECLARE
    i NUMBER;
    TYPE first_name_type IS TABLE OF EMPLOYEES.FIRST_NAME%TYPE INDEX BY BINARY_INTEGER;
    first_names first_name_type;
BEGIN
    i := 0;
    FOR v_row IN (SELECT first_name FROM employees) LOOP
    first_names(i) := v_row.first_name;
    DBMS_OUTPUT.PUT_LINE(v_row.first_names(i));
    i := i + 1;
    END LOOP;
END;


--부서번호(department_id)가 50인 부서의 first_name, last_name 을 가져와서
--새로운 테이블 employees50 에 삽입하시오.

    CREATE TABLE employees50
        AS (SELECT first_name, last_name FROM employees WHERE 1 = 0);
DECLARE
    v_first_name EMPLOYEES.FIRST_NAME%TYPE;
    v_last_name EMPLOYEES.LAST_NAME%TYPE;
BEGIN 

    FOR v_row IN (SELECT first_name, last_name FROM employees WHERE department_id = 50) LOOP
        v_first_name := v_row.first_name;
        v_last_name := v_row.last_name;
        INSERT INTO employees50(first_name, last_name) VALUES(v_row.first_name, v_row.last_name);
    END LOOP;
    COMMIT;
END;
    SELECT first_name, last_name FROM employees50;

--레코드 타입
--여러 컬럼(열)이 모여서 하나의 레코드(행, row)가 된다.
--여러데이터를 하나로 모으는 개념 : 객채의 하위 개념 -> 구조체

DECLARE
    TYPE person_type IS RECORD
    (
        my_name VARCHAR2(20),
        my_age NUMBER(3)
    );
    man person_type;
    woman person_type;
BEGIN
    man.my_name := '제임스';
    man.my_age := 20;
    DBMS_OUTPUT.PUT_LINE(man.my_name ||' ' ||man.my_age);
END;

--테이블형 레코드 타입;
TRUNCATE TABLE employees50;--구조는 남기고, 레코드만 모두 삭제하기 ( 복구가 안됨)

DECLARE
    employee EMPLOYEES%ROWTYPE; --EMPLOYEES테이블의 ROW전체를 저장할수있는 변수
    
BEGIN
    SELECT *
      INTO employee
      FROM EMPLOYEES
     WHERE department_id = 50;
    INSERT INTO employees50(first_name, last_name) VALUES (employee.frist_name, employee.last_name);
END;

SELECT first_name, last_name FROM employees50;













