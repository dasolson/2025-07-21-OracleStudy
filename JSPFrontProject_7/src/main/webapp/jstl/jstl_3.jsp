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
	      for(int i = 1; i <= 10; i++){
	    	  if(i%2 == 0){
	   %>
	              <%= i %>&nbsp;
	   <% 		  
	    	  }
	      }
	   %>
    <h2>JSTL</h2>
    <%--
          <c:if>
             test = "조건문" => ${조건문}             
     --%>
       <c:forEach var="i" begin="1" end="10">
          <c:if test="${i mod 2 eq 0 }">
             ${i }&nbsp;
          </c:if>
       </c:forEach>	   
       <%
          session.setAttribute("id", "admin");
          session.setAttribute("pwd", "1234");
       %>
       <h2>자바</h2>
          <%
             String id = (String)session.getAttribute("id");
             String pwd = (String)session.getAttribute("pwd");
             if(id.equals("admin") && pwd.equals("1234")){
          %>
                 관리자로 로그인 되었습니다    
          <%  	 
             }else{
          %>
                 로그인에 실패했습니다
          <%  	 
             }
          %>
       <h2>JSTL</h2>
          <c:if test="${id == 'admin'  && pwd == '1234' }"> 
              관리자로 로그인 되었습니다         
          </c:if>   
          <c:if test="${ id != 'admin'  || pwd != '1234' }">
              로그인에 실패했습니다
          </c:if>
</body>
</html>