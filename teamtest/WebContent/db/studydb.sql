create table study_member(
	ID varchar2(20) primary key,
	PWD varchar2(60) not null,
	name varchar2(20) not null,
	phone varchar2(20) not null,
	location varchar2(20) not null,
	reg_date date not null
)
select * from STUDY_MEMBER;
drop table study_member;



create table study_freeboard(
	num number(7) primary key,
	writer varchar2(20) not null,
	subject varchar2(50) not null,
	content varchar2(2000) not null,
	reg_date date not null,
	readnum number(3) default 0
) SEGMENT creation IMMEDIATE;
select * from STUDY_FREEBOARD;
drop table study_freeboard;



create table study_notice(
	num number(7) primary key,
	writer varchar2(20) not null,
	subject varchar2(50) not null,
	content varchar2(2000) not null,
	reg_date date not null,
	readnum number(3) default 0
) SEGMENT creation IMMEDIATE;
select * from study_notice;
drop table study_notice;



create table study_replyboard(
	re_num number(7) primary key,
	re_writer varchar2(20) not null,
	re_content varchar2(300) not null,
	re_reg_date date not null,
	reply_num number(7)
)
select * from study_replyboard
drop table study_replyboard
delete from STUDY_REPLYBOARD



create table study_room(
	location varchar2(20) not null,
	id varchar2(20) not null,
	title varchar2(100) not null,
	sub_title varchar2(50) not null,
	limit number(3) not null,
	reg_date date not null,
	category varchar2(30) not null
) SEGMENT creation IMMEDIATE;
select * from study_room
drop table study_room



create sequence freeboard_num
	increment by 1
	start with 1
	nocache;
	
create sequence notice_num
	increment by 1
	start with 1
	nocache;
	
create sequence replyboard_num
	increment by 1
	start with 1
	nocache;