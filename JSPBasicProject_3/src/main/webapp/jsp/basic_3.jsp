<%@ page info="수정 2025-10-14" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" errorPage="error.jsp"
    buffer="8kb"    
%>
<%--
      page 지시자 속성 : 139 page
        1) contentType : 출력 형식을 브라우저로 전송
                          html / xml / json
        2) info        : 파일에 대한 소개 : 사용빈도는 거의 없다
        3) errorPage   : 파일 지정 => 에러 발생시 이동  
        4) buffer      : HTML을 출력 할 메모리 공간의 크기 지정
            => 기본 8kb
        5) import      : 다른 라이브러리 추가 / 사용자 정의 클래스 읽기
            <%@ page import="java.util.*,java.io.*"%>
            <%@ page import="java.util.*"%>
            <%@ page import="java.io.*"%>
            
            => 다른 모든 속성은 한번만 사용이 가능
            => import는 여러번 사용 가능
            => <%@ ~~ %> : 번역되는 태그가 아니고 선언하는 태그이다
            => 항상 맨 윗줄에 서술
            
            JSP 코딩 순서
               1. 지시자 선언 => page / taglib / include (JSP안 특정 영역에 다른 JSP를 추가할 경우)
                              -------------   ------- 해당 위치에 출력
                                 맨 윗줄에 
                  ex) 
                      <div>
                          메뉴
                       </div>      
                       <div>
                          <%@ include file="list.jsp" %>
                       </div>        
        6) isErrorPage : 종류별 에러처리                          
 --%> 
 <%--
     int a = 10/0;
 --%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>ErrorPage 연습</h1>
   <%=
       out.getBufferSize()
   %><br>
   <%=
       out.getRemaining()
   %><br>
   <%=
		   out.getBufferSize()-out.getRemaining()
   %>
</body>
</html>