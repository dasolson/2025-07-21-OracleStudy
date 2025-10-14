<?xml version="1.0" encoding="utf-8"?>
<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       1장 
        1. 웹은 클라이언트 - 서버 구조
        2. 정적 페이지 : 파일 요청시 파일을 그대로 응답 (HTML / CSS)
        3. 동적 페이지 : 파일 요청시 데이터를 변경해서 응답 (JSP / Servlet)
        4. 웹 동작 순서
            = 브라우저(클라이언트) - 요청(Request) - 서버 - 처리 후 - 응답(response) - 브라우저
                                                              ------------
                                                               1) HTML => contentType="text/html"
                                                               ----------------------------------
                                                                 => 일반 JSP 번역
                                                               2) JSON => contentType="text/plain"
                                                               -----------------------------------
                                                                 => Ajax / Vue / React
                                                               3) XML  => contentType="text/xml"
        5. JSP 동작
            = test.jsp ==== test_jsp.java : 1회성
                                  | 컴파일 (javac)
                            test_jsp.class
                                  | 실행 (java)
                            메모리에 out.write("<html>")
                                  -------------------
                                    HTML만 누적
                                    ---------
                                     | 브라우저에 읽기 => 화면에 출력
            = 실제 클래스 변환
                pulbic class test_jsp extends HttpJspBase {
                    -------------------------------------
                     멤버 변수 / 메소드 등록
                     <%
                         int a = 100;
                         public void add() {
                         
                         }
                     %>    
                    -------------------------------------
                     메소드
                       public void _jspInit(){}
                       public void _jspDestory(){}
                       public void _jspService() 
                        => JSP : _jspService에 들어가는 코딩
                                 ------------ 요청에 대한 처리
                           JSP => 메소드에 추가되는 기능 
                            | 메소드 영역 (_jspService())     
                       {
                           <%
                               int b = 20;
                           %>
                           String html="
                              <!DOCTYPE html>
                              <html>
                              <head>
                              <meta charset="UTF-8">
                              <title>Insert title here</title>
                              </head>
                              <body>

                              </body>
                              </html>    
                           "
                           out.write
                       }
                    -------------------------------------   
                }         
                *** jsp는 서버를 거쳐서 동작 => 초기화가 된다
                    ---------------------------------
                      => 이전의 파일은 종료 => 새로운 파일을 만든다 
                      => 메모리 적재 = 메모리 해제 => 반복
                         => 보완 (자바스크립트) => web2.0
                         => web3.0 : 보안 (개인 컨텐츠)
                                      | 블록체인
                      => jsp => 가독성이 떨어진다
                                Front-End 연결이 어렵다
                                .jsp => .html (ThymLeaf)
                                 ex)  <tr th:each()>  VueJS
                                      <tr v-for="">
       2장
         Servlet / JSP
         -------
          1) 서버에서 실행되는 자바파일 => .java
          2) 생명주기 : init() = service() = destory()
                        |         |
                      생성자  doGet/doPost
                             => @RequestMapping()
                             => @GetMapping()
                             => @PostMapping()
          3) 보안 / 자바, HTML을 연결 할때 주로 사용
             JSP : 화면 UI
       
       3장
         JSP 구조
          Java Resource
               |
           src/main/java => java 파일 : 패키지 단위
               
          webapp
             | WEB-INF
                  | lib => 라이브러리 (.jar)
                  | config => xml파일, properties
             | jsp => web 파일 => 폴더 단위 : 웹파일 (jsp, html, css, js, image)
             
           1. JSP 구조
               = java + html
                 -----------
                 구분 => <% %>  : 스크립트릿
                        <%= %> : 화면에 자바 데이터 출력 
                                 => out.println()
                        <%! %> : 선언식 = 멤버변수, 메소드
                                 => 보안, 소스 노출 => 사용 빈도가 거의 없다
                 실행 : jsp => servlet
                        | 자바 파일 변경 => 컴파일 => 실행
                        | 한번 변경시에 속도가 늦다 (1회성)
           2. 지시자 (139page)
           3. 내장 객체 / 기본 객체 => 9개
           4. 파일 업로드 / 파일 다운로드
              cos.jar => tomcat 9 까지 사용 가능
              --- javax (사용 x)
                  commons-fileupload (사용 o)
           5. 세션 / 쿠키
           6. 데이터베이스 => MyBatis
           7. 예제 : 로그인 / 장바구니 / 회원 / 게시판
                    -------------------------- Ajax
           8. JSTL / EL (*****)
               => 실무 : Spring / Spring-Boot
           9. MVC => 1차 프로젝트
              --- Spring은 MVC로 만들어져 있다  
          ------------------------------------------------------------------------------------------
          139page
            지시자
              |
          **page / include / **taglib
                    | <jsp:include>
          ** page 지시자 : jsp 파일에 대한 정보
              사용법
                <%@ 지시자 속성="값" 속성="값"...%>
                 => 첫줄에 코딩
               **=> contentType : 브라우저에 전송 방법
                     1) html 전송 => text/html'charset=utf-8
                     2) xml 전송  => text/xml'charset=utf-8
                     3) json 전송 => text/plian'charset=utf-8
                 => errorPage
               **=> isErrorPage
                 => buffer
               **=> import
                 => info              
                                                                                                                                                                                                                                                       
 --%>    
<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>ContentType:text/html</h1>
</body>
</html> -->
<sawon>
   <list>
      <name>홍길동</name>
      <sex>남자</sex>
   </list>
   <list>
      <name>심청이</name>
      <sex>여자</sex>
   </list>
</sawon>