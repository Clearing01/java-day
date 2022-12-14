CREATE TABLE MEMBER(
	MID VARCHAR(20) PRIMARY KEY,
	MPW VARCHAR(20) NOT NULL,
	MNAME VARCHAR(20) NOT NULL
);

CREATE TABLE BOARD(
	BID INT PRIMARY KEY,
	MID VARCHAR(20) NOT NULL, -- FK는 반드시 상대 테이블의 PK
	MSG VARCHAR(50) NOT NULL,
	FAVCNT INT DEFAULT 0,
	RCNT INT DEFAULT 0
);

CREATE TABLE REPLY(
	RID INT PRIMARY KEY,
	MID VARCHAR(20) NOT NULL,
	BID INT NOT NULL,
	RMSG VARCHAR(30) NOT NULL,
	CONSTRAINT BOARD_REPLY FOREIGN KEY (BID) REFERENCES BOARD (BID) ON DELETE CASCADE
);

INSERT INTO BOARD(BID,MID,MSG) VALUES((SELECT NVL(MAX(BID),0)+1 FROM BOARD),'a','apple');
INSERT INTO REPLY VALUES((SELECT NVL(MAX(RID),0)+1 FROM REPLY),'a','1','ㄹㅇㅋㅋ');

SELECT * FROM USER_TABLES;
SELECT * FROM BOARD;
SELECT * FROM REPLY;

DROP TABLE BOARD;