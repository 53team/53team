create table study_member(
	ID varchar2(20) primary key,
	PWD varchar2(20) not null,
	name varchar2(20) not null,
	phone varchar2(20) not null,
	location varchar2(20) not null,
	reg_date date not null
)
select * from STUDY_MEMBER;

create table study_freeboard(
	num number(7) primary key,
	writer varchar2(20) not null,
	subject varchar2(50) not null,
	content varchar2(2000) not null,
	reg_date date not null,
	readnum number(3) default 0
) SEGMENT creation IMMEDIATE;
select * from STUDY_FREEBOARD;

create table study_gongboard(
	num number(7) primary key,
	writer varchar2(20) not null,
	subject varchar2(50) not null,
	content varchar2(2000) not null,
	reg_date date not null,
	readnum number(3) default 0
) SEGMENT creation IMMEDIATE;

create table study_replyboard(
	num number(7) primary key,
	writer varchar2(20) not null,
	content varchar2(300) not null,
	reg_date date not null,
	reply_num number(7) references study_freeboard(num)
)

create table study_room(
	location varchar2(20) not null,
	id varchar2(20) not null,
	title varchar2(100) not null,
	sub_title varchar2(50) not null,
	limit number(3) not null,
	reg_date date not null,
	category varchar2(30) not null
) SEGMENT creation IMMEDIATE;

create sequence freeboard_num
	increment by 1
	start with 1
	nocache;
	
create sequence gongboard_num
	increment by 1
	start with 1
	nocache;
	
create sequence replyboard_num
	increment by 1
	start with 1
	nocache;

insert into study_freeboard(num, writer, subject, content, reg_date) values (freeboard_num.nextVal, 's', 'fir', 'success!!!!!', '2016-09-20'); 
select * from (select rownum r, num, writer, subject, content, reg_date, readnum  from study_freeboard) where r>=1 and r<=12
select * from (select rownum r, id, pwd, phone, location, reg_date from study_member) where r>=1 and r<=10 order by reg_date desc
select * from (select rownum r, num, writer, subject, content, reg_date, readnum from (select * from study_freeboard where subject like '%헤%' order by num desc)) where r>=1 and r<=10;