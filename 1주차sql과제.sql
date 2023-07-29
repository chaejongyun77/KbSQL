CREATE Table MEMBER ( --회원테이블
    m_id VARCHAR2(50) CONSTRAINT member_pk primary key, --기본키
    m_name VARCHAR2(50) NOT NULL, -- 필수항목
    m_passwd VARCHAR2(5) NOT NULL, -- 필수항목
    m_phonenumber CHAR(15) NOT NULL --필수항목
    
)

CREATE TABLE RENTITEMS( -- 대여물품 테이블
    id int CONSTRAINT rentitems_pk primary key,
    spice VARCHAR2(50),
    title VARCHAR2(50),
    price int,
    quantity int
)


CREATE TABLE BOOK ( -- 도서테이블
    id int CONSTRAINT book_pk primary key ,
    publish VARCHAR2(50),
    CONSTRAINT book_rent_pk FOREIGN KEY(id) REFERENCES RENTITEMS(id) -- 대여물품의 관리번호를 참조
)


CREATE TABLE VIDEO ( -- 비디오테이블
    id int CONSTRAINT video_pk primary key,
    producer VARCHAR2(50),
    CONSTRAINT video_rent_pk FOREIGN KEY(id) REFERENCES RENTITEMS(id) -- 대여물품의 관리번호를 참조
)

CREATE TABLE CD ( --  cd테이블
    id int CONSTRAINT cd_pk primary key,
    singer VARCHAR2(50),
    CONSTRAINT cd_rent_pk FOREIGN KEY(id) REFERENCES RENTITEMS(id) -- 대여물품의 관리번호를 참조
)

CREATE TABLE RENT(  --대여테이블
   id int constraint rent_pk primary key,
   mem_id VARCHAR2(10) REFERENCES MEMBER(m_id),
   rent_id int REFERENCES RENTITEMS(id),
   rent_date varchar(50),
   rent_time varchar(50),
   return_date varchar(50),
   return_time varchar(50)
 
)

--2. 회원 테이블에 회원을 2명 등록하는 sql
INSERT INTO MEMBER VALUES ('user01', '홍길동', '1111', '010-1111-2222');
INSERT INTO MEMBER VALUES ('user02', '김길동', '2222', '010-3333-4444');

-- 3. 도서,비디오 , cd를 하나씩 등록하는 sql를 작성하세요.

INSERT INTO RENTITEMS VALUES (100,'도서','지리산',12000,3);
INSERT INTO RENTITEMS VALUES (101,'비디오','터미네이터',5000,2);
INSERT INTO RENTITEMS VALUES (102,'CD','아이유1집',10000,5);

INSERT INTO BOOK VALUES (100,'해냄출판사');
INSERT INTO VIDEO VALUES (101,'스튜디오_A');
INSERT INTO CD VALUES (102,'아이유1집');

--4. 회원 1이 도서를 대여하기 위한 sql을 작성하시오.

CREATE SEQUENCE rent_sequence START WITH 1 INCREMENT BY 1; -- start with: 시작값 , increment : 증가값
insert into rent (id, mem_id, rent_id, rent_date, rent_time) values(rent_sequence.NEXTVAL,'user01',100,'2023년7월29일','오후7시7분');

--5. 회원 2가 비디오를 대여하기 위한 sql를 작성하시오,
insert into rent (id, mem_id, rent_id, rent_date, rent_time) values(rent_sequence.NEXTVAL,'user02',101,'2023년7월29일','오후7시10분');

--6. 회원1이 반납하기 위한 sql를 작성하시오.
update RENTITEMS -- RENTITMES 테이블 수정
set quantity = quantity-1 --수량감소
where id =100; -- 회원ID가 100일 때

update RENTITEMS
set quantity = quantity-1
where id =101;

update RENT -- RENT테이블 수정
set return_date = '2023년7월30일',return_time = '오전9시00분' -- 반납 시간 수정
where mem_id = 'user01'; -- user01 일 때

update RENTITEMS -- RENTITEMS 테이블 수정
set quantity = quantity +1 -- 수량 증가
where id = 100; --회원id가 100일 때


