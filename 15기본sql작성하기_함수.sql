--오라클 내장함수
--1. 집계함수
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

--1)국어 점수의 합계를 구한다
select sum(kor) + sum(eng) + sum(mat) 총합계 from score;

--2)국어점수의 평균 구하기
select avg(kor) 국어평균 from score;
--3)영어점수의 최대
select max(eng) 영어최대 from score;

--4)수학점수의 최소
select min(mat) 수학최소 from score;

--name 칼럼을 추가하고, 적당한 이름을삽입하시오.
--국어점수 중 임의로 2개를 null로 수정하시오.
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

--2. 문자 I함수
--1)대소문자 관련 함수
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

--7) 문자열 연결 함ㅅ
--연산자 || 는 or이 아ㅣ라, 연결 연산자 입니다.

select name || ' ' || kor || ' ' || eng || ' ' || mat from score;

select concat(concat(name, ' '), kor) from score;
--8) 불필요한 문자열 제거 함수( 좌우만 가능하고, 중간에 포함된 건 불가능)
--공백 제거 위주로 본다.
select ltrim(name) from score;

select substr(name, 1, instr

