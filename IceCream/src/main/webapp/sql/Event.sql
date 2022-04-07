-- event(이벤트)			
create table event (
	event_seq number primary key,
    title    varchar2(100) not null,
    content  varchar2(2000) not null,
    hit number default 0,
    logTime varchar2(25) not null,
    fileName varchar2(2000)
);

create sequence event_seq nocycle nocache;

select * from event where event_seq=1;
select count(*) from event;

insert into event values (event_seq.nextval, '제목1', '내용1', 0, sysdate, '파일1');

update event set title='', content='', hit=?, logTime='', fileName='' where event_seq=?;
update event set hit = hit+1 where event_seq=?;

delete event where event_seq=?;

