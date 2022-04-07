-- 테이블 생성
create table shop(
                     name varchar2(25) primary key,     -- 매장 이름
                     addr varchar2(2000) not null,        -- 매장 주소
                     tel varchar2(100)                      -- 매장 전화번호
);

-- 개별 조회
select * from shop where name = ?;

-- 리스트 조회
select * from(select ROWNUM rn, tt.* from(select * from shop order by name asc)tt)
where rn >= ? and rn <= ?;

-- 전체 갯수 조회
select count(*) as cnt from shop;

-- 추가
insert into shop values(?,?,?);

-- 삭제
delete from shop where name = ?;

-- 테이블 삭제
drop table shop purge;

-- 내용 수정
update shop set name = ?, addr = ?, tel = ? where name = ?;

