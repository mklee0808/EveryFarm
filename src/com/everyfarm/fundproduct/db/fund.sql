DROP SEQUENCE FUNDSEQ;
CREATE SEQUENCE FUNDSEQ;

DROP TABLE FUND;
CREATE TABLE FUND(
	FUND_NO NUMBER(15) NOT NULL,	--펀드 번호
	STOCK_NO NUMBER(15) NOT NULL,	--상품번호FK
	FUND_CURRENTPRICE NUMBER(20),	--현재 모금액
	FUND_PRICE NUMBER(20) NOT NULL,	--목표금액
	FUND_STATUS NUMBER NOT NULL,	--펀드 상태(1:미등록, 2:진행중, 3:완료)
	FUND_REGDATE DATE NOT NULL,		--펀드 등록일
	FUND_ENDDATE DATE NOT NULL,		--펀드 종료일
	FUND_JOIN NUMBER(10),			--펀드 참여인원
CONSTRAINT FUND_PK_FUND_NO PRIMARY KEY (FUND_NO),
CONSTRAINT FUND_FK_STOCK_NO FOREIGN KEY (STOCK_NO) REFERENCES STOCK(STOCK_NO)
);

SELECT * FROM FUND;

--더미데이터
INSERT INTO FUND
VALUES(FUNDSEQ.NEXTVAL, 21, 0, 2000000, 2, SYSDATE, to_date('2020/02/27 00:00:00','YYYY/MM/DD HH24:MI:SS'),0);

--더미데이터

