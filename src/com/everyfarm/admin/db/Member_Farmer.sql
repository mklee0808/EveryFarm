DROP TABLE MEMBER;
DROP TABLE FARMER;

CREATE TABLE "MEMBER" 
   (	
   	"MEM_ID" VARCHAR2(50) NOT NULL ENABLE, 
	"MEM_PW" VARCHAR2(50) NOT NULL ENABLE, 
	"MEM_NAME" VARCHAR2(30) NOT NULL ENABLE, 
	"MEM_PHONE" VARCHAR2(20) NOT NULL ENABLE, 
	"MEM_ZONECODE" VARCHAR2(10) NOT NULL ENABLE, 
	"MEM_ADDR" VARCHAR2(100) NOT NULL ENABLE, 
	"MEM_ADDRETC" VARCHAR2(100) NOT NULL ENABLE, 
	"MEM_EMAIL" VARCHAR2(100) NOT NULL ENABLE, 
	"MEM_GRADE" NUMBER(2,0) NOT NULL ENABLE, 
	"MEM_REGDATE" DATE DEFAULT SYSDATE NOT NULL ENABLE, 
	"MEM_DROP" VARCHAR2(2) NOT NULL ENABLE
);
	 CONSTRAINT "MEMBER_PK_MEM_ID" PRIMARY KEY ("MEM_ID")
--GRADE: 1 회원 / 2 농부 / 3 관리자

SELECT * FROM MEMBER;
SELECT COUNT(*) FROM MEMBER;

INSERT INTO MEMBER VALUES(
'user','1234','사용자','010-0000-0000','11176','서울시 강남구 역삼동','정보교육원','t@t.com',1,SYSDATE,'N'
);
INSERT INTO MEMBER VALUES(
'user2','1234','사용자','010-0000-0000','11176','서울시 강남구 역삼동','정보교육원','t@t.com',1,SYSDATE,'N'
);
INSERT INTO MEMBER VALUES(
'user3','1234','사용자','010-0000-0000','11176','서울시 강남구 역삼동','정보교육원','t@t.com',1,SYSDATE,'N'
);
INSERT INTO MEMBER VALUES(
'admin','1234','관리자','010-0000-0000','11176','서울시 강남구 역삼동','정보교육원','t@t.com',3,SYSDATE,'N'
);

INSERT INTO FARMER VALUES(
'user3', 1, SYSDATE
);

--회원이 농부 신청서 양식을 작성하면 양식을 확인해서 관리자가 승인해준다.
--이때 승인이란, 해당 아이디를 받아서 데이터베이스에 튜플(레코드)를 만드는 것이다. 

CREATE TABLE FARMER (
	MEM_ID				VARCHAR2(20)	NOT NULL,
	FARMER_STATUS	NUMBER(3)		NOT NULL, 
	FARMER_REGDATE	DATE			NOT NULL
);
--FARMER_STATUS : 1 승인대기 / 2 승인완료

select * from farmer


INSERT INTO FARMER VALUES(
'user', 1, SYSDATE
);

INSERT INTO FARMER VALUES(
'user2', 2, SYSDATE
);

INSERT INTO FARMER VALUES(
'user3', 1, SYSDATE
);

SELECT * FROM FARMER;

SELECT A.MEM_ID, A.MEM_NAME, A.MEM_GRADE, B.FARMER_STATUS
FROM MEMBER A, FARMER B
WHERE A.MEM_ID = B.MEM_ID

--회원을 농부로 승격(update)
UPDATE FARMER SET FARMER_STATUS=2 WHERE ID='user3';
UPDATE MEMBER SET GRADE=2 WHERE ID='user3';

--원래대로
UPDATE FARMER SET FARMER_STATUS=1 WHERE MEM_ID='user3';
UPDATE MEMBER SET MEM_GRADE=1 WHERE MEM_ID='user3';

SELECT *
FROM MEMBER A, FARMER B
WHERE A.ID = B.ID
AND A.ID='user'

-------------------------------------------------------------------------------------

-- 미등록 승인 -> 진행중		
UPDATE AUCTION SET AUC_STATUS=2 WHERE AUC_NO=2
-- 원래대로 되돌리기
UPDATE AUCTION SET AUC_STATUS=1 WHERE AUC_NO=3


SELECT R.* 
FROM (SELECT ROWNUM AS RNUM, A.MEM_ID, A.MEM_NAME, A.MEM_GRADE, B.FARMER_STATUS
	FROM MEMBER A, FARMER B
	WHERE A.MEM_ID = B.MEM_ID) R 

--	SELECT B.*
--	FROM (SELECT A.*, ROWNUM AS RNUM
--			FROM (SELECT * FROM SOMIBOARD ORDER BY SEQ DESC)A 
--			)B
--	WHERE RNUM BETWEEN ${to} AND ${from}

SELECT * FROM MVCBOARD 
WHERE SEQ > (SELECT MAX(SEQ) FROM MVCBOARD)-10
AND SEQ <= (SELECT MAX(SEQ) FROM MVCBOARD)-0
ORDER BY SEQ DESC;	

--등업신청 리스트
SELECT R.* 
FROM (SELECT ROWNUM AS RNUM, A.MEM_ID, A.MEM_NAME, A.MEM_GRADE, B.FARMER_STATUS
	FROM MEMBER A, FARMER B
	WHERE A.MEM_ID = B.MEM_ID) R 
WHERE R.RNUM BETWEEN 11 AND 20

--경매신청 리스트
SELECT R.RNUM, R.MEM_ID, R.STOCK_NAME, R.AUC_STARTPRICE, R.AUC_REGDATE, R.AUC_ENDDATE, R.AUC_STATUS
FROM (SELECT ROWNUM AS RNUM, A.*, B.*
	FROM AUCTION A, STOCK B
	WHERE A.STOCK_NO = B.STOCK_NO
	ORDER BY A.AUC_REGDATE DESC) R 
WHERE R.RNUM BETWEEN 1 AND 10
		

SELECT *
		FROM AUCTION A, STOCK B
		WHERE A.STOCK_NO = B.STOCK_NO
	
	
INSERT INTO STOCK (STOCK_NO,MEM_ID,STOCK_NAME,STOCK_DETAIL,STOCK_KG,STOCK_PRICE,STOCK_IMAGE,STOCK_LOCATION,STOCK_KIND) VALUES 
(13,'test','테스트용 과일','테스트 설명.',50,20000,'resources\images\productstorage\banana.png/
					resources\images\productstorage\banana.png/
					resources\images\productstorage\banana.png/
					resources\images\productstorage\banana.png','연천시',1)
;				
INSERT INTO AUCTION (AUC_NO,STOCK_NO,AUC_STARTPRICE,AUC_NOWPRICE,AUC_STATUS,AUC_REGDATE,AUC_ENDDATE,AUC_JOIN) VALUES 
(13,2,1000,1000,1,TIMESTAMP '2020-02-01 12:00:37.000000',TIMESTAMP '2020-03-01 00:00:00.000000',0)
;
					
SELECT * FROM AUCTION	


		SELECT R.* 
		FROM (SELECT ROWNUM AS RNUM, MEM_ID, MEM_NAME, MEM_PHONE, MEM_ZONECODE, 
				MEM_ADDR, MEM_ADDRETC, MEM_EMAIL, MEM_GRADE, MEM_REGDATE, MEM_DROP
			FROM MEMBER
			) R 
		WHERE R.RNUM BETWEEN 1 AND 10
		
		
-----------------------------------------------------------------------------

SELECT R.* 
FROM (SELECT ROWNUM AS RNUM, MEM_ID, MEM_NAME, MEM_PHONE, MEM_ZONECODE, MEM_ADDR, MEM_ADDRETC, MEM_EMAIL, MEM_GRADE, MEM_REGDATE, MEM_DROP
	FROM MEMBER
	) R 
WHERE R.RNUM BETWEEN 1 AND 5
		