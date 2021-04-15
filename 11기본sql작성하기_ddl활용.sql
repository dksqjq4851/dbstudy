<<<<<<< HEAD
drop table customer;
drop table bank;

create table bank
(
    bank_code varchar2(20),
    bank_name varchar2(30)
);

create table customer
(
    no number,
    name varchar2(30) not null,
    phone varchar2(30) ,
    age number,
    bank_code varchar2(20)
);
--테이븕조확인
desc bank;
desc customer;

--테이블변경
--칼럼의 ㅊ가
--alter table 테이블 add 칼러명 타입;
--1. bank 테이블에 bank_phone 타입을 추가한다.
alter table bank add bank_phone varchar2(15);

--칼럼의 수정
--alter table 테이블 modify 컬럼명 타입;
--1. bank 테이블의 bank_name 칼럼을varchar2(15)로 수정한다.
alter table bank modify bank_name varchar2(15);

--2. customer 테이블의 age 칼럼을  number(3)으로 수정한다.
alter table customer modify age number(3);

--3. customer테이블의 phone 칼럼을 not null로 수장한다.
alter table customer modify phone varchar2(30) not null;

--4. customer 테이블의 phone 칼럼을 null로수정한다.

alter table customer modify phone varchar2(30) null;

--칼럼의 삭제
--alter table 테이블 drop column 칼럼명;
--1.bank 테이블의 bank_phone 칼럼을 삭제한다.
alter table bank drop column bank_phone;

--칼럼의 이름 변경
--alter table 테이블 rename 기본칼럼명 to 신규칼럼명
alter table customer rename  column phone to contact;



--alter table 테이블(add, remove, modify 등)
alter table bank add constraint bank_pk primary key(bank_code);
alter table customer add constraint customer_pk primary key(no);
alter table customer add constraint customer_phone_uq unique(phone);
alter table customer add constraint customer_age_ck check(age between 0 and 100);
alter table customer add constraint customer_bank_fk foreign key(bank_code) references bank(bank_code);


=======
drop table customer;
drop table bank;

create table bank
(
    bank_code varchar2(20),
    bank_name varchar2(30)
);

create table customer
(
    no number,
    name varchar2(30) not null,
    phone varchar2(30) ,
    age number,
    bank_code varchar2(20)
);

--테이블변경
--alter table 테이블(add, remove, modify 등)
alter table bank add constraint bank_pk primary key(bank_code);
alter table customer add constraint customer_pk primary key(no);
alter table customer add constraint customer_phone_uq unique(phone);
alter table customer add constraint customer_age_ck check(age between 0 and 100);
alter table customer add constraint customer_bank_fk foreign key(bank_code) references bank(bank_code);
>>>>>>> 3ab24fe7a8892d50c96c087fb5395e3e58472f78
