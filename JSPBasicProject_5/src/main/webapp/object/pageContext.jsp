<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      1. 내장 객체 얻기
          request  : getRequest()
          response : getResponse()
                     getOut(), getSession()
                     getException(), getPage()
            request.getParameter()
            pageContext.getRequest().getParameter()         
      2. 웹 흐름 제어
          => 화면 이동 / 다른 JSP 포함
             -------  ------------ 
             forward()  include()
                |           |
                -------------
                      |
                  request 공유   
             => JSP 액션 태그
              <jsp:forward>  <jsp:include>
      3. 클래스 : PageContext
      
         = <%@ include file="a.jsp"%>    => 정적 include
          
                  ex)
		             a.jsp
		             <%
		                int a = 100;
		             %>
		             <html>
		             <body>
		                <h1><%= a %></h1>
		                <%@ include file="b.jsp" %>
		             </body>
		             </html>
		             
		             b.jsp
		             <%
		                int a = 1000;
		             %>
		             <html>
		             <body>
		                <h1><%= a %></h1>
		             </body>
		             </html>
         = pageContext.include("a.jsp"); => 동적 include (각각 컴파일 후 HTML 합친다)
         
	         ex)
	             a.jsp
	             <%
	                int a = 100;
	             %>
	             <html>
	             <body>
	                <h1><%= a %></h1>
	                <%
	                   pageContext.include("b.jsp")
	                %>
	             </body>
	             </html>
	             
	             b.jsp
	             <%
	                int a = 1000;
	             %>
	             <html>
	             <body>
	                <h1><%= a %></h1>
	             </body>
	             </html>
	            --------------------------------- error가 없다  
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>