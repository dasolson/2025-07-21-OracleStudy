<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       JSP : Java Server Page
             => 서버에서 실행 되는 자바 파일 
             => Back-End
                 JSP / Servlet / Spring / Oracle / AI
                 NodeJS => 서버사이드
             => Front-End
                 JavaScript / Jquery / Vue / React
       자바 웹
       -----
          servlet => Server + let
                     서버에서 실행하는 가벼운 프로그램
                     => 수정시마다 컴파일을 해야한다
                     => 순수하게 자바로만 코딩 => HTML 구현이 어렵다
                     => HTML을 쉽게 작업 가능하게 만드는 코드
                        -----------------------------
                            JSP : 자바 / HTML 분리
          => JSP의 단점 : 보안에 취약 => 파일을 그대로 전송
          => 보안 / 소스 노출없이 : 서블릿
          => 화면 UI : JSP
             ------------------------ MVC 
          => 최근 : JavaScript == Spring-Boot
                             JSON
          => JSP파일을 만드는 이유 : PHP / ASP / CGI
              = 동적 페이지 (HTML은 정적 페이지)
                                 -------- 출력 데이터 변경 불가
                -------- 출력데이터 변경           
          => JSP
               Java + HTML(CSS / JavaScript)
               => 구분 
                   Java 영역
                   <% 
                       일반 자바 => 메소드 호출 / 제어문 / 변수 설정 / 연산 처리
                                                    --- 지역변수  
                   %> : 스크립트릿
                   <%= %> : out.println => 출력
                      : 표현식
                   <%! %> : 메소드 선언 / 전역변수 => 사용 빈도는 거의 없다
                      : 선언식
               => 사용자가 요청한 데이터를 받아서 데이터베이스 연동 => 화면에 출력
                   디비 연동 
                   목록 / 페이징 / 상세보기(조회수 증가) / CRUD
                   -----------------------------        
              18page
                1. 웹 동작
                    = 사용자 / 관리자
                      ----   ----- 
                      Client Sever => C/S
                      ------ -----
                      요청     응답
                     ex) 검색 => 요청값은 검색어 / 검색에 대한 데이터베이스 값
                                ----------------------------------- 출력
                      => 데이터 전송시 URL 이용해서 데이터 전송
                      => 주소창 => ?키=값&키=값
                                 ---------- 
                      => 서버는 주소만 읽을 수 있다
                      => url 주소
                           http://서버IP:PORT/프로젝트명/폴더명/파일명
                           웹의 구분자
                           -------- 파일명 
                           => 파일이 없는 경우   : 404
                       *** => 파일 번역 오류 발생 : 500
                           => 파일 권한 부여     : 403
                           => 정상 수행         : 200    
                    = 실행 => 구성요소
                       1. 브라우저 (클라이언트) => 요청 / 응답 받은 데이터 출력
                       2. 웹 서버 : Apache / IIS
                       3. 웹 애플리케이션 서버
                            WAS : tomcat = Java번역 => HTML변환
                                  ------
                                   테스트용 웹 서버가 내장
                       4. 데이터베이스 : 오라클 / MySQL / MariaDB
                    = 실행 순서
                       1. 사용자가 브라우저를 통해서 HTML / JSP 요청
                           => 브라우저 주소창
                       2. 서버에서  (웹서버) 요청한 내용을 받는다
                       3. 서버에서 해당 파일을 찾는다
                          --------------------
                          HTML / XML / JSON => 웹서버 자체 처리
                          JSP /Servlet 요청
                          ---------------- 웹서버는 처리 불가
                           | tomcat에 전송 => Java를 번역 => HTML 변환 => 메모리에 저장(출력버퍼)
                       4. 메모리에 저장된 HTML를 브라우저에서 한줄씩 번역 
                       
                    = 번역
                             tomcat에 전송
                       a.jsp ============> a_jsp.java 변경
                                           ----------- servlet
                                                |
                                               컴파일
                                                |
                                           a_jsp.class
                                                |
                                           실행 => HTML만 메모리에 출력
                    = 자바로 변경
                        a.jsp => a_jsp.java
                        class a_jsp extends HttpServlet {
                              <%! int b = 100; %>
                             public void _jspInit() {
                                 => 생성자 대체
                                 => web.xml
                             } 
                             public void _jspDestory() {
                                 => 소멸자 : 메모리 해제
                                 => 새로고침 / 화면 이동
                             }
                             public void _jspService() {
                                 처리 후 결과값 출력
                                 --------------
                                 JSP에서 코딩한 내용 포함
                                 int a = 10;
                                 <% %>
                                 <%= %> : 출력
                             }
                        }         
                        
                    <%
                        for(int i =1; i <= 100; i++) {
                            if(i%2 == 0) {
                    %>
                               <h1>짝수</h1>
                    <%        
                            }else {
                    %>
                               <h1>홀수</h1>
                    <%           
                            }
                        }
                    %> 
                    -----------------------------------------
                    <c:forEach var="i" begin="1" end="100">
                        <c:if test="i%2 == 0>
                           <h1>짝수</h1>
                        </c:if>
                        <c:else>
                           <h1>홀수</h1>
                        </c:else>
                    </c:for Each>
                                                                                                
       1. 지시자
       2. 자바 사용법
       3. 내장 객체
       4. 약션 태그
       5. JSTL
       6. MVC
       => Spring : JSP / Spring-Boot : JSP , ThymeLeaf
 --%>    
 <%! int a = 100; %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <% int b = 200; %>
   <%= a %><br>
   <%= b %>
</body>
</html>