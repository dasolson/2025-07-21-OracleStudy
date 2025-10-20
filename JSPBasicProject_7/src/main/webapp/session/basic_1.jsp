<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%--
        session : 내장 객체 => 서블릿으로 변환시에 자동 생성
                  ------- 생성이 되어 있다 => JSP에서는 바로 사용 가능
                           = request
                           = response
                           = session
                           =application : Spring
        HttpSession 클래스 객체명 
        ----------- : request.getSession() => session 객체 얻기
         : 클라이언트(브라우저) 별로 서버에 정보를 유지하는데 사용
         : 보안이 뛰어나다 => 보통 (사용자의 일부 정보)
         : 모든 JSP에서 사용이 가능 (공유)
         : 사용처 = 로그인시에 사용자 정보 저장
         => 동작
             1. 사용자가 JSP에서 처음 접근 시 => 서버는 새로운 세션을 생성
                 => 사용자(브라우저) 마다 1개만 생성
             2. 사용자가 브라우저를 종료 / 일정 시간이 지나면 자동 해제 
                 => 기본 30분 
         => 주요 메소드
             1. *** setAttribute(String Key, object obj) : 세션에 저장 
             2. *** getAttribute(String Key) : 저장 된 세션 값 읽기
             3. removeAttribute(String Key) : 특정 세션에 저장 된 값 1개 삭제
             4. *** invalidate() : 모든 세션 해제 => logout
             5. isNew() : 새로 생성된 세션 여부 확인 => 장바구니
             6. *** setMaxInactiveInterval(int second) => 기간 설정  
                     => 1800초(30분)
         => 브라우저로 데이터 전송
             1. 일회성 : request
             2. 공유성 : session
         => 로그인시에 사용자의 일부 정보 저장
         => 댓글 (ID) 참조       
      ---------------------------------------------------------------
       주의점
         1. 세션은 브라우저 별로 개별 관리
         2. 보안상의 문제가 있는 데이터를 저장 (id, pwd...)
         3. 오래 유지하지 않는다
             => 서버에서 자원(파일, 세션, 쿠키..) => 많이 사용
         4. 세셔의 유지 기간을 적절하게 설정
             => 로그인 / 경매 ...                                                 
 --%>   
 <%
    // 세션에 저장
    session.setAttribute("username", "홍길동");
    session.setAttribute("role", "admin");
    // 세션 데이터 조회
    String name = (String)session.getAttribute("username");
    String role = (String)session.getAttribute("role");   
 %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <%-- 세션 정보 출력 --%>
   <h1>세션 정보 출력</h1>
   세션 ID : <%= session.getId() %><br>
   사용자 이름 : <%= name %><br>
   사용자 권한 : <%= role %><br>
   생성 시간 : <%= new Date(session.getCreationTime()) %><br>
   마지막 접속 : <%= new Date(session.getLastAccessedTime()) %><br>
   <h1>유효 시간 </h1>
   <%
      session.setMaxInactiveInterval(600);
   %> 
   유효시간 : <%= session.getMaxInactiveInterval() %><br>
   <a href="remove.jsp">세션 삭제</a><br>
   <a href="invalidate.jsp">세션 완전 종료</a>
</body>
</html>