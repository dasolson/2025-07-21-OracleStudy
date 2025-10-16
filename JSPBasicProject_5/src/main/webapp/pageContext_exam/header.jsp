<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
   <nav class="navbar navbar-inverse">
	  <div class="container-fluid">
	    <div class="navbar-header">
	      <a class="navbar-brand" href="#">JSP</a>
	    </div>
	    <ul class="nav navbar-nav">
	      <li class="active"><a href="main.jsp">Home</a></li>
	      <li class="dropdown">
	        <a class="dropdown-toggle" data-toggle="dropdown" href="#">JSP
	        <span class="caret"></span></a>
	        <ul class="dropdown-menu">
	          <li><a href="main.jsp?no=1">JSP 동작</a></li>	          
	          <li><a href="main.jsp?no=2">JSP 지시자</a></li>
	        </ul>
	      </li>
	      <li><a href="main.jsp?no=4">내장 객체</a></li>
	      <li><a href="#">요약</a></li>
	    </ul>
	  </div>
	</nav>
</body>
</html>