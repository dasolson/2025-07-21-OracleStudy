<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.vo.*,com.sist.dao.*" %>
<%
   Cookie[] cookies = request.getCookies();
   List<FoodVO> cList = new ArrayList<FoodVO>();
	if(cookies != null){
		for(int i = cookies.length-1; i >= 0; i--){
			if(cookies[i].getName().startsWith("food_")){
				String fno = cookies[i].getValue();
				FoodVO vo = FoodDAO.foodDetilData(Integer.parseInt(fno));
				cList.add(vo);
			}
		}
	}
%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="cookie.css">
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
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('.btn-info').click(function() {
		let fno = $(this).attr("data-no")
		$.ajax({
			url:'cookie_remove.jsp', 
			type:'post',
			data:{"fno":fno},
			success:function(result){
				location.href="cookie_all_view.jsp"
			}
		})
	})
})
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <%
             for(FoodVO vo:cList){
         %>
                 <div class="col-md-4">
				    <div class="thumbnail">				      
				        <img src="<%= vo.getPoster() %>" style="width:230px; height: 150px">
				        <div class="caption">
				          <p><%= vo.getName() %>></p>
				          <p><input type="button" value="삭제" class="btn-sm btn-info" data-no="<%= vo.getFno()%>"></p>
				        </div>
				      </a>
				    </div>
				  </div>
         <%   	 
             }
         %>
      </div>
      <div style="height: 20px"></div>
      <div class="row text-right">
         <a href="food_list.jsp" class="btn btn-sm btn-success">목록</a>
      </div>
   </div>
</body>
</html>