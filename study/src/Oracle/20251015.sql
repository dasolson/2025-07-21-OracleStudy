CREATE TABLE jspBoard(
   no NUMBER,
   name VARCHAR2(51) CONSTRAINT jb_name_nn NOT NULL,
   subject VARCHAR2(2000) CONSTRAINT jb_sub_nn NOT NULL,
   content CLOB CONSTRAINT jb_content_nn NOT NULL,
   pwd VARCHAR2(10) CONSTRAINT jb_pwd_nn NOT NULL,
   regdate DATE DEFAULT SYSDATE,
   hit NUMBER DEFAULT 0,
   CONSTRAINT jb_no_pk PRIMARY KEY(no)
);

INSERT INTO jspBoard(no, name, subject, content, pwd)
VALUES((SELECT NVL(MAX(no)+1,1) FROM jspBoard),'홍길동','JSP내장 객체 사용법',
'request, response객체 사용','1234');

COMMIT;

SELECT * FROM jspBoard;