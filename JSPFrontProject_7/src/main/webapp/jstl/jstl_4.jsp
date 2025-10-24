<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>자바</h2>
      <%
         int i = 4;
         switch(i){
         case 0:
      %>
         ☆☆☆☆☆
      <%  	 
        	 break;
         case 1:
      %>
         ★☆☆☆☆
      <%  	 
             break;
         case 2:
      %>
         ★★☆☆☆
      <%  	 
        	 break;
         case 3:
      %>
         ★★★☆☆
      <%  	 
        	 break;
         case 4:
      %>
         ★★★★☆
      <%
        	 break;
         case 5:
      %>
         ★★★★★
      <%  	 
        	 break;
         }
      %>
   <h2>JSTL</h2>
      <%
         request.setAttribute("no", 6);
      %>   
      <c:choose>
         <c:when test="${no == 0 }">☆☆☆☆☆</c:when>
         <c:when test="${no == 1 }">★☆☆☆☆</c:when>
         <c:when test="${no == 2 }">★★☆☆☆</c:when>
         <c:when test="${no == 3 }">★★★☆☆</c:when>
         <c:when test="${no == 4 }">★★★★☆</c:when>
         <c:when test="${no == 5 }">★★★★★</c:when>
         <c:otherwise>별점이 없습니다.</c:otherwise>
      </c:choose>
</body>
</html>