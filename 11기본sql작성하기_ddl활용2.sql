<<<<<<< HEAD
--1.국가 테이블
create table nation(
    nation_code number(3),
    nation_name varchar2(30),
    nation_prev_rank number,
    nation_curr_rank number,
    nation_parti_person number,
    nation_parti_event number
    );
    
--2.종목 테이블
create table event(
    event_code number(5),
    event_name varchar2(30),
    event_info varchar2(1000),
    event_first_year number(4)
    );
    
--3.선수테이블
create table player(
    player_code number(5),
    nation_code number(3),
    event_code number(5),
    player_name varchar2(30),
    player_age number(3),
    player_rank number
    );
    
    
--4 일정테이블
create table schedule(
    nation_code number(3),
    event_code number(5),
    schedule_info varchar2(1000),
    schedule_begin date,
    schedule_end date
    );
    
--각 테이블에 기본키 추가하기
alter table nation add constraint nation_pk primary key (nation_code);
alter table event add constraint event_pk primary key(event_code);
alter table player add constraint player_pk primary key(player_code);
alter table schedule add constraint schedule_pk primary key(nation_code, event_code);

--선수, 일정 테이블에 외래키 추가하기
alter table player add constraint player_nation_fk foreign key(nation_code) references nation(nation_code);
alter table player add constraint player_event_fk foreign key(event_code) references event(event_code);
alter table schedule add constraint schedule_nation_fk foreign key(nation_code) references nation(nation_code);
alter table schedule add constraint schedule_event_fk foreign key(event_code) references event(event_code); 

--제약 조건의 삭제
--alter table 테이블 drop csitraubt  제약조건 
 --nation_pk를 참조하는 외래키를 먼저 지웁니다.
alter table player drop constraint player_nation_fk;
alter table schedule drop constraint schedule_nation_fk;
alter table nation drop constraint nation_pk;


alter table player drop constraint player_event_fk;
alter table schedule drop constraint schedule_event_fk;
alter table event drop constraint event_pk;

alter table player drop constraint player_pk;
alter table schedule drop constraint schedule_pk;

--제약 조건의 확인
--제약조건을 저장하고있는 dd(data dictionary) : user_constraints
desc user_constraints;
select constraint_name, table_name from user_constraints where table_name = 'PLAYER'; --테이블이름은 대문자로 작성해야 합니다.

--제약조건의 비활성화
alter table player disable constraint player_nation_fk;

--제약조건의 활성화
alter table player enable constraint player_nation_fk;


=======
--1.국가 테이블
create table nation(
    nation_code number(3),
    nation_name varchar2(30),
    nation_prev_rank number,
    nation_curr_rank number,
    nation_parti_person number,
    nation_parti_event number
    );
    
--2.종목 테이블
create table event(
    event_code number(5),
    event_name varchar2(30),
    event_info varchar2(1000),
    event_first_year number(4)
    );
    
--3.선수테이블
create table player(
    player_code number(5),
    nation_code number(3),
    event_code number(5),
    player_name varchar2(30),
    player_age number(3),
    player_rank number
    );
    
    
--4 일정테이블
create table schedule(
    nation_code number(3),
    event_code number(5),
    schedule_info varchar2(1000),
    schedule_begin date,
    schedule_end date
    );
    
--각 테이블에 기본키 추가하기
alter table nation add constraint nation_pk primary key (nation_code);
alter table event add constraint event_pk primary key(event_code);
alter table player add constraint player_pk primary key(player_code);
alter table schedule add constraint schedule_pk primary key(nation_code, event_code);

--선수, 일정 테이블에 외래키 추가하기
alter table player add constraint player_nation_fk foreign key(nation_code) references nation(nation_code);
alter table player add constraint player_event_fk foreign key(event_code) references event(event_code);
alter table schedule add constraint schedule_nation_fk foreign key(nation_code) references nation(nation_code);
alter table schedule add constraint schedule_event_fk foreign key(event_code) references event(event_code); 

--제약 조건의 삭제
--alter table 테이블 drop csitraubt  제약조건 
 --nation_pk를 참조하는 외래키를 먼저 지웁니다.
alter table player drop constraint player_nation_fk;
alter table schedule drop constraint schedule_nation_fk;
alter table nation drop constraint nation_pk;


alter table player drop constraint player_event_fk;
alter table schedule drop constraint schedule_event_fk;
alter table event drop constraint event_pk;

alter table player drop constraint player_pk;
alter table schedule drop constraint schedule_pk;

--제약 조건의 확인
--제약조건을 저장하고있는 dd(data dictionary) : user_constraints
desc user_constraints;
select constraint_name, table_name from user_constraints where table_name = 'PLAYER'; --테이블이름은 대문자로 작성해야 합니다.

--제약조건의 비활성화
alter table player disable constraint player_nation_fk;

--제약조건의 활성화
alter table player enable constraint player_nation_fk;


>>>>>>> 3ab24fe7a8892d50c96c087fb5395e3e58472f78
