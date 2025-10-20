<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id=(String)session.getAttribute("id");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="row">
    <%
      if(id==null)
      {
    %>
     <form method=post action="login_ok.jsp">
	     <div class="text-right">
	      ID:<input type=text size=15 class="input-sm" name=id
	        required
	      >
	      &nbsp;
	      PW:<input type="password" class="input-sm" name=pwd required>
	      <input type=submit value="로그인" 
	         class="btn-sm btn-danger">
	     </div>
     </form>
   <%
      }
      else
      {
   %>
     <form method="post" action="logout.jsp">
	     <div class="text-right">
	      <%= session.getAttribute("name") %>님 로그인중입니다
	      <input type=submit value="로그아웃" 
	         class="btn-sm btn-danger">
	     </div>
     </form>
   <%
      }
   %>
   </div>
</body>
</html>