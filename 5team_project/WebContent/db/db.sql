create table study_member(
	ID varchar2(20) primary key,
	PWD varchar2(20) not null,
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
	
	select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, r 
	from(select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip, rownum r 
		from(select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip 
			from board order by ref desc, re_step asc) order by ref desc, re_level asc) where r>=start and r<=end;