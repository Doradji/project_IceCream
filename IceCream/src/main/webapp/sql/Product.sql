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
--6)
insert into product values(seq_product.nextval,'aaa','bbb','ccc','ddd');