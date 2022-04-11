create table product(    
	num number primary key, --제품번호
	name varchar2(25) not null, --제품명
	explain varchar2(200) not null,--제품설명
	fileName varchar2(2000),--첨부파일
	productType varchar2(25)--제품타입 

);
--2)테이블삭제
drop table product purge;
--3)테이블 확인
select* from tab;

-- 4) 시퀀스 객체 생성
create sequence seq_product nocache nocycle;

-- 5) 시퀀스 객체 삭제
drop sequence seq_product;
--6)제품 삽입
insert into product values(seq_product.nextval,'aaa','bbb','ccc','ddd');
insert into product values(1,'aaa','bbb','ccc','ddd');
--7)제품목록
select * from
			(select rownum rn,tt.* from
			(select * from product order by num asc) tt)
			where rn>=1 and rn<=5;
            
--8)전체갯수
select count(*) as cnt from product;
--9)특정 조회
select * from product where num=1;
--10)수정
update product set name='aa', explain='bb', fileName='aa', productType='bb' 
where num=1;
--11)삭제
delete from product where num=1;
-12)저장
commit;
--13)전체확인
select *from product;