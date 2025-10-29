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
      <a class="navbar-brand" href="../main/main.do">MVCMiddle</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="../main/main.do">Home</a></li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">맛집
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../food/type.do">음식 종류</a></li>
          <li><a href="../food/find.do">맛집 검색</a></li>
        </ul>
      </li>
      <li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" href="#">뮤직
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="../music/list.do">뮤직 목록</a></li>
          <li><a href="../music/type.do">뮤직 종류</a></li>
          <li><a href="../music/find.do">뮤직 검색</a></li>
        </ul>
      </li>
      <li><a href="../board/list.do">묻고 답하기</a></li>
    </ul>
  </div>
</nav>
</body>
</html>