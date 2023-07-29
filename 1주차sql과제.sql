CREATE Table MEMBER ( --ȸ�����̺�
    m_id VARCHAR2(50) CONSTRAINT member_pk primary key, --�⺻Ű
    m_name VARCHAR2(50) NOT NULL, -- �ʼ��׸�
    m_passwd VARCHAR2(5) NOT NULL, -- �ʼ��׸�
    m_phonenumber CHAR(15) NOT NULL --�ʼ��׸�
    
)

CREATE TABLE RENTITEMS( -- �뿩��ǰ ���̺�
    id int CONSTRAINT rentitems_pk primary key,
    spice VARCHAR2(50),
    title VARCHAR2(50),
    price int,
    quantity int
)


CREATE TABLE BOOK ( -- �������̺�
    id int CONSTRAINT book_pk primary key ,
    publish VARCHAR2(50),
    CONSTRAINT book_rent_pk FOREIGN KEY(id) REFERENCES RENTITEMS(id) -- �뿩��ǰ�� ������ȣ�� ����
)


CREATE TABLE VIDEO ( -- �������̺�
    id int CONSTRAINT video_pk primary key,
    producer VARCHAR2(50),
    CONSTRAINT video_rent_pk FOREIGN KEY(id) REFERENCES RENTITEMS(id) -- �뿩��ǰ�� ������ȣ�� ����
)

CREATE TABLE CD ( --  cd���̺�
    id int CONSTRAINT cd_pk primary key,
    singer VARCHAR2(50),
    CONSTRAINT cd_rent_pk FOREIGN KEY(id) REFERENCES RENTITEMS(id) -- �뿩��ǰ�� ������ȣ�� ����
)

CREATE TABLE RENT(  --�뿩���̺�
   id int constraint rent_pk primary key,
   mem_id VARCHAR2(10) REFERENCES MEMBER(m_id),
   rent_id int REFERENCES RENTITEMS(id),
   rent_date varchar(50),
   rent_time varchar(50),
   return_date varchar(50),
   return_time varchar(50)
 
)

--2. ȸ�� ���̺� ȸ���� 2�� ����ϴ� sql
INSERT INTO MEMBER VALUES ('user01', 'ȫ�浿', '1111', '010-1111-2222');
INSERT INTO MEMBER VALUES ('user02', '��浿', '2222', '010-3333-4444');

-- 3. ����,���� , cd�� �ϳ��� ����ϴ� sql�� �ۼ��ϼ���.

INSERT INTO RENTITEMS VALUES (100,'����','������',12000,3);
INSERT INTO RENTITEMS VALUES (101,'����','�͹̳�����',5000,2);
INSERT INTO RENTITEMS VALUES (102,'CD','������1��',10000,5);

INSERT INTO BOOK VALUES (100,'�س����ǻ�');
INSERT INTO VIDEO VALUES (101,'��Ʃ���_A');
INSERT INTO CD VALUES (102,'������1��');

--4. ȸ�� 1�� ������ �뿩�ϱ� ���� sql�� �ۼ��Ͻÿ�.

CREATE SEQUENCE rent_sequence START WITH 1 INCREMENT BY 1; -- start with: ���۰� , increment : ������
insert into rent (id, mem_id, rent_id, rent_date, rent_time) values(rent_sequence.NEXTVAL,'user01',100,'2023��7��29��','����7��7��');

--5. ȸ�� 2�� ������ �뿩�ϱ� ���� sql�� �ۼ��Ͻÿ�,
insert into rent (id, mem_id, rent_id, rent_date, rent_time) values(rent_sequence.NEXTVAL,'user02',101,'2023��7��29��','����7��10��');

--6. ȸ��1�� �ݳ��ϱ� ���� sql�� �ۼ��Ͻÿ�.
update RENTITEMS -- RENTITMES ���̺� ����
set quantity = quantity-1 --��������
where id =100; -- ȸ��ID�� 100�� ��

update RENTITEMS
set quantity = quantity-1
where id =101;

update RENT -- RENT���̺� ����
set return_date = '2023��7��30��',return_time = '����9��00��' -- �ݳ� �ð� ����
where mem_id = 'user01'; -- user01 �� ��

update RENTITEMS -- RENTITEMS ���̺� ����
set quantity = quantity +1 -- ���� ����
where id = 100; --ȸ��id�� 100�� ��


