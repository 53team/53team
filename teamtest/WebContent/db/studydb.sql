create table study_member(
	ID varchar2(20) primary key,
	PWD varchar2(60) not null,
	name varchar2(20) not null,
	phone varchar2(20) not null,
	location varchar2(20) not null,
	reg_date date not null
)
create table study_freeboard(
	num number(7) primary key,
	writer varchar2(20) not null,
	subject varchar2(50) not null,
	content varchar2(2000) not null,
	reg_date date not null,
	readnum number(3) default 0
) SEGMENT creation IMMEDIATE;
create table study_notice(
	num number(7) primary key,
	writer varchar2(20) not null,
	subject varchar2(50) not null,
	content varchar2(2000) not null,
	reg_date date not null,
	readnum number(3) default 0
) SEGMENT creation IMMEDIATE;
create table study_replyboard(
	re_num number(7) primary key,
	re_writer varchar2(20) not null,
	re_content varchar2(2000) not null,
	re_reg_date date not null,
	reply_num number(7)
)
create table study_room(
	num number(7) primary key,
	location varchar2(20) not null,
	id varchar2(20) not null,
	title varchar2(100) not null,
	sub_title varchar2(50) not null,
	limit number(3) not null,
	reg_date timestamp not null,
	category varchar2(30) not null
) SEGMENT creation IMMEDIATE;
create table room_reg(
	id varchar2(20),
	sub_id varchar2(200),
	limit number(3),
	count number(3) default 1
)
create table hotissue(
	category varchar2(30) not null,
	count number(4)
)

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
create sequence studyroom_num
	increment by 1
	start with 1
	nocache;
	
select * from study_member;
select * from study_freeboard;
select * from study_notice;
select * from study_replyboard;
select * from study_room;
select * from room_reg;
select * from hotissue;

drop table study_member;
drop table study_freeboard;
drop table study_notice;
drop table study_replyboard;
drop table study_room;
drop table room_reg;
drop table hotissue;

drop sequence freeboard_num;
drop sequence notice_num;
drop sequence replyboard_num;
drop sequence studyroom_num;