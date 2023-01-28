--------------------------------------------------------
--  파일이 생성됨 - 화요일-11월-01-2022   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BBS_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."BBS_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 11 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CART_NO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."CART_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 181 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CATEGORY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."CATEGORY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence COMMENT_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."COMMENT_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 4 NOCACHE  NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DELADDR_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."DELADDR_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 43 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence LIKE_NO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."LIKE_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 85 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence NO_VAL
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."NO_VAL"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 202 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDER_DETAIL_KEY_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."ORDER_DETAIL_KEY_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 112 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence ORDER_NO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."ORDER_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 100 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCTNO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."PRODUCTNO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 121 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence PRODUCT_OPTION_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."PRODUCT_OPTION_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence QNA_NO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."QNA_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 95 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence REVIEW_NO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."REVIEW_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 65 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence USER_NO_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "OURHM"."USER_NO_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table CART
--------------------------------------------------------

  CREATE TABLE "OURHM"."CART" 
   (	"CART_NO" NUMBER, 
	"OPTION_NO" NUMBER, 
	"USER_ID" VARCHAR2(30 BYTE), 
	"AMOUNT" NUMBER, 
	"PRICE" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table CATEGORY
--------------------------------------------------------

  CREATE TABLE "OURHM"."CATEGORY" 
   (	"CATEGORY_NO" NUMBER, 
	"CATEGORY_NAME" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table COMMENTS
--------------------------------------------------------

  CREATE TABLE "OURHM"."COMMENTS" 
   (	"COMMENT_IDX" NUMBER(6,0), 
	"WRITER" VARCHAR2(30 BYTE), 
	"CONTENT" VARCHAR2(4000 BYTE), 
	"PWD" VARCHAR2(20 BYTE), 
	"WRITE_DATE" DATE DEFAULT SYSDATE, 
	"IP" VARCHAR2(15 BYTE), 
	"BBS_IDX" NUMBER(6,0)
   ) ;
--------------------------------------------------------
--  DDL for Table DELADDR
--------------------------------------------------------

  CREATE TABLE "OURHM"."DELADDR" 
   (	"DEL_NO" NUMBER, 
	"DEL_NAME" VARCHAR2(30 BYTE), 
	"DEL_GETTER" VARCHAR2(30 BYTE), 
	"DEL_PHONE" VARCHAR2(30 BYTE), 
	"DEL_ADDR" VARCHAR2(30 BYTE), 
	"USER_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for Table LIKE_PRODUCT
--------------------------------------------------------

  CREATE TABLE "OURHM"."LIKE_PRODUCT" 
   (	"LIKE_NO" NUMBER, 
	"PRODUCT_NO" NUMBER, 
	"USER_ID" VARCHAR2(30 BYTE), 
	"LDATE" DATE DEFAULT SYSDATE
   ) ;
--------------------------------------------------------
--  DDL for Table ORDER_DETAIL
--------------------------------------------------------

  CREATE TABLE "OURHM"."ORDER_DETAIL" 
   (	"ORDER_DETAIL_KEY" VARCHAR2(30 BYTE), 
	"ORDER_NO" NUMBER(10,0), 
	"PRODUCT_NO" NUMBER(30,0), 
	"AMOUNT" NUMBER, 
	"TOTAL_PRICE" NUMBER, 
	"ORDER_STATUS" VARCHAR2(20 BYTE), 
	"ORDER_DATE" VARCHAR2(20 BYTE), 
	"OPTION_SIZE" VARCHAR2(20 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table ORDER_MAIN
--------------------------------------------------------

  CREATE TABLE "OURHM"."ORDER_MAIN" 
   (	"ORDER_NO" NUMBER(10,0), 
	"USER_ID" VARCHAR2(30 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT
--------------------------------------------------------

  CREATE TABLE "OURHM"."PRODUCT" 
   (	"PRODUCT_NO" NUMBER, 
	"PRODUCT_NAME" VARCHAR2(300 BYTE), 
	"PRICE" NUMBER, 
	"CATEGORY_NO" NUMBER, 
	"THUMNAIL" VARCHAR2(30 BYTE), 
	"ORIGINAL_IMG" VARCHAR2(30 BYTE), 
	"RATE" NUMBER, 
	"CONTENT" VARCHAR2(3000 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table PRODUCT_OPTION
--------------------------------------------------------

  CREATE TABLE "OURHM"."PRODUCT_OPTION" 
   (	"OPTION_NO" NUMBER, 
	"PRODUCT_NO" NUMBER, 
	"OPTION_SIZE" VARCHAR2(10 BYTE), 
	"OPTION_COUNT" NUMBER(10,0)
   ) ;
--------------------------------------------------------
--  DDL for Table QA
--------------------------------------------------------

  CREATE TABLE "OURHM"."QA" 
   (	"QNA_NO" NUMBER(20,0), 
	"TITLE" VARCHAR2(2000 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"USER_ID" VARCHAR2(20 BYTE), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"WDATE" DATE DEFAULT SYSDATE, 
	"PRODUCT_NO" NUMBER, 
	"HIT" NUMBER DEFAULT 0, 
	"QNA_IMG" VARCHAR2(100 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "OURHM"."REVIEW" 
   (	"REVIEW_NO" NUMBER(20,0), 
	"TITLE" VARCHAR2(2000 BYTE), 
	"CONTENT" VARCHAR2(2000 BYTE), 
	"USER_ID" VARCHAR2(20 BYTE), 
	"USER_NAME" VARCHAR2(20 BYTE), 
	"WDATE" DATE DEFAULT SYSDATE, 
	"PRODUCT_NO" NUMBER, 
	"HIT" NUMBER DEFAULT 0, 
	"REVIEW_IMG" VARCHAR2(200 BYTE)
   ) ;
--------------------------------------------------------
--  DDL for Table USERS
--------------------------------------------------------

  CREATE TABLE "OURHM"."USERS" 
   (	"USER_NO" NUMBER, 
	"USER_ID" VARCHAR2(30 BYTE), 
	"PWD" VARCHAR2(30 BYTE), 
	"NAME" VARCHAR2(30 BYTE), 
	"PHONE" VARCHAR2(30 BYTE), 
	"EMAIL" VARCHAR2(30 BYTE), 
	"ADDRESS" VARCHAR2(30 BYTE), 
	"DEL_NO" NUMBER
   ) ;
--------------------------------------------------------
--  DDL for View CART_LIST
--------------------------------------------------------

  CREATE OR REPLACE FORCE VIEW "OURHM"."CART_LIST" ("USER_ID", "CART_NO", "PRODUCT_NAME", "THUMNAIL", "PRICE", "AMOUNT", "TOTAL", "OPTION_SIZE", "PRODUCT_NO") AS 
  SELECT C.USER_ID, C.CART_NO, P.PRODUCT_NAME, P.THUMNAIL, P.PRICE, C.AMOUNT, C.AMOUNT*P.PRICE AS TOTAL, O.OPTION_SIZE, P.PRODUCT_NO
FROM CART C, PRODUCT P, PRODUCT_OPTION O
WHERE C.OPTION_NO = O.OPTION_NO
AND O.PRODUCT_NO = P.PRODUCT_NO
ORDER BY CART_NO DESC
WITH READ ONLY
;
REM INSERTING into OURHM.CART
SET DEFINE OFF;
Insert into OURHM.CART (CART_NO,OPTION_NO,USER_ID,AMOUNT,PRICE) values (133,77,'sk',1,31000);
Insert into OURHM.CART (CART_NO,OPTION_NO,USER_ID,AMOUNT,PRICE) values (160,76,'test',1,45000);
REM INSERTING into OURHM.CATEGORY
SET DEFINE OFF;
Insert into OURHM.CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (42,'TOP');
Insert into OURHM.CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (43,'BOTTOM');
Insert into OURHM.CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (44,'SHOESBAG');
Insert into OURHM.CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (41,'OUTER');
Insert into OURHM.CATEGORY (CATEGORY_NO,CATEGORY_NAME) values (45,'ACC');
REM INSERTING into OURHM.COMMENTS
SET DEFINE OFF;
Insert into OURHM.COMMENTS (COMMENT_IDX,WRITER,CONTENT,PWD,WRITE_DATE,IP,BBS_IDX) values (1,'C테스터','C-내용1','1234',to_date('2022/10/19','YYYY/MM/DD'),'127.0.0.1',10);
Insert into OURHM.COMMENTS (COMMENT_IDX,WRITER,CONTENT,PWD,WRITE_DATE,IP,BBS_IDX) values (2,'C테스터','C-내용2','1234',to_date('2022/10/19','YYYY/MM/DD'),'127.0.0.1',10);
Insert into OURHM.COMMENTS (COMMENT_IDX,WRITER,CONTENT,PWD,WRITE_DATE,IP,BBS_IDX) values (3,'C테스터','C-내용3','1234',to_date('2022/10/19','YYYY/MM/DD'),'127.0.0.1',10);
REM INSERTING into OURHM.DELADDR
SET DEFINE OFF;
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (4,'ede','ede','edd','eded',159);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (21,'ff','ff','ff','ff',111);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (6,'edited3','edited3','edited3','edited3',159);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (23,'집','홍길동','010-7777-7777','서울 강남',182);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (20,'dd','ss','zz','dd',111);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (17,'zz','zz','zz','zz',161);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (18,'z','c','s','d',161);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (11,'zz','zz','zz','zz',160);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (12,'122','122','122','122',160);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (13,'good','good','good','good',160);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (22,'ff','ff','ff','ff',111);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (24,'회사','홍길동','010-2222-2222','인천',182);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (25,'별장','홍길동','010-3333-3333','양재',182);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (26,'회사','test','010-1111-1111','강남',0);
Insert into OURHM.DELADDR (DEL_NO,DEL_NAME,DEL_GETTER,DEL_PHONE,DEL_ADDR,USER_NO) values (27,'회사','22','22','22',0);
REM INSERTING into OURHM.LIKE_PRODUCT
SET DEFINE OFF;
Insert into OURHM.LIKE_PRODUCT (LIKE_NO,PRODUCT_NO,USER_ID,LDATE) values (71,115,'test',to_date('2022/11/01','YYYY/MM/DD'));
Insert into OURHM.LIKE_PRODUCT (LIKE_NO,PRODUCT_NO,USER_ID,LDATE) values (69,111,'test',to_date('2022/11/01','YYYY/MM/DD'));
Insert into OURHM.LIKE_PRODUCT (LIKE_NO,PRODUCT_NO,USER_ID,LDATE) values (70,114,'test',to_date('2022/11/01','YYYY/MM/DD'));
REM INSERTING into OURHM.ORDER_DETAIL
SET DEFINE OFF;
Insert into OURHM.ORDER_DETAIL (ORDER_DETAIL_KEY,ORDER_NO,PRODUCT_NO,AMOUNT,TOTAL_PRICE,ORDER_STATUS,ORDER_DATE,OPTION_SIZE) values ('94',82,118,1,31000,'판매완료','22/11/01','1SIZE');
Insert into OURHM.ORDER_DETAIL (ORDER_DETAIL_KEY,ORDER_NO,PRODUCT_NO,AMOUNT,TOTAL_PRICE,ORDER_STATUS,ORDER_DATE,OPTION_SIZE) values ('95',82,115,1,43000,'판매완료','22/11/01','S');
Insert into OURHM.ORDER_DETAIL (ORDER_DETAIL_KEY,ORDER_NO,PRODUCT_NO,AMOUNT,TOTAL_PRICE,ORDER_STATUS,ORDER_DATE,OPTION_SIZE) values ('96',82,118,1,31000,'판매완료','22/11/01','1SIZE');
Insert into OURHM.ORDER_DETAIL (ORDER_DETAIL_KEY,ORDER_NO,PRODUCT_NO,AMOUNT,TOTAL_PRICE,ORDER_STATUS,ORDER_DATE,OPTION_SIZE) values ('92',80,118,1,31000,'판매완료','22/11/01','1SIZE');
Insert into OURHM.ORDER_DETAIL (ORDER_DETAIL_KEY,ORDER_NO,PRODUCT_NO,AMOUNT,TOTAL_PRICE,ORDER_STATUS,ORDER_DATE,OPTION_SIZE) values ('93',81,117,1,45000,'판매완료','22/11/01','1SIZE');
REM INSERTING into OURHM.ORDER_MAIN
SET DEFINE OFF;
Insert into OURHM.ORDER_MAIN (ORDER_NO,USER_ID) values (82,'soo');
Insert into OURHM.ORDER_MAIN (ORDER_NO,USER_ID) values (80,'test');
Insert into OURHM.ORDER_MAIN (ORDER_NO,USER_ID) values (81,'soo');
REM INSERTING into OURHM.PRODUCT
SET DEFINE OFF;
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (71,'콤백 레트로 프린팅 데님자켓',142700,41,'thumnail_1.jpg','thumnail_1.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (72,'멜루드 디그 포인트 오버핏 후드 바람막이',148300,41,'thumnail_2.jpg','thumnail_2.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (73,'다인 CHME 자수 후드집업',139900,41,'thumnail_3.jpg','thumnail_3.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (74,'미트 숏 다이아 자켓',155000,41,'thumnail_4.jpg','thumnail_4.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (75,'프리미엄 블렌드 블루종jk',175400,41,'thumnail_5.jpg','thumnail_5.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (76,'이지 오버핏 숏 야상 트렌치 자켓',795000,41,'thumnail_6.jpg','thumnail_6.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (77,'멜루드 PK 프리미엄 숏 후드야상',599000,41,'thumnail_7.jpg','thumnail_7.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (78,'멜루드 LA 나그랑 맥코트',899000,41,'thumnail_8.jpg','thumnail_8.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (79,'프링 셀느 트레이닝 집업',416000,41,'thumnail_9.jpg','thumnail_9.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (80,'앤온 스탠 분또코트',784000,41,'thumnail_10.jpg','thumnail_10.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (81,'MA-1 모노 항공오버 자켓',499000,41,'thumnail_11.jpg','thumnail_11.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (82,'인더 크랙 숏 레더자켓',833000,41,'thumnail_12.jpg','thumnail_12.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (83,'로시 니트 카라 집업',399000,41,'thumnail_13.jpg','thumnail_13.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (84,'베이 바시티 블레이져',739000,41,'thumnail_14.jpg','thumnail_14.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (85,'블랑 스티치 레더 포인트 자켓',799000,41,'thumnail_15.jpg','thumnail_15.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (86,'콤백 레트로 프린팅 데님자켓',42700,41,'thumnail_1.jpg','thumnail_1.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (87,'멜루드 디그 포인트 오버핏 후드 바람막이',48300,41,'thumnail_2.jpg','thumnail_2.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (88,'다인 CHME 자수 후드집업',39900,41,'thumnail_3.jpg','thumnail_3.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (89,'미트 숏 다이아 자켓',55000,41,'thumnail_4.jpg','thumnail_4.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (90,'프리미엄 블렌드 블루종jk',75400,41,'thumnail_5.jpg','thumnail_5.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (91,'이지 오버핏 숏 야상 트렌치 자켓',595000,41,'thumnail_6.jpg','thumnail_6.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (92,'멜루드 PK 프리미엄 숏 후드야상',59900,41,'thumnail_7.jpg','thumnail_7.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (93,'멜루드 LA 나그랑 맥코트',89900,41,'thumnail_8.jpg','thumnail_8.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (94,'프링 셀느 트레이닝 집업',41600,41,'thumnail_9.jpg','thumnail_9.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (95,'앤온 스탠 분또코트',78400,41,'thumnail_10.jpg','thumnail_10.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (96,'MA-1 모노 항공오버 자켓',49900,41,'thumnail_11.jpg','thumnail_11.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (97,'인더 크랙 숏 레더자켓',83300,41,'thumnail_12.jpg','thumnail_12.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (98,'로시 니트 카라 집업',39900,41,'thumnail_13.jpg','thumnail_13.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (99,'베이 바시티 블레이져',73900,41,'thumnail_14.jpg','thumnail_14.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (100,'블랑 스티치 레더 포인트 자켓',79900,41,'thumnail_15.jpg','thumnail_15.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (101,'콤백 레트로 프린팅 데님자켓',142700,41,'thumnail_1.jpg','thumnail_1.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (102,'멜루드 디그 포인트 오버핏 후드 바람막이',148300,41,'thumnail_2.jpg','thumnail_2.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (103,'다인 CHME 자수 후드집업',139900,41,'thumnail_3.jpg','thumnail_3.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (104,'미트 숏 다이아 자켓',155000,41,'thumnail_4.jpg','thumnail_4.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (56,'콤백 레트로 프린팅 데님자켓',42700,41,'thumnail_1.jpg','thumnail_1.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (57,'멜루드 디그 포인트 오버핏 후드 바람막이',48300,41,'thumnail_2.jpg','thumnail_2.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (58,'다인 CHME 자수 후드집업',39900,41,'thumnail_3.jpg','thumnail_3.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (59,'미트 숏 다이아 자켓',55000,41,'thumnail_4.jpg','thumnail_4.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (60,'프리미엄 블렌드 블루종jk',75400,41,'thumnail_5.jpg','thumnail_5.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (61,'이지 오버핏 숏 야상 트렌치 자켓',595000,41,'thumnail_6.jpg','thumnail_6.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (62,'멜루드 PK 프리미엄 숏 후드야상',59900,41,'thumnail_7.jpg','thumnail_7.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (63,'멜루드 LA 나그랑 맥코트',89900,41,'thumnail_8.jpg','thumnail_8.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (64,'프링 셀느 트레이닝 집업',41600,41,'thumnail_9.jpg','thumnail_9.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (65,'앤온 스탠 분또코트',78400,41,'thumnail_10.jpg','thumnail_10.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (66,'MA-1 모노 항공오버 자켓',49900,41,'thumnail_11.jpg','thumnail_11.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (67,'인더 크랙 숏 레더자켓',83300,41,'thumnail_12.jpg','thumnail_12.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (68,'로시 니트 카라 집업',39900,41,'thumnail_13.jpg','thumnail_13.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (69,'베이 바시티 블레이져',73900,41,'thumnail_14.jpg','thumnail_14.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (70,'블랑 스티치 레더 포인트 자켓',79900,41,'thumnail_15.jpg','thumnail_15.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (105,'프리미엄 블렌드 블루종jk',175400,41,'thumnail_5.jpg','thumnail_5.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (106,'이지 오버핏 숏 야상 트렌치 자켓',795000,41,'thumnail_6.jpg','thumnail_6.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (107,'멜루드 PK 프리미엄 숏 후드야상',599000,41,'thumnail_7.jpg','thumnail_7.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (108,'멜루드 LA 나그랑 맥코트',899000,41,'thumnail_8.jpg','thumnail_8.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (109,'프링 셀느 트레이닝 집업',416000,41,'thumnail_9.jpg','thumnail_9.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (110,'앤온 스탠 분또코트',784000,41,'thumnail_10.jpg','thumnail_10.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (111,'MA-1 모노 항공오버 자켓',499000,41,'thumnail_11.jpg','thumnail_11.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (112,'인더 크랙 숏 레더자켓',833000,41,'thumnail_12.jpg','thumnail_12.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (113,'로시 니트 카라 집업',399000,41,'thumnail_13.jpg','thumnail_13.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (114,'베이 바시티 블레이져',35000,41,'thumnail_14.jpg','thumnail_14.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (115,'블랑 스티치 레더 포인트 자켓',43000,41,'thumnail_15.jpg','thumnail_15.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (116,'미니 원버튼 레더 크로스백',23900,44,'thumnail_16.jpg','thumnail_16.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (117,'라트 화이트 슬립온',45000,44,'thumnail_17.jpg','thumnail_17.jpg',null,'content.jpg');
Insert into OURHM.PRODUCT (PRODUCT_NO,PRODUCT_NAME,PRICE,CATEGORY_NO,THUMNAIL,ORIGINAL_IMG,RATE,CONTENT) values (118,'레오 나일론 백팩',31000,44,'thumnail_18.jpg','thumnail_18.jpg',null,'content.jpg');
REM INSERTING into OURHM.PRODUCT_OPTION
SET DEFINE OFF;
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (67,115,'S',4);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (21,71,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (22,72,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (23,73,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (24,74,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (25,75,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (26,76,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (27,77,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (28,78,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (29,79,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (30,80,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (31,81,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (32,82,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (33,83,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (34,84,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (35,85,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (36,86,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (37,87,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (38,88,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (39,89,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (40,90,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (41,91,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (42,92,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (43,93,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (44,94,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (45,95,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (46,96,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (47,97,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (48,98,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (49,99,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (50,100,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (51,101,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (52,102,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (53,103,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (54,104,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (55,105,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (56,106,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (57,107,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (58,108,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (59,109,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (60,110,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (61,111,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (62,112,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (63,113,'1SIZE',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (68,115,'M',2);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (72,114,'S',0);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (73,114,'M',10);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (74,114,'L',1);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (75,116,'1SIZE',2);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (76,117,'1SIZE',1);
Insert into OURHM.PRODUCT_OPTION (OPTION_NO,PRODUCT_NO,OPTION_SIZE,OPTION_COUNT) values (77,118,'1SIZE',-1);
REM INSERTING into OURHM.QA
SET DEFINE OFF;
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (78,'일반 문의입니다','상품 선택 안 함','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),null,0,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (79,'실측 사이즈 안 보여요','올려주세요','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,1,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (80,'재입고','재입고 언제 되나요','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (81,'재입고..','재입고 안 되나요?','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,3,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (83,'안녕','ㅇㅇ','test','test1',to_date('2022/11/01','YYYY/MM/DD'),null,0,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (85,'안녕','ㅇㅇ','test','test1',to_date('2022/11/01','YYYY/MM/DD'),115,1,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (86,'환불수정','언제','soo','soo',to_date('2022/11/01','YYYY/MM/DD'),115,5,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (87,'상품 문의','ㅇㄹㅇㄹ','soo','soo',to_date('2022/11/01','YYYY/MM/DD'),null,0,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (76,'배송 언제 되나요','해 줘요','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.QA (QNA_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,QNA_IMG) values (77,'배송 언제..','너무 느려요','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
REM INSERTING into OURHM.REVIEW
SET DEFINE OFF;
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (31,'사진이랑 똑같아요','좋습니다 ㅎ','sk','dfd',to_date('2022/11/01','YYYY/MM/DD'),null,1,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (32,'가격 대비 좋기는 해요','ㅇㄹㅇㄹㅇㄹㅇ','sk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,2,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (37,'무난해요','넹','sk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,2,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (36,'하나 남았길래 구매했어요','ㅎ','sk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,1,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (38,'죠습니다','ㅇ','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (39,'좋아요','ㅇ','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),114,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (40,'화면이랑 색이 많이 달라요','그래도 ㄱㅊ습니다','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (41,'좋음','좋음!','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (42,'괜찮아요','그냥.. ㄱㅊ아요','skk','dfd',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (46,'정말 좋아요','대단해요','test','test1',to_date('2022/11/01','YYYY/MM/DD'),115,2,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (47,'멋져요','대다네요','test','test1',to_date('2022/11/01','YYYY/MM/DD'),116,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (48,'ㅇㄹ','ㅇㄹㅇㄹ','soo','soo',to_date('2022/11/01','YYYY/MM/DD'),115,0,null);
Insert into OURHM.REVIEW (REVIEW_NO,TITLE,CONTENT,USER_ID,USER_NAME,WDATE,PRODUCT_NO,HIT,REVIEW_IMG) values (30,'좋아요','좋습니다
ㅎ
ㅎㅎ
ㅎㅎ..','sk','dfd',to_date('2022/11/01','YYYY/MM/DD'),null,1,null);
REM INSERTING into OURHM.USERS
SET DEFINE OFF;
Insert into OURHM.USERS (USER_NO,USER_ID,PWD,NAME,PHONE,EMAIL,ADDRESS,DEL_NO) values (184,'soo','1234','soo','01012345678','soo@gmail.com','역삼동',null);
Insert into OURHM.USERS (USER_NO,USER_ID,PWD,NAME,PHONE,EMAIL,ADDRESS,DEL_NO) values (185,'test2','test','test','test','test','test',null);
Insert into OURHM.USERS (USER_NO,USER_ID,PWD,NAME,PHONE,EMAIL,ADDRESS,DEL_NO) values (167,'sk','1324','dfd','01011111111','sk@gmail.com','아이티윌',null);
Insert into OURHM.USERS (USER_NO,USER_ID,PWD,NAME,PHONE,EMAIL,ADDRESS,DEL_NO) values (169,'skk','1234','dfd','dfdf','1234','1234',null);
Insert into OURHM.USERS (USER_NO,USER_ID,PWD,NAME,PHONE,EMAIL,ADDRESS,DEL_NO) values (182,'test','1234','test2','test2','test2','test2',null);
REM INSERTING into OURHM.CART_LIST
SET DEFINE OFF;
Insert into OURHM.CART_LIST (USER_ID,CART_NO,PRODUCT_NAME,THUMNAIL,PRICE,AMOUNT,TOTAL,OPTION_SIZE,PRODUCT_NO) values ('test',160,'라트 화이트 슬립온','thumnail_17.jpg',45000,1,45000,'1SIZE',117);
Insert into OURHM.CART_LIST (USER_ID,CART_NO,PRODUCT_NAME,THUMNAIL,PRICE,AMOUNT,TOTAL,OPTION_SIZE,PRODUCT_NO) values ('sk',133,'레오 나일론 백팩','thumnail_18.jpg',31000,1,31000,'1SIZE',118);
--------------------------------------------------------
--  DDL for Index COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."COMMENT_PK" ON "OURHM"."COMMENTS" ("COMMENT_IDX") 
  ;
--------------------------------------------------------
--  DDL for Index ORDER_MAIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."ORDER_MAIN_PK" ON "OURHM"."ORDER_MAIN" ("ORDER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007030
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007030" ON "OURHM"."USERS" ("USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007031
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007031" ON "OURHM"."USERS" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007033
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007033" ON "OURHM"."CATEGORY" ("CATEGORY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007036
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007036" ON "OURHM"."PRODUCT" ("PRODUCT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007037
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007037" ON "OURHM"."ORDER_DETAIL" ("ORDER_DETAIL_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007040
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007040" ON "OURHM"."QA" ("QNA_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007041
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007041" ON "OURHM"."REVIEW" ("REVIEW_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007042
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007042" ON "OURHM"."PRODUCT_OPTION" ("OPTION_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007052
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007052" ON "OURHM"."CART" ("CART_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007055
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007055" ON "OURHM"."LIKE_PRODUCT" ("LIKE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007058
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007058" ON "OURHM"."DELADDR" ("DEL_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007052
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007052" ON "OURHM"."CART" ("CART_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007033
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007033" ON "OURHM"."CATEGORY" ("CATEGORY_NO") 
  ;
--------------------------------------------------------
--  DDL for Index COMMENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."COMMENT_PK" ON "OURHM"."COMMENTS" ("COMMENT_IDX") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007058
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007058" ON "OURHM"."DELADDR" ("DEL_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007055
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007055" ON "OURHM"."LIKE_PRODUCT" ("LIKE_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007037
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007037" ON "OURHM"."ORDER_DETAIL" ("ORDER_DETAIL_KEY") 
  ;
--------------------------------------------------------
--  DDL for Index ORDER_MAIN_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."ORDER_MAIN_PK" ON "OURHM"."ORDER_MAIN" ("ORDER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007036
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007036" ON "OURHM"."PRODUCT" ("PRODUCT_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007042
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007042" ON "OURHM"."PRODUCT_OPTION" ("OPTION_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007040
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007040" ON "OURHM"."QA" ("QNA_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007041
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007041" ON "OURHM"."REVIEW" ("REVIEW_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007030
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007030" ON "OURHM"."USERS" ("USER_NO") 
  ;
--------------------------------------------------------
--  DDL for Index SYS_C007031
--------------------------------------------------------

  CREATE UNIQUE INDEX "OURHM"."SYS_C007031" ON "OURHM"."USERS" ("USER_ID") 
  ;
--------------------------------------------------------
--  DDL for Procedure OPTION_INSERT
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "OURHM"."OPTION_INSERT" 
AS
BEGIN
    FOR I IN 71 .. 113 LOOP -- I는 횟수
    INSERT INTO PRODUCT_OPTION
    VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, I, '1SIZE', 10);
    END LOOP;
END;

EXEC OPTION_INSERT;

COMMIT;

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 114, 'S', 0);

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 114, 'M', 10);

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 114, 'L', 1);

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 115, 'S', 5);

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 115, 'M', 2);

COMMIT;

select * from product_option;

DELETE PRODUCT_OPTION
WHERE PRODUCT_NO = 114;


INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 116, '1SIZE', 2);

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 117, '1SIZE', 2);

INSERT INTO PRODUCT_OPTION
VALUES(PRODUCT_OPTION_SEQ.NEXTVAL, 118, '1SIZE', 2);
COMMIT;


select * from cart;

/
--------------------------------------------------------
--  Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "OURHM"."CART" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."CART" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."CART" MODIFY ("USER_ID" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."CART" MODIFY ("OPTION_NO" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."CART" ADD PRIMARY KEY ("CART_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table CATEGORY
--------------------------------------------------------

  ALTER TABLE "OURHM"."CATEGORY" ADD PRIMARY KEY ("CATEGORY_NO") ENABLE;
  ALTER TABLE "OURHM"."CATEGORY" MODIFY ("CATEGORY_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table COMMENTS
--------------------------------------------------------

  ALTER TABLE "OURHM"."COMMENTS" ADD CONSTRAINT "COMMENT_PK" PRIMARY KEY ("COMMENT_IDX") ENABLE;
--------------------------------------------------------
--  Constraints for Table DELADDR
--------------------------------------------------------

  ALTER TABLE "OURHM"."DELADDR" ADD PRIMARY KEY ("DEL_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table LIKE_PRODUCT
--------------------------------------------------------

  ALTER TABLE "OURHM"."LIKE_PRODUCT" ADD PRIMARY KEY ("LIKE_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "OURHM"."ORDER_DETAIL" MODIFY ("OPTION_SIZE" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."ORDER_DETAIL" ADD PRIMARY KEY ("ORDER_DETAIL_KEY") ENABLE;
--------------------------------------------------------
--  Constraints for Table ORDER_MAIN
--------------------------------------------------------

  ALTER TABLE "OURHM"."ORDER_MAIN" ADD CONSTRAINT "ORDER_MAIN_PK" PRIMARY KEY ("ORDER_NO") ENABLE;
  ALTER TABLE "OURHM"."ORDER_MAIN" MODIFY ("ORDER_NO" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "OURHM"."PRODUCT" ADD PRIMARY KEY ("PRODUCT_NO") ENABLE;
  ALTER TABLE "OURHM"."PRODUCT" MODIFY ("PRICE" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."PRODUCT" MODIFY ("PRODUCT_NAME" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table PRODUCT_OPTION
--------------------------------------------------------

  ALTER TABLE "OURHM"."PRODUCT_OPTION" ADD PRIMARY KEY ("OPTION_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table QA
--------------------------------------------------------

  ALTER TABLE "OURHM"."QA" MODIFY ("HIT" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."QA" ADD PRIMARY KEY ("QNA_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "OURHM"."REVIEW" MODIFY ("HIT" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."REVIEW" ADD PRIMARY KEY ("REVIEW_NO") ENABLE;
--------------------------------------------------------
--  Constraints for Table USERS
--------------------------------------------------------

  ALTER TABLE "OURHM"."USERS" ADD UNIQUE ("USER_ID") ENABLE;
  ALTER TABLE "OURHM"."USERS" ADD PRIMARY KEY ("USER_NO") ENABLE;
  ALTER TABLE "OURHM"."USERS" MODIFY ("ADDRESS" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."USERS" MODIFY ("EMAIL" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."USERS" MODIFY ("PHONE" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."USERS" MODIFY ("NAME" NOT NULL ENABLE);
  ALTER TABLE "OURHM"."USERS" MODIFY ("PWD" NOT NULL ENABLE);
--------------------------------------------------------
--  Ref Constraints for Table CART
--------------------------------------------------------

  ALTER TABLE "OURHM"."CART" ADD CONSTRAINT "CART_FK1" FOREIGN KEY ("OPTION_NO")
	  REFERENCES "OURHM"."PRODUCT_OPTION" ("OPTION_NO") ENABLE;
  ALTER TABLE "OURHM"."CART" ADD CONSTRAINT "CART_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "OURHM"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table LIKE_PRODUCT
--------------------------------------------------------

  ALTER TABLE "OURHM"."LIKE_PRODUCT" ADD CONSTRAINT "LIKE_PRODUCT_FK1" FOREIGN KEY ("PRODUCT_NO")
	  REFERENCES "OURHM"."PRODUCT" ("PRODUCT_NO") ENABLE;
  ALTER TABLE "OURHM"."LIKE_PRODUCT" ADD CONSTRAINT "LIKE_PRODUCT_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "OURHM"."USERS" ("USER_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table ORDER_DETAIL
--------------------------------------------------------

  ALTER TABLE "OURHM"."ORDER_DETAIL" ADD CONSTRAINT "ORDER_DETAIL_FK1" FOREIGN KEY ("ORDER_NO")
	  REFERENCES "OURHM"."ORDER_MAIN" ("ORDER_NO") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT
--------------------------------------------------------

  ALTER TABLE "OURHM"."PRODUCT" ADD CONSTRAINT "CATEGORY_NO" FOREIGN KEY ("CATEGORY_NO")
	  REFERENCES "OURHM"."CATEGORY" ("CATEGORY_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table PRODUCT_OPTION
--------------------------------------------------------

  ALTER TABLE "OURHM"."PRODUCT_OPTION" ADD FOREIGN KEY ("PRODUCT_NO")
	  REFERENCES "OURHM"."PRODUCT" ("PRODUCT_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table QA
--------------------------------------------------------

  ALTER TABLE "OURHM"."QA" ADD CONSTRAINT "QA_FK1" FOREIGN KEY ("PRODUCT_NO")
	  REFERENCES "OURHM"."PRODUCT" ("PRODUCT_NO") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table REVIEW
--------------------------------------------------------

  ALTER TABLE "OURHM"."REVIEW" ADD CONSTRAINT "REVIEW_FK1" FOREIGN KEY ("PRODUCT_NO")
	  REFERENCES "OURHM"."PRODUCT" ("PRODUCT_NO") ENABLE;
  ALTER TABLE "OURHM"."REVIEW" ADD CONSTRAINT "REVIEW_FK2" FOREIGN KEY ("USER_ID")
	  REFERENCES "OURHM"."USERS" ("USER_ID") ENABLE;
