<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width: 960px;
}
p {
   overflow: hidden;
   white-space: nowrap;
   text-overflow: ellipsis;
}
</style>
</head>
<body>
  <div class="container">
   <div class="row text-center">
    <form method="post" action="../food/find.do">
	    <select name="column" class="input-lg">
	      <option value="address">주소</option>
	      <option value="name">업체명</option>
	    </select>
	    <input type=text size=30 class="input-lg" name="ss">
	    <input type=submit value="검색" 
	     class="btn-lg btn-primary">
     </form> 
   </div>
   <div class="row" style="margin-top: 20px">
     <c:forEach var="vo" items="${list }">
      <div class="col-md-3">
	    <div class="thumbnail">
	      <a href="../food/detail.do?fno=${vo.fno }&page=${curpage}">
	        <img src="${vo.poster }" style="width:230px;height: 150px">
	        <div class="caption">
	          <p>${vo.name }</p>
	        </div>
	      </a>
	    </div>
	  </div>
	</c:forEach>
   </div>
  </div>
</body>
</html>