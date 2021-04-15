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

insert into department (dept_no, dept_name, location) values (1, '������', '�뱸');
insert into department (dept_no, dept_name, location) values (2, '�λ��', '����');
insert into department (dept_no, dept_name, location) values (3, '�ѹ���', '�뱸');
insert into department (dept_no, dept_name, location) values (4, '��ȹ��', '����');


--��¥ Ÿ�� �ۼ� ���
--1. '2021-04-02'
--2. '21-04-02'
--3. '2021/04/02'
--4. '21/04/02' --����Ŭ �⺻��
insert into employee values (1001, '��â��' , 1, '����' , 'M', '95-05-01', 5000000);
insert into employee values (1002, '��μ�' , 1, '���' , 'M', '17-09-01', 2500000);
insert into employee values (1003, '������' , 2, '����' , 'F', '90-09-01', 5500000);
insert into employee values (1004, '�Ѽ���' , 2, '����' , 'F', '93-04-01', 5000000);

--�� ����
--1. �������� ��ġ�� ��õ���� �����Ͻÿ�.
update department set location = '��õ' where dept_no = 1;--where�������� �����ϸ� pk�� ����ϴ°��� ����.
--2. ����� ������ ������ 10% �λ��Ͻÿ�
update employee set salary = salary*1.1 where salary>=5000000;

--3.�ѹ��� -> �Ѱ���, �뱸 -> ���� �� �����Ͻÿ�.
update department set location = '����', dept_name = '�Ѱ���' where dept_no = 3;






--�� ����
--1.��� employee �� �����Ѵ�.
delete from employee; -- �ѹ����� ������ �����մϴ�.
--2.��ȹ�θ� �����Ѵ�.
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

insert into department (dept_no, dept_name, location) values (1, '������', '�뱸');
insert into department (dept_no, dept_name, location) values (2, '�λ��', '����');
insert into department (dept_no, dept_name, location) values (3, '�ѹ���', '�뱸');
insert into department (dept_no, dept_name, location) values (4, '��ȹ��', '����');


--��¥ Ÿ�� �ۼ� ���
--1. '2021-04-02'
--2. '21-04-02'
--3. '2021/04/02'
--4. '21/04/02' --����Ŭ �⺻��
insert into employee values (1001, '��â��' , 1, '����' , 'M', '95-05-01', 5000000);
insert into employee values (1002, '��μ�' , 1, '���' , 'M', '17-09-01', 2500000);
insert into employee values (1003, '������' , 2, '����' , 'F', '90-09-01', 5500000);
insert into employee values (1004, '�Ѽ���' , 2, '����' , 'F', '93-04-01', 5000000);

--�� ����
--1. �������� ��ġ�� ��õ���� �����Ͻÿ�.
update department set location = '��õ' where dept_no = 1;--where�������� �����ϸ� pk�� ����ϴ°��� ����.
--2. ����� ������ ������ 10% �λ��Ͻÿ�
update employee set salary = salary*1.1 where salary>=5000000;

--3.�ѹ��� -> �Ѱ���, �뱸 -> ���� �� �����Ͻÿ�.
update department set location = '����', dept_name = '�Ѱ���' where dept_no = 3;




--�� ����
--1.��� employee �� �����Ѵ�.
delete from employee; -- �ѹ����� ������ �����մϴ�.
--2.��ȹ�θ� �����Ѵ�.
delete from department where dept_no = 4;







>>>>>>> 3ab24fe7a8892d50c96c087fb5395e3e58472f78
