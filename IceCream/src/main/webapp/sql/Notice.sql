-- notice(공지사항)
create table notice(
	notice_seq number primary key,
    title varchar2(100) not null,
    content varchar2(2000) not null,
    hit number default 0,
    logTime varchar2(25) not null,
    fileName varchar2(2000)
);

create sequence notice_seq nocycle nocache;

select * from notice where notice_seq=1;
select count(*) from notice;

insert into notice values (notice_seq.nextval, '제목1', '내용1', 0, sysdate, '파일1');

update notice set title='', content='', hit=?, logTime='', fileName='' where notice_seq=?;
update notice set hit = hit+1 where notice_seq=?;

delete notice where notice_seq=?;