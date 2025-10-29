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
  width: 800px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
     <h1 class="text-center">묻고 답하기</h1>
     <table class="table">
      <tr>
       <td>
        <a href="../board/insert.do" 
          class="btn btn-sm btn-primary">새글</a>
       </td>
      </tr>
     </table>
     <table class="table table-striped">
      <thead>
        <tr>
          <th class="text-center" width="10%">번호</th>
          <th class="text-center" width="45%">제목</th>
          <th class="text-center" width="15%">이름</th>
          <th class="text-center" width="20%">작성일</th>
          <th class="text-center" width="10%">조회수</th>
        </tr>
      </thead>
      <tbody>
        <c:set var="count" value="${count }"/>
        <c:forEach var="vo" items="${list }">
          <tr>
	          <td class="text-center" width="10%">${count }</td>
	          <td width="45%">
	          <c:if test="${vo.group_tab>0 }">
	            <c:forEach var="i" begin="1" end="${vo.group_tab }">
	              &nbsp;&nbsp;
	            </c:forEach>
	            <img src="../replyboard/re_icon.png">
	          </c:if>
	          <a href="../board/detail.do?no=${vo.no }">${vo.subject }</a>
	          <%--
	               ?no=10  = request.setAttribute("no",10)
	               => getParameter("no") => 10
	           --%>
	          &nbsp;
	          <c:if test="${vo.dbday==today }">
	           <sup><img src="../replyboard/new.gif"></sup>
	          </c:if>
	          </td>
	          <td class="text-center" width="15%">${vo.name }</td>
	          <td class="text-center" width="20%">${vo.dbday }</td>
	          <td class="text-center" width="10%">${vo.hit }</td>
         </tr>
         <c:set var="count" value="${count-1 }"/>
        </c:forEach>
      </tbody>
     </table>
     <table class="table">
       <tr>
         <td class="text-left">
          <input type="checkbox" value="name">이름
          <input type="checkbox" value="subject">제목
          <input type="checkbox" value="content">내용
          <input type=text class="input-sm" size=10 name=fd>
          <input type=button value="검색"
            class="btn-sm btn-danger">
         </td>
         <td class="text-right">
          <a href="#" class="btn btn-sm btn-success">이전</a>
            ${curpage } page / ${totalpage } pages
          <a href="#" class="btn btn-sm btn-success">다음</a>
         </td>
       </tr>
     </table>
    </div>
    
  </div>  
</body>
</html>



