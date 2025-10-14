<%--
      _jspService() {
 --%>
<%@ page info="맛집종류별 출력" language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" buffer="16kb" errorPage="error.jsp"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*,com.sist.vo.*" %>
<%--
    final jakarta.servlet.http.HttpServletRequest request, final jakarta.servlet.http.HttpServletResponse response
    final jakarta.servlet.jsp.PageContext pageContext;
    jakarta.servlet.http.HttpSession session = null;
    final jakarta.servlet.ServletContext application;
    final jakarta.servlet.ServletConfig config;
    jakarta.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;

    // 1. 사용자의 요청 정보
    // page 요청
    
    // 음식종류 요청
    
--%>
<%
    // page
    String strPage = request.getParameter("page");
    if(strPage == null)
    	strPage = "1";
    int curpage = Integer.parseInt(strPage);
    
    // 음식종류
    String type = request.getParameter("type");
    if(type == null)
    	type = "한식";
    
    Map map = new HashMap();
    map.put("start",(curpage*20)-20);
    map.put("type",type);
    
    List<FoodVO> list = FoodDAO.foodListData(map);
    int totalpage = FoodDAO.foodTotalPage(type);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
.table {
   margin: 0px auto; /* 가운데 정렬 */
}
a{
   color: black;
   text-decoration: none;
}
a:hover{
   color: cyan;
   text-decoration: underline;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	// vuejs => mounted() , react => effect()
	// 일반 자바스크립트 = window.onload=function(){}
	$('#keyword').keyup(function(){
		let k=$(this).val();
		$('.user-table > tbody > tr').hide();
		let temp=$('.user-table > tbody > tr > td:nth-child(4n+3):contains("'+k+'")');
		$(temp).parent().show();
	})
})
</script>
</head>
<body>
   <table class="table" width="800">
      <tbody>
         <tr>
            <td align="center">
               <a href="list.jsp?type=한식">한식</a>&nbsp;
               <a href="list.jsp?type=양식">양식</a>&nbsp;
               <a href="list.jsp?type=중식">중식</a>&nbsp;
               <a href="list.jsp?type=일식">일식</a>&nbsp;
               <a href="list.jsp?type=분식">분식</a>
            </td>
         </tr>
      </tbody>
   </table>
   <table class="table" width=800">
      <tr>
         <td>
            <input type="text" size="20" id="keyword" placeholder="검색어 입력">
         </td>
      </tr>
   </table>
   <table class="table user-table" width="800">
      <thead>
         <tr>
            <th>번호</th>
            <th></th>
            <th>업체명</th>
            <th>음식종류</th>
         </tr>
      </thead>
      <tbody>
         <%
            for(FoodVO vo:list){
         %>
                <tr>
                   <td align="center"><%=vo.getFno() %></td>
                   <td align="center">
                      <img src="<%=vo.getPoster() %>" style="width: 30px; height: 30px">
                   </td>
                   <td><a href="detail.jsp?fno=<%=vo.getFno()%>"><%=vo.getName() %></a></td>
                   <td><%=vo.getType() %></td>
                </tr>
         <%  	
            }
         %>
      </tbody>
   </table>
   <table class="table">
      <tbody>
         <tr>
            <td align="center">
               <a href="list.jsp?page=<%=curpage>1?curpage-1:curpage%>&type=<%=type%>">이전</a>
                  <%=curpage %> page / <%=totalpage %> pages
               <a href="list.jsp?page=<%=curpage<totalpage?curpage+1:curpage%>&type=<%=type%>">다음</a>
            </td>
         </tr>
      </tbody>
   </table>
</body>
</html>
<%--
   }
--%>   
