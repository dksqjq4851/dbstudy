<<<<<<< HEAD
drop table employee;
drop table department;

create table department(
    dept_no number,
    dept_name varchar2(15) not null,
    location varchar2(15) not null
);



create table employee(
    emp_no number,
    name varchar2(20) not null,
    depart number,
    position varchar2(20),
    gender char(2),
    hire_date date,
    salary number
    );

desc employee;
alter table department add constraint deparment_pk primary key (dept_no);
alter table employee add constraint employee_pk primary key(emp_no);
alter table employee add constraint employee_deparment_fk foreign key(depart) references department(dept_no);

insert into department (dept_no, dept_name, location) values (1, '영업부', '대구');
insert into department (dept_no, dept_name, location) values (2, '인사부', '서울');
insert into department (dept_no, dept_name, location) values (3, '총무부', '대구');
insert into department (dept_no, dept_name, location) values (4, '기획부', '서울');


--날짜 타입 작성 방법
--1. '2021-04-02'
--2. '21-04-02'
--3. '2021/04/02'
--4. '21/04/02' --오라클 기본값
insert into employee values (1001, '구창민' , 1, '과장' , 'M', '95-05-01', 5000000);
insert into employee values (1002, '김민서' , 1, '사원' , 'M', '17-09-01', 2500000);
insert into employee values (1003, '이은영' , 2, '부장' , 'F', '90-09-01', 5500000);
insert into employee values (1004, '한성실' , 2, '과장' , 'F', '93-04-01', 5000000);

--행 수정
--1. 영업부의 위치를 인천으로 수정하시오.
update department set location = '인천' where dept_no = 1;--where절에서는 가능하면 pk를 사용하는것이 좋다.
--2. 과장과 부장의 월급을 10% 인상하시오
update employee set salary = salary*1.1 where salary>=5000000;

--3.총무부 -> 총괄팀, 대구 -> 광주 로 수정하시오.
update department set location = '광주', dept_name = '총괄팀' where dept_no = 3;






--행 삭제
--1.모든 employee 를 삭제한다.
delete from employee; -- 롤백으로 복원이 가능합니다.
--2.기획부를 삭제한다.
delete from department where dept_no = 4;







=======
drop table employee;
drop table department;

create table department(
    dept_no number,
    dept_name varchar2(15) not null,
    location varchar2(15) not null
);



create table employee(
    emp_no number,
    name varchar2(20) not null,
    depart number,
    position varchar2(20),
    gender char(2),
    hire_date date,
    salary number
    );

desc employee;
alter table department add constraint deparment_pk primary key (dept_no);
alter table employee add constraint employee_pk primary key(emp_no);
alter table employee add constraint employee_deparment_fk foreign key(depart) references department(dept_no);

insert into department (dept_no, dept_name, location) values (1, '영업부', '대구');
insert into department (dept_no, dept_name, location) values (2, '인사부', '서울');
insert into department (dept_no, dept_name, location) values (3, '총무부', '대구');
insert into department (dept_no, dept_name, location) values (4, '기획부', '서울');


--날짜 타입 작성 방법
--1. '2021-04-02'
--2. '21-04-02'
--3. '2021/04/02'
--4. '21/04/02' --오라클 기본값
insert into employee values (1001, '구창민' , 1, '과장' , 'M', '95-05-01', 5000000);
insert into employee values (1002, '김민서' , 1, '사원' , 'M', '17-09-01', 2500000);
insert into employee values (1003, '이은영' , 2, '부장' , 'F', '90-09-01', 5500000);
insert into employee values (1004, '한성실' , 2, '과장' , 'F', '93-04-01', 5000000);

--행 수정
--1. 영업부의 위치를 인천으로 수정하시오.
update department set location = '인천' where dept_no = 1;--where절에서는 가능하면 pk를 사용하는것이 좋다.
--2. 과장과 부장의 월급을 10% 인상하시오
update employee set salary = salary*1.1 where salary>=5000000;

--3.총무부 -> 총괄팀, 대구 -> 광주 로 수정하시오.
update department set location = '광주', dept_name = '총괄팀' where dept_no = 3;




--행 삭제
--1.모든 employee 를 삭제한다.
delete from employee; -- 롤백으로 복원이 가능합니다.
--2.기획부를 삭제한다.
delete from department where dept_no = 4;







>>>>>>> 3ab24fe7a8892d50c96c087fb5395e3e58472f78
