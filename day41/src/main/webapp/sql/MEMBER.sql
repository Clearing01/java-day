CREATE TABLE MEMBER(
	MID VARCHAR(20) PRIMARY KEY,
	MPW VARCHAR(20) NOT NULL,
	MNAME VARCHAR(50) NOT NULL,
	ROLE VARCHAR(20) NOT NULL
);

INSERT INTO MEMBER VALUES('admin','1234','관리자','ADMIN');
INSERT INTO MEMBER VALUES('alsgh321','1472','박민호','GUEST');

SELECT * FROM MEMBER;