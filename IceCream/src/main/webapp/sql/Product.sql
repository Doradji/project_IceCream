create table product(
	num number primary key, --��ǰ��ȣ
	name varchar2(25) not null, --��ǰ��
	explain varchar2(200) not null,--��ǰ����
	fileName varchar2(2000),--÷������
	productType varchar2(25)--��ǰŸ��

);
--2)���̺����
drop table product purge;
--3)���̺� Ȯ��
select* from tab;

-- 4) ������ ��ü ����
create sequence seq_product nocache nocycle;

-- 5) ������ ��ü ����
drop sequence seq_product;
--6)
insert into product values(seq_product.nextval,'aaa','bbb','ccc','ddd');