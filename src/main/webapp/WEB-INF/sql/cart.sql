CREATE TABLE cart(
	cartno 		NUMBER(10) 		NOT NULL PRIMARY KEY,
	ID 			VARCHAR2(10) 	NULL ,
	FOREIGN KEY (ID) REFERENCES MEMBER (ID)
);