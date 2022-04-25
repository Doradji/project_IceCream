-- 테이블 생성
create table shop
(
    name varchar2(100) not null, -- 매장 이름
    addr1 varchar2(2000),  -- 우편 번호
    addr2 varchar2(2000),  -- 도로명 주소
    addr3 varchar2(2000),  -- 지번 주소
    addr4 varchar2(2000) not null,  -- 상세 주소
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
values (SHOP_SEQ.nextval ,?, ?, ?, ?, ?, ?);

-- 삭제
delete
from shop
where num = 2;

-- 테이블 삭제
drop table shop purge;

-- 내용 수정
update shop
set name = ?,
    addr1 = ?,
    addr2 = ?,
    addr3 = ?,
    addr4 = ?,
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

update shop set name = '배스킨 라빈스 안양동편마을', tel = '031-425-0101' where num = 10;

commit;


