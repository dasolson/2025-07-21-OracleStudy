<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*,com.sist.vo.*" %>    
<%
    // 1. 사용자 요청 값 받기 => page
    String strPage = request.getParameter("page");
    if(strPage == null)
    	strPage = "1"; // default
    // 2. 현재 페이지 지정
    int curpage = Integer.parseInt(strPage);
    // 3. curpage에 해당 되는 데이터를 오라클로부터 가지고 온다 
    Map map = new HashMap();
    int rowSize = 12;
    int start = (rowSize*curpage)-(rowSize-1); // rownum은 1번
    int end = rowSize*curpage;
    map.put("start", start);
    map.put("end", end);
    List<FoodVO> list = FoodDAO.foodListData(map);
    // 총페이지 읽기
    int totalpage = FoodDAO.foodTotalPage();
    // 블록별 페이지 나누기
    final int BLOCK = 10;
    int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
    int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
    		
    if(endPage > totalpage)
    	endPage = totalpage;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
   margin: 50px;
}
.row {
   width: 960px;
   margin: 0px auto;
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
      <%--
            pageContext.include() => 태그형으로 제작
            => JSP 안에 특정 부분에 다른 JSP 추가
            => 데이터 공유
            => Spring 에서도 사용 가능 : 화면 분할 
       --%>
      <jsp:include page="login.jsp"></jsp:include>
      <div style="height: 20px"></div>
      <div class="row">
         <%
            for(FoodVO vo:list){
         %>
                <div class="col-md-3">
				    <div class="thumbnail">
				      <a href="food_detail.jsp?fno=<%=vo.getFno()%>">
				        <img src="<%= vo.getPoster() %>" style="width:230px; height: 150px">
				        <div class="caption">
				          <p><%= vo.getName() %>></p>
				        </div>
				      </a>
				    </div>
				  </div>
         <%   	
            }
         %>
      </div>
      <div style="height: 20px"></div>
      <div class="row text-center">
         <ul class="pagination">
         <%
            if(startPage > 1) {
         %>
                <li><a href="food_list.jsp?page=<%= startPage-1%>">&lt;</a></li>
         <%
            }
         %>   
         <%
            for(int i = startPage; i <= endPage; i++){
         %>
                <li <%= i == curpage?"class=active":"" %>><a href="food_list.jsp?page=<%=i%>"><%= i %></a></li>
         <%
            }
         %>   
         <%
            if(endPage < totalpage) {
         %>   
               <li><a href="food_list.jsp?page=<%=endPage+1%>">&gt;</a></li>
         <%
            }
         %>   
         </ul>
      </div>
   </div>
</body>
</html>