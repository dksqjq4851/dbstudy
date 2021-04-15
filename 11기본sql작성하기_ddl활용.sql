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
--���̕���Ȯ��
desc bank;
desc customer;

--���̺���
--Į���� ����
--alter table ���̺� add Į���� Ÿ��;
--1. bank ���̺� bank_phone Ÿ���� �߰��Ѵ�.
alter table bank add bank_phone varchar2(15);

--Į���� ����
--alter table ���̺� modify �÷��� Ÿ��;
--1. bank ���̺��� bank_name Į����varchar2(15)�� �����Ѵ�.
alter table bank modify bank_name varchar2(15);

--2. customer ���̺��� age Į����  number(3)���� �����Ѵ�.
alter table customer modify age number(3);

--3. customer���̺��� phone Į���� not null�� �����Ѵ�.
alter table customer modify phone varchar2(30) not null;

--4. customer ���̺��� phone Į���� null�μ����Ѵ�.

alter table customer modify phone varchar2(30) null;

--Į���� ����
--alter table ���̺� drop column Į����;
--1.bank ���̺��� bank_phone Į���� �����Ѵ�.
alter table bank drop column bank_phone;

--Į���� �̸� ����
--alter table ���̺� rename �⺻Į���� to �ű�Į����
alter table customer rename  column phone to contact;



--alter table ���̺�(add, remove, modify ��)
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

--���̺���
--alter table ���̺�(add, remove, modify ��)
alter table bank add constraint bank_pk primary key(bank_code);
alter table customer add constraint customer_pk primary key(no);
alter table customer add constraint customer_phone_uq unique(phone);
alter table customer add constraint customer_age_ck check(age between 0 and 100);
alter table customer add constraint customer_bank_fk foreign key(bank_code) references bank(bank_code);
>>>>>>> 3ab24fe7a8892d50c96c087fb5395e3e58472f78
