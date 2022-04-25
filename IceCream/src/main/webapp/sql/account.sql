-- 테이블 생성
create table account (
    id varchar2(25) primary key,        -- 아이디
    pass varchar2(25) not null,         -- 비밀번호
    name varchar2(25) not null,         -- 이름
    accountType varchar2(25) not null,  -- 계정타입
    join varchar2(25) not null,         -- 가입날짜
    gender varchar2(25) not null,       -- 성별
    tel1 varchar2(25),                  -- 전화번호
    tel2 varchar2(25),                  -- 중간전화번호
    tel3 varchar2(25),                  -- 끝전화번호
    addr1 varchar2(100),                -- 우편번호
    addr2 varchar2(100),                -- 도로명주소
    addr3 varchar2(100),                -- 지번주소
    addr4 varchar2(100),                -- 상세주소
    email varchar2(100),                -- 이메일
    birth varchar2(25)                  -- 생일
);

-- 테이블 목록
select * from tab;

-- 테이블 삭제
drop table account purge;

-- insert
insert into account values('aa', '1234', '홍길동', '2', sysdate,
'여', '010', '1111', '2222', '33333','서울시 강남구 서초동','서울시 강남구 서초동',
'22번지','aa@naver.com', '2022.04.07');
insert into account values('bb', '1234', '김철수', '2', sysdate,
'여', '010', '1111', '2222', '33333','서울시 강남구 서초동','서울시 강남구 서초동',
'22번지','aa@naver.com', '2022.04.07');

-- select(개별 조회)
select name from account where id='aa' and pass='1234';

-- select 리스트 조회(페이징처리)
select * from
(select rownum rn, tt.* from
(select * from account order by id asc) tt)
where rn>=1 and rn<=10;

-- select 게시물 전체 갯수
select count(*) as cnt from account;

-- update
update account set pass='2345', name='홍길순', gender='여', tel='010-2222-3333',
 addr2='서울시 강남구 양재동', email='bb@naver.com', birth='2022.04.08' where id='aa';

-- delete
delete account where id='aa';

-- 수정
update account set accountType = 1 where id = 'hgt2768';

commit;