drop table board;
drop table members;

create table members
(
	mno number,
	mid varchar2(30) not null,
	mname varchar2(30),
	memail varchar2(100),
	mdate date
	);
alter table members add constraint members_pk primary key (mno);
alter table members add constraint members_mid_uq unique (mid);
alter table members add constraint members_memail_uq unique(memail);
	
create sequence members_seq
increment by 1
start with 1
nomaxvalue
nominvalue
nocycle
nocache;

select mno
     , mid
     , mname
     , memail
     , mdate
  from MEMBERS
 ORDER BY mno desc;