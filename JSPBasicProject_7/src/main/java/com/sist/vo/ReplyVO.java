package com.sist.vo;
import java.util.*;

/*
 *  CREATE TABLE reply(
    rno NUMBER,
    fno NUMBER,
    id VARCHAR2(20),
    name VARCHAR2(51) CONSTRAINT re_name_nn NOT NULL,
    msg CLOB CONSTRAINT re_msg_nn NOT NULL,
    regdate DATE DEFAULT SYSDATE,
    CONSTRAINT re_rno_pk PRIMARY KEY(rno),
    CONSTRAINT re_fno_fk FOREIGN KEY(fno)
    REFERENCES menupan_food(fno),
    CONSTRAINT re_id_fk FOREIGN KEY(id)
    REFERENCES member(id)
	);
	
	CREATE SEQUENCE re_rno_seq
	       START WITH 1
	       INCREMENT BY 1
	       NOCACHE
	       NOCYCLE;
	       
	desc reply;  
	
	RNO     NOT NULL NUMBER       
	FNO              NUMBER       
	ID               VARCHAR2(20) 
	NAME    NOT NULL VARCHAR2(51) 
	MSG     NOT NULL CLOB         
	REGDATE          DATE 
 */
import lombok.Data;

@Data
public class ReplyVO {
   private int rno, fno;
   private String id, name, msg, dbday;
   private Date regdate;
}
