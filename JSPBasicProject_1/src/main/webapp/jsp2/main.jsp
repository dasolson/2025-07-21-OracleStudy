<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String mode = request.getParameter("mode");
   if(mode == null)
	   mode = "1";
   
   String jsp = "";
   switch(mode){
   case "1":
       jsp = "join.jsp";
       break;
   case "2":
	   jsp = "board.jsp";
       break;
   case "3":
	   jsp = "food.jsp";
       break;
   case "4":
	   jsp = "recipe.jsp";
       break;
       
   }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div>
      <ul>
         <li><a href="main.jsp?mode=1">회원</a></li>
         <li><a href="main.jsp?mode=2">게시판</a></li>
         <li><a href="main.jsp?mode=3">맛집</a></li>
         <li><a href="main.jsp?mode=4">레시피</a></li>
      </ul>
   </div>
   <div style="height: 50px"></div>
   <div>
      <jsp:include page="<%= jsp %>"></jsp:include>
   </div>
</body>
</html>