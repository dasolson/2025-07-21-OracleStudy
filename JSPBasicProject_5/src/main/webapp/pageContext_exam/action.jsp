<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="container">
      <div class="row">
        <%
           for(int i = 1; i <=  4; i++){        	              
        %>
         <div class="col-md-6">
		    <div class="thumbnail">
		      <a href="#">
		        <img src="../jsp<%= i %>.png" alt="Lights" style="width:100%">
		        <div class="caption">
		          <p>JSP 동작</p>
		        </div>
		      </a>
		    </div>
		  </div>
		<%
           }
		%>  
      </div>
   </div>
</body>
</html>