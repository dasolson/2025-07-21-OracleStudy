<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.manager.*"%>
<%
    String no = request.getParameter("no");
    if(no == null)
    	no = "0";
    JspChange jc = new JspChange();
    String jsp = jc.change(Integer.parseInt(no));
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style type="text/css">
.row {
   width: 960px;
   margin: 0px auto;
}
</style>
</head>
<body>
   <%
      pageContext.include("header.jsp");
   %>
   <%
      pageContext.include(jsp);
   %>
</body>
</html>