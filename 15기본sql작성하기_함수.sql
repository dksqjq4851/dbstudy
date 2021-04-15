--����Ŭ �����Լ�
--1. �����Լ�
drop table score;
create table score(
    kor number(3),
    eng number(3),
    mat number(3)
);

insert into score values(10, 10,10);
insert into score values(20, 20,20);
insert into score values(30, 30,30);
insert into score values(40, 40,40);
insert into score values(50,50,100);

--1)���� ������ �հ踦 ���Ѵ�
select sum(kor) + sum(eng) + sum(mat) ���հ� from score;

--2)���������� ��� ���ϱ�
select avg(kor) ������� from score;
--3)���������� �ִ�
select max(eng) �����ִ� from score;

--4)���������� �ּ�
select min(mat) �����ּ� from score;

--name Į���� �߰��ϰ�, ������ �̸��������Ͻÿ�.
--�������� �� ���Ƿ� 2���� null�� �����Ͻÿ�.
alter table score add name varchar(20);
update score set name = 'JADU' where kor = 10;
update score set name = 'jjanggu' where kor = 20;
update score set name = 'WILK' where kor = 30;
update score set name = 'ddoongi' where kor = 40;
update score set name = 'CHOCO' where kor = 50;

update score set kor = null where name = 'WILK';
update score set kor = null where name = 'jjanggu';

select count(name) from score;

select count(kor) from score;

select count(*) from score;

--2. ���� I�Լ�
--1)��ҹ��� ���� �Լ�
select initcap(name) from score;
select upper(name) from score;
select lower(name) from score;

select length(name) from score;

select substr(name, 2, 3) from score;

select instr(upper(name), 'J') from score;

select lpad(name , 10, '*') from score;

select rpad(name, 10, '^') from score; 

select lpad(name, 10, ' ')from score;

select rpad(substr(name, 1, 2), length(name), '*')from score;
-- jadu : JA**
-- jjanggu : jj******
-- wilk : wi**
--ddonggi : dd*****
--choco : ch*****

--7) ���ڿ� ���� �Ԥ�
--������ || �� or�� �ƤӶ�, ���� ������ �Դϴ�.

select name || ' ' || kor || ' ' || eng || ' ' || mat from score;

select concat(concat(name, ' '), kor) from score;
--8) ���ʿ��� ���ڿ� ���� �Լ�( �¿츸 �����ϰ�, �߰��� ���Ե� �� �Ұ���)
--���� ���� ���ַ� ����.
select ltrim(name) from score;

select substr(name, 1, instr

