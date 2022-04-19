-- 테이블 생성
create table shop
(
    name varchar2(25) not null, -- 매장 이름
    addr varchar2(2000) not null,  -- 매장 주소
    tel  varchar2(100),            -- 매장 전화번호
    num number primary key          -- 매장 번호
);

-- 시퀀스 추가
create sequence shop_seq nocycle nocache;

-- 개별 조회
select *
from shop
where name = ?;

-- 리스트 조회
select *
from (select ROWNUM rn, tt.* from (select * from shop order by name asc) tt)
where rn >= ?
  and rn <= ?;

-- 전체 갯수 조회
select count(*) as cnt
from shop;

-- 추가
insert into shop
values (SHOP_SEQ.nextval ,?, ?, ?);

-- 삭제
delete
from shop
where num = 2;

-- 테이블 삭제
drop table shop purge;

-- 내용 수정
update shop
set name = ?,
    addr = ?,
    tel  = ?
where num = ?;

-- 전체 검색
select * from shop;

-- 특정 이름으로 검색 -- %검색어% 해야됨
select *
from (select ROWNUM rn, tt.* from (select * from shop where name like '%'||?||'%' order by name asc) tt)
where rn >= ?
  and rn <= ?;
-- 특정 이름 검색 후 갯수 확인
select count(*) as cnt from shop where name like '%'||?||'%';


