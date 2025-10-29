CREATE TABLE replyboard (
    no          NUMBER,
    name        VARCHAR2(51) CONSTRAINT rb_name_nn NOT NULL,
    subject     VARCHAR2(2000) CONSTRAINT rb_subject_nn NOT NULL,
    content     CLOB CONSTRAINT rb_cont_nn NOT NULL,
    pwd         VARCHAR2(10) CONSTRAINT rb_pwd_nn NOT NULL,
    regdate     DATE DEFAULT SYSDATE,
    hit         NUMBER DEFAULT 0,
    group_id    NUMBER,
    group_step  NUMBER DEFAULT 0,
    group_tab   NUMBER DEFAULT 0,
    root        NUMBER DEFAULT 0,
    depth       NUMBER DEFAULT 0,
    CONSTRAINT rb_no_pk PRIMARY KEY(no)
);

CREATE SEQUENCE rb_no_seq
    START WITH 1
    INCREMENT BY 1
    NOCYCLE
    NOCACHE;
    
INSERT INTO replyboard(no, name, subject, content, pwd, group_id) VALUES(rb_no_seq.nextval, '홍길동', 'MVC 사용법', 'MVC(Front/Back) 작업 = 확장성 , 재사용', '1234', 5);

INSERT INTO replyboard(no, name, subject, content, pwd, group_id, group_step, group_tab) VALUES(rb_no_seq.nextval, '홍길동', 'MVC 사용법', 'MVC(Front/Back) 작업 = 확장성 , 재사용', '1234', 5, 2, 2);

commit;
    