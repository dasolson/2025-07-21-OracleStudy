package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/*
 *    인터페이스 / 추상클래스
 *     => 여러개의 관련된 클래스를 모아서 관리
 *     => 변수 여러개 / 클래스 여러개 
 *        --------   ----------
 *          배열명      인터페이스
 *         => 한개의 이름으로 통합해서 사용
 *         => if를 여러개 사용시 소스가 많이 길어진다
 *            => Map 
 *     1. 사용자 요청 
 *         => <a> , <form> , 자바스크립트의 이벤트 이용  
 *         => ajax / vue : 비동기
 *            ----   --- 일반 JavaScript
 *             |=> 서버와 연결 => fetch , axios
 *                             ------------- 비동기 전환      
 *         => 현재 => 이력서 통과
 *                   -------- 팀별 프로젝트 별로 안봄 , 개인 프로젝트 봄
 *                                                ------------ 실행 동영상 
 *                                    | 산출물
 *     2. Controller (Servlet => DispatcherServlet)
 *         1) 사용자 요청을 받는다
 *            -------- URL
 *            a.jsp?admin => GET  => id=admin
 *            a.jsp       => POST => id=admin : 데이터를 감춘다
 *         2) 처리하는 Model을 찾는다
 *                  ------ 데이터베이스 연동 => 결과값을 브라우저 전송
 *                          => 브라우저(jsp)로 전송 
 *                             ---------- request / session
 *                             => 한번 사용, JSP파일 한개 : request
 *                                  request.setAttribute(Key, object)
 *                                   => JSP에서만 출력
 *                                  Java   JavaScript
 *                                    |        |
 *                                    ----------
 *                                     => 일반 데이터 (int, String)
 *                                     => ~VO / List
 *                                         {}    []
 *                                         -- 객체 표현법
 *                                     => json-simlpe
 *                                     => jackson     :     
 *                                  JavaScript => JSON / XML
 *                             => 모든 JSP에서 사용      : session
 *         3) Model이 가지고 있는 메소드를 이용해서 기능 처리
 *         4) 출력 할 JSP를 찾아서 요청 결과값을 전송
 *             Servlet ===========> JSP
 *                     request 초기화
 *                     ------------ 유지 : forward  
 *       
 *                           
 *                            ---------------------  
 *                            |                   |
 *       브라우저 ========= 자바(Model) ========= 오라클(DAO)
 *         |                  |
 *         --------------------
 *                  | controller : Java + HTML       
 *              
 *       JSP / JavaScript : 결과값을 받아서 브라우저 화면 출력
 *       --------------------------------------------- View
 *       Controller       : 요청을 받아서 결과값을 브라우저로 전송
 *       Model, DAO       : 요청 처리
 *       
 *       => 단점                        보완
 *           = Controller에 의존 (집중) ======> 스프링 6 
 *                                             => 도메인 => Controller 분산
 *                                           ---------------------------
 *                                                       보완
 *                                            서버에 부담 ======> 서버를 나눠서 작업 (MSA)  
 *                                                                                           
 */
public interface Model {
	// 사용자 요청시에 처리하는 기능 => 기능처리가 다르다
    public String execute(HttpServletRequest request, HttpServletResponse response);
        
}
