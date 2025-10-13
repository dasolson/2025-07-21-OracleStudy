<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%
   List<String> list = new ArrayList<String>();
   list.add("사과");
   list.add("배");
   list.add("수박");
   list.add("바나나");
   list.add("메론");
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <ul>
      <%
          for(String f:list){
      %>
              <li><%= f %></li>
      <%  	  
          }
      %>
   </ul>
   <%
       for(int i = 1; i <= 3; i++ ){
   %> 
           <img src="<%= "mm" + i + ".jpg" %>" style="width:150px; height:200px;">
   <%	   
       }
   %>
</body>
</html>