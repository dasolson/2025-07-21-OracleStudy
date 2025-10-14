<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <table border="1" bordercolor="black" width=800 height=600>
      <tr>
         <td align="center" width="800" height="100" colspan="2">
             <%@ include file="header.jsp" %>
         </td>
      </tr>
      <tr>
         <td align="center" width="200" height="400">
             <%@ include file="aside.jsp" %>
         </td>
         <td align="center" width="600" height="400">
             <%@ include file="section.jsp" %>
         </td>
      </tr>
      <tr>
         <td align="center" width="800" height="100" colspan="2">
             <%@ include file="footer.jsp" %>
         </td>
      </tr>
   </table>
</body>
</html>