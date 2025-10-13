<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
    <%@ page import="java.text.*" %>
<%--
       1. JSP 실행 과정
           1) 클라이언트 => 브라우저를 통해 요청 => Tomcat으로 전달
           2) JSP => Servlet으로 변환
               test.jsp => text_jsp.java
               => JSP에 있는 HTML을 out.write("html출력") => _jspService()
           3) 컴파일 
               test_jsp.class
           4) 실행
               => out.write에 있는 HTML만 메모리에 적재
           5) 요청한 브라우저에 HTML을 읽어서 화면 출력
           6) 결과값 응답 : 소스 미리보기
           ------------------------------------------------------------
            브라우저 요청(.jsp) ***
                  |
              WAS(tomcat)
                  |
               JSP 찾기
                 => servlet파일 변경 => 1회
                 => 같은 파일 요청시에는 수정 후 처리 => 캐싱
                 => JSP 최초 실행시에는 속도가 느리다
                  |
             컴파일 (.class)
                  |
              servlet 실행
                  |
              HTML 결과 응답
           ------------------------------------------------------------                          
           7) JSP 장단점
               장점
               = HTML과 Java 혼용 
                       ----- 제어문
                       => 구분 <% %> <%! %> <%= %>
               = 유지보수가 용이 (프로그램의 목적 : 개발 => 유지보수)
                 -----------
                  재사용 / 확장성 / 가독성
                  일반 JSP는 재사용, 확장성, 가독성이 낮다
                  ------- MVC          
               = 자동 컴파일 / 캐싱
                  => 한번 변환 => 다음 요청시에는 수정 후 컴파일
               = 표준 기술을 사용
                  J2EE / Jakarta EE
                           => 10버전  jakarta.                                
                   => 9버전 javax.
               단점
               = 로직 / 뷰 혼합
                  => 자바 구현 => 구현된 내용 화면 출력
                  => java + html + css + javascript
               = 초기 실행 속도 늦다 (자바로 변환) => 캐싱
               = 코드 복잡성 증가
                  => 태그형으로 처리 (JSTL)
               = 개발 생성성 저하 (대형 프로젝트)
                  => Spring MVC, ThymeLeaf => CI/CD
                                                                  
       2. 자바 + HTML 구분자
           = <% %>  : 일반 자바 => 메소드안에 코딩
           = <%= %> : 화면 출력시 => out.println()
               | 문법이 동일 (메소드 호출, 변수 선언, 제어문, 연산 처리)
              ( )에 들어가는 내용 => ; 사용 금지  
       3. 제어문 
           = for문, 조건문 (단일조건, 선택조건)
           = while문, switch 
             ------ StringTokenizer
       ~135page
       
       4. 지시자
       5. 내장 객체
       
       6. 세션 / 쿠키
       7. 자바빈즈
       8. 데이터베이스 연동
       
       9. JSTL
       10. MVC
 --%>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <ul>
   <%
       String color="red|blue|green|black|yellow";
       StringTokenizer st = new StringTokenizer(color,"|");
       while(st.hasMoreTokens()){
   %>
           <li><%= st.nextToken() %></li>
   <% 	   
       }
   %>
   </ul>
</body>
</html>