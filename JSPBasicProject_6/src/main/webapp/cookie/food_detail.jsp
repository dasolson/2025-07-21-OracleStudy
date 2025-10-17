<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sist.vo.*,com.sist.dao.*" %>   
<%
    // food_detail.jsp?fno="+fno
    String fno = request.getParameter("fno");
    // 데이터베이스 연결
    FoodVO vo = FoodDAO.foodDetilData(Integer.parseInt(fno));
    
    // 댓글 처리
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
   width: 800px;
   margin: 0px auto;
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
         <table class="table">
            <tr>
               <td width="30%" Class="text-center" rowspan="9">
                  <img src="<%= vo.getPoster() %>" style="width: 100%">                  
               </td>
               <td colspan="2">
                  <h2><%= vo.getName() %>&nbsp;
                     <span style="color:orange;"><%= vo.getScore() %></span>
                  </h2>
               </td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">주소</td>
               <td width="55%"><%=vo.getAddress() %></td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">전화</td>
               <td width="55%"><%=vo.getPhone() %></td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">음식종류</td>
               <td width="55%"><%=vo.getType() %></td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">가격대</td>
               <td width="55%"><%=vo.getPrice() %></td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">영업시간</td>
               <td width="55%"><%=vo.getTime() %></td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">주차</td>
               <td width="55%"><%=vo.getParking() %></td>
            </tr>
            <tr>
               <td style="color:gray" width="15%">테마</td>
               <td width="55%"><%=vo.getTheme() %></td>
            </tr>
         </table>
         <table class="table">
            <tr>
               <td><%=vo.getContent() %></td>
            </tr>
            <tr>
               <td class="text-right">
                  <a href="food_list.jsp" class="btn btn-sm btn-primary">목록</a>
               </td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>