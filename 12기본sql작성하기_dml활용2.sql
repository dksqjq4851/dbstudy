create table professor(
    professor_no varchar2(15),
    professor_name varchar2(10),
    professor_class varchar2(20)
);

create table student(
    student_no varchar2(15),
    student_name varchar2(10),
    student_address varchar2(30),
    student_year number,
    professor_no varchar2(15)
);
create table course(
    course_no varchar2(15),
    course_name varchar2(15),
    course_score number
);

create table enroll(
    enroll_no varchar2(15),
    student_no varchar2(15),
    course_no varchar2(15),
    enroll_date date
);

create table lecture(
    lecture_no varchar2(15),
    professor_no varchar2(15),
    enroll_no varchar2(15),
    lecture_name varchar2(20),
    lecture_room varchar2(15)
);

alter table professor add constraint professor_pk primary key (professor_no);
alter table student add constraint student_pk primary key (student_no);
alter table student add constraint student_professor_fk foreign key (professor_no) references professor (professor_no);
alter table course add constraint course_pk primary key (course_no);
alter table enroll add constraint enroll_pk primary key (enroll_no);
alter table enroll add constraint enroll_student_fk foreign key (student_no) references student (student_no);
alter table enroll add constraint enroll_course_fk foreign key (course_no) references course(course_no);
alter table lecture add constraint lecture_pk primary key (lecture_no);
alter table lecture add constraint lecture_professor_fk foreign key (professor_no) references professor(professor_no);
alter table lecture add constraint lecture_enroll_fk foreign key (enroll_no) references enroll(enroll_no);

--drop table lecture;
--drop table enroll;
--drop table course;
--drop table student;
--drop table professor;


insert into professor values ('101', '김병천', 'db');
insert into professor values ('102', '김숙연', '알고리즘');
insert into professor values ('103', '김미희', '네트워크');

insert into student values ('101', '양기정', '안성', 4, '101');
insert into student values ('102', '양기정', '안성', 3, '101');
insert into student values ('103', '양기정', '대구', 1, '103');

insert into course values('101', '인공지능', 3);
insert into course values('102', '자료구조', 1);
insert into course values('103', '프레임워크', 2);

insert into enroll values('101', '101', '101', '21/04/01');
insert into enroll values('102', '101', '102', '21/04/02');
insert into enroll values('103', '103', '101', '21/03/31');

insert into lecture values('101', '101', '101', 'db배우기', 'n306');
insert into lecture values('102', '102', '102', '알고배우기', 'o306');
insert into lecture values('103', '103', '103', '넽웤배우기', 'n308');

alter table lecture modify lecture_name  varchar2(30);
update lecture set lecture_name = '알고리즘배우기' where enroll_no = '102';
update lecture set lecture_name = '네트워크배우기' where enroll_no = '103';

commit;
