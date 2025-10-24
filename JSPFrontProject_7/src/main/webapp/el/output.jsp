<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    String id = request.getParameter("id");
	String pwd = request.getParameter("pwd");
	
	request.setAttribute("id", id);
	request.setAttribute("pwd", pwd);
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   ID : ${param.id }<br>
   Password : ${param.pwd }
</body>
</html>