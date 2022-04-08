-- 테이블 생성
create table voice (
    id varchar2(25) not null ,        -- 작성자(아이디)
    content varchar2(2000) not null,    -- 내용
    title varchar2(100) not null,       -- 제목
    num number primary key,          -- 글번호
    fileName varchar2(2000),            -- 첨부파일
    voice_re_ref number,                -- 관련 글번호
    voice_re_lev number,                -- 답글 레벨
    voice_re_seq number,                -- 관련글 중 출력 순서
    logTime varchar2(100) not null      -- 작성일
);

-- 테이블 삭제
drop table voice purge;

-- 시퀀스 추가
create sequence voice_seq nocycle nocache;

-- 시퀀스 삭제
drop sequence voice_seq;

-- 게시물 추가
insert into voice values (?, ?, ?, voice_seq.nextval, ?, voice_seq.currval, 0, 0, sysdate);

-- 답글 추가
-- 1. 답글 추가하기전에 기존 re_seq 값 정리
update voice set voice_re_seq = voice_re_seq + 1 where voice_re_ref = ? and voice_re_seq > ?;
-- 2. 답글 추가
insert into voice values (?, ?, ?, voice_seq.nextval, ?, ?, ?, ?, sysdate);

-- 게시물 삭제
delete voice where num = ?;

-- 게시물 조회
select * from voice where num = ?;

-- 게시물 리스트 조회
select * from(select ROWNUM rn, tt.* from (select * from voice order by voice_re_ref desc, voice_re_seq asc)tt)
where rn >= ? and rn <= ?;

-- 게시물 갯수 조회
select count(*) as cnt from voice;

-- 게시물 수정
update voice set content = ?, title = ?, fileName = ? where num = ?;

-- 커밋
commit;

-- 롤벡
rollback;