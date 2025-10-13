<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
     24page
      JSP => _jspService() 메소드를 완성하는 파일
      => HTML은 out.write("<html>")
               ---------- 생력이 가능 => HTML소스 작업이 쉽다
      => 동적 페이지 : 한개의 파일로 데이터를 변경 후 출력 가능   
      => HTML은 그대로 사용이 가능
      => 수정시에 컴파일 없이 실행 가능 => 새로고침
      => 자바로 변경 (톰캣이 자동 처리)
      => 단점 : 소스 노출 (보안 취약)
      => JSP는 주로 출력용으로 사용한다 
      
      = 동작 방식
         파일 : a.jsp
         1. 사용자 요청 => jsp파일을 보여 달라 (주소창)
             없는 경우 : 404
             있는 경우 : 바로 실행 (200)    
         2. 톰캣 => JSP에 해당되는 Java 파일 생성 여부 확인
             a_jsp.java : 한번만 생성
             ----------
             파일이 있는 경우 : 수정 후에 컴파일
             파일이 없는 경우 : 생성 후에 컴파일
             ex) main.jsp => main_jsp.java
                 a_1.jsp => a_005f.java
             => 숫자로 시작하는 파일명을 사용하면 안된다
         3. 컴파일 => a.jsp.class
              실행 => 메모리에 HTML만 저장
                     ----------------
                      |브라우저가 읽어서 출력
        --------------------------------------------
         파일 => 상용화 (75개 이상) 
         => 정적 페이지 : HTML / CSS => 데이터 변경이 불가능
         => 동적 페이지 : JSP / ASP / PHP => 데이터 변경이 가능    
         
        25page : servlet의 이해
         => Server + let : 서버에서 실행하는 가벼운 프로그램
         => Applet => Application + let   
         => 순수 자바 코딩 : .java
         => 수정 후 바로 확인 불가 (컴파일 후 확인 가능)
         => 장점 : 보안이 뛰어나다
                  -----------
                   보안 / 중요 소스 / 데이터베이스 연동
         => HTML + JAVA : 혼합 
            -----------
             HTML (View)
              | => 연결 => Servlet (Controller)
             JAVA (Model)                             
 --%>    
 <%
      out.write("<!DOCTYPE html>");
      out.write("<html>");
      out.write("<head>");
      out.write("<meta charset=\"UTF-8\">");
      out.write("<title>Insert title here</title>");
      out.write("</head>");
      out.write("<body>");
      out.write("<h1>Hello JSP</h1>");
      out.write("</body>");
      out.write("</html>");
 %>









