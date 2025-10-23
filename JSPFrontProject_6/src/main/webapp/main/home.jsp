<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
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
</style>
</head>
<body>
   <div class="container">
      <h2>뮤직 Top100</h2>
      <hr>
      <div class="row">      
         <c:forEach var="vo" items="${list1 }">
            <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="${vo.poster }" alt="Lights" style="width:100%">
			        <div class="caption">
			          <p>${vo.title }</p>
			        </div>
			      </a>
			    </div>
			  </div>
         </c:forEach>
      </div>
      <h2>가요</h2>
      <hr>
      <div class="row">      
         <c:forEach var="vo" items="${list2 }">
            <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="${vo.poster }" alt="Lights" style="width:100%">
			        <div class="caption">
			          <p>${vo.title }</p>
			        </div>
			      </a>
			    </div>
			  </div>
         </c:forEach>
      </div>
      <h2>POP</h2>
      <hr>
      <div class="row">      
         <c:forEach var="vo" items="${list3 }">
            <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="${vo.poster }" alt="Lights" style="width:100%">
			        <div class="caption">
			          <p>${vo.title }</p>
			        </div>
			      </a>
			    </div>
			  </div>
         </c:forEach>
      </div>
      <h2>OST</h2>
      <hr>
      <div class="row">      
         <c:forEach var="vo" items="${list4 }">
            <div class="col-md-3">
			    <div class="thumbnail">
			      <a href="#">
			        <img src="${vo.poster }" alt="Lights" style="width:100%">
			        <div class="caption">
			          <p>${vo.title }</p>
			        </div>
			      </a>
			    </div>
			  </div>
         </c:forEach>
      </div>
   </div>
</body>
</html>