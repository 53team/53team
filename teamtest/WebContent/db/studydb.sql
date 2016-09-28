create table study_member(
	ID varchar2(20) primary key,
	PWD varchar2(20) not null,
	name varchar2(20) not null,
	phone varchar2(20) not null,
	location varchar2(20) not null,
	reg_date date not null
)
select * from STUDY_MEMBER;
select count(*) from study_member

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
	re_writer varchar2(20) not null,
	re_content varchar2(300) not null,
	re_reg_date date not null,
	reply_num number(7)
)
select * from STUDY_REPLYBOARD;
create table study_replyboard(
	re_num number(7) primary key,
	re_writer varchar2(20) not null,
	re_content varchar2(300) not null,
	re_reg_date date not null,
	reply_num number(7) references study_freeboard(num)
)

select * from study_replyboard
delete from study_replyboard where re_content like 'a'

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
drop sequence replyboard_num
delete from STUDY_FREEBOARD;
insert into study_freeboard(num, writer, subject, content, reg_date) values (freeboard_num.nextVal, 's', 'fir', 'success!!!!!', '2016-09-20'); 
select * from (select rownum r, num, writer, subject, content, reg_date, readnum  from study_freeboard) where r>=1 and r<=12
select * from (select rownum r, id, pwd, phone, location, reg_date from study_member) where r>=1 and r<=10 order by reg_date desc
select * from (select rownum r, num, writer, subject, content, reg_date, readnum from (select * from study_freeboard where subject like '%헤%' order by num desc)) where r>=1 and r<=10;
delete from study_member;
select * from (select rownum r, num, writer, subject, content, reg_date, readnum  from study_freeboard) where r>=1 and r<=10 order by reg_date desc
select * from (select rownum r, num, writer, subject, content, reg_date, readnum  from study_freeboard) where r>=1 and r<=60 order by reg_date asc
select * from (select rownum r, id, pwd, name, phone, location, reg_date from study_member) where r>=1 and r<=10 and id not like 'admin' order by reg_date desc
select * from (select rownum r, id, pwd, name, phone, location, reg_date from study_member) where r>=1 and r<=10 and id not like 'admin'order by reg_date desc
insert into study_replyboard (re_writer, re_content, re_reg_date, reply_num) values ('a', 'a', '2016-09-20', 1);
select * from (select rownum r, re_writer, re_content, re_reg_date, reply_num from study_replyboard) where r>=1 and r<=10 order by re_reg_date desc
select count(*) from study_replyboard
select * from (select rownum r, re_writer, re_content, re_reg_date, reply_num from study_replyboard) where r>=? and r<=? order by re_reg_date desc
select * from study_replyboard where reply_num='152'
select count(*) from study_replyboard