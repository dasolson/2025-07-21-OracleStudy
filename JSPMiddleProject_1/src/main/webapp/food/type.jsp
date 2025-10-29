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
    <a href="../food/type.do?type=한식" class="btn btn-sm btn-danger">한식</a>
    <a href="../food/type.do?type=양식" class="btn btn-sm btn-success">양식</a>
    <a href="../food/type.do?type=중식" class="btn btn-sm btn-primary">중식</a>
    <a href="../food/type.do?type=일식" class="btn btn-sm btn-warning">일식</a>
    <a href="../food/type.do?type=분식" class="btn btn-sm btn-info">분식</a>
   </div>
   <div style="height: 20px"></div>
   <div class="row">
   <%--
      for(FoodVO vo:list)
      {
   --%>
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
   <div class="row text-center" style="margin-top: 10px">
     <ul class="pagination">
      <%--
        if(startPage>1)
        {
        
       --%>
      <c:if test="${startPage>1 }">
        <li><a href="../food/type.do?page=${startPage-1 }&type=${type}">&lt;</a></li>
      </c:if>
      <%--
        for(int i=startPage;i<=endPage;i++)
      --%>
      <c:forEach var="i" begin="${startPage }" end="${endPage }">
       <li ${i==curpage?"class=active":""}><a href="../food/type.do?page=${i }&type=${type}">${i }</a></li>
      </c:forEach>
      <%--
        if(endPage<totalpage)
       --%>
      <c:if test="${endPage<totalpage }">
       <li><a href="../food/type.do?page=${endPage+1 }&type=${type}">&gt;</a></li>
      </c:if>
     </ul>
   </div>
  </div>
</body>
</html>