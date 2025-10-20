package com.sist.vo;

import lombok.Data;

/*
 *      ID    NOT NULL VARCHAR2(20)  
		PWD   NOT NULL VARCHAR2(10)  
		NAME  NOT NULL VARCHAR2(51)  
		POST  NOT NULL VARCHAR2(7)   
		ADDR1 NOT NULL VARCHAR2(250) 
		ADDR2          VARCHAR2(200) 
		LOGIN          NUMBER
		
	=> 데이터를 모아서 전송 할 목적 => JSP(Bean)	
	     1. 데이터베이스에 저장된 데이터를 한번에 읽기
	     2. 브라우저로 한번에 전송 목적
	     => JSP : Bean / MyBatis : DTO / Spring : VO
	     => 캡슐화 방식을 주로 사용
	        변수는 은닉화 / 메소드를 통해서 접근 할 목적
	        ---------   ----------------------
	        변수 : private   메소드 : public 
	                        ---- 변수 기능을 만들어서 사용
	                             ------- 메모리 저장 : setter
	                                     메모리 읽기 : getter
 */
@Data
public class MemberVO {
   private String id, pwd, name, post, addr1, addr2, msg;
   private int login;
}
