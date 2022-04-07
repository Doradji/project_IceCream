-- 테이블 생성
create table account (
    id varchar2(25) primary key,        -- 아이디
    pass varchar2(25) not null,         -- 비밀번호
    accountType varchar2(25) not null,  -- 계정타입
    join varchar2(25) not null,         -- 가입날짜
    gender varchar2(25) not null,       -- 성별
    tel varchar2(25),                   -- 전화번호
    addr varchar2(100),                 -- 주소
    email varchar2(100),                -- 이메일
    birth varchar2(25)                  -- 생일
);

-- 테이블 목록
select * from tab;

-- 테이블 삭제
drop table account purge;

-- insert
insert into account values('aa', '1234', '2', sysdate,
'여', '010-1111-2222', '서울시 강남구 서초동', 'aa@naver.com', '2022.04.07');
insert into account values('bb', '1234', '2', sysdate,
'여', '010-1111-2222', '서울시 강남구 서초동', 'aa@naver.com', '2022.04.07');

-- select(개별 조회)
select * from account;

-- select 리스트 조회(페이징처리)
select * from
(select rownum rn, tt.* from
(select * from account order by id asc) tt)
where rn>=1 and rn<=10;

-- select 게시물 전체 갯수
select count(*) as cnt from account;

-- update
update account set email='bb@naver.com' where id='aa';

-- delete
delete account where id='aa';