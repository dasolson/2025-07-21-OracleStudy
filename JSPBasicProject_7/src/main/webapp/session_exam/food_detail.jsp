<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,com.sist.dao.*"%>
<%@ page import="java.util.*" %>
<%
    // session에서 데이터 읽기
    String id=(String)session.getAttribute("id");
    //1. 사용자 보내준 데이터 받기 
    String fno=request.getParameter("fno");
    FoodVO vo=FoodDAO.foodDetailData(Integer.parseInt(fno));
    // 댓글 
    List<ReplyVO> list = ReplyDAO.replyListData(Integer.parseInt(fno));
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
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
     <jsp:include page="login.jsp"></jsp:include>
   </div>
   <div style="height: 20px"></div>
   <div class="row">
     <table class="table">
      <tr>
       <td width=30% class="text-center" rowspan="9">
        <img src="<%=vo.getPoster() %>" style="width: 240px;height: 350px">
       </td>
       <td colspan="2">
        <h3><%=vo.getName() %>&nbsp;
         <span style="color:orange;"><%=vo.getScore() %></span></h3>
       </td>
      </tr>
      <tr>
       <td width=20% style="color:gray">주소</td>
       <td width=50%><%=vo.getAddress() %></td>
      </tr>
      <tr>
       <td width=20% style="color:gray">전화</td>
       <td width=50%><%=vo.getPhone() %></td>
      </tr>
      <tr>
       <td width=20% style="color:gray">음식종류</td>
       <td width=50%><%=vo.getType() %></td>
      </tr>
      <tr>
       <td width=20% style="color:gray">영업시간</td>
       <td width=50%><%=vo.getTime() %></td>
      </tr>
      <tr>
       <td width=20% style="color:gray">가격대</td>
       <td width=50%><%=vo.getPrice() %></td>
      </tr>
      <tr>
       <td width=20% style="color:gray">주차</td>
       <td width=50%><%=vo.getParking() %></td>
      </tr>
      <tr>
       <td width=20% style="color:gray">테마</td>
       <td width=50%><%=vo.getTheme() %></td>
      </tr>
     </table>
     <table class="table">
       <tr>
        <td><%=vo.getContent() %></td>
       </tr>
       <tr>
         <td class="text-right">
          <a href="food_list.jsp" 
            class="btn btn-sm btn-success">목록</a>
         </td>
       </tr>
     </table>
   </div>
   <div style="height: 20px"></div>
   <div class="row">
	   <h3>댓글</h3>
	   <hr width="800">
	   <table class="table">
	    <tr>
	     <td>
	        <%
	           for(ReplyVO rvo:list){
	        %>
	        
	         <table class="table">
			    <tr>
			     <td class="text-left">◑<%=rvo.getName() %>(<%=rvo.getDbday() %>)</td>
			     <td class="text-right">
			     <%
			         if(rvo.getId().equals(id)) { // 본인 확인
			     %>
				        <a href="#" class="btn btn-sm btn-danger">수정</a>
				        <a href="reply_delete.jsp?rno=<%=rvo.getRno() %>&fno=<%=fno %>" class="btn btn-sm btn-success">삭제</a>
			     <%
			         }
			     %>   
			     </td>
			    </tr>
			    <tr>
			      <td colspan="2">
			       <pre style="white-space:pre-wrap;border: none;background-color: white"><%= rvo.getMsg() %></pre>
			      </td>
			    </tr>
			   </table>
			       
	        <%	   
	           }
	        %>   
	     </td>
	    </tr>
	   </table>
	   
	   <%
	     if(id!=null) // 로그인된 상태
	     {
	   %>
	        <table class="table">
	         <tr>
	          <td>
	           <form method="post" action="reply_insert.jsp">
		           <textarea rows="4" cols="85" name="msg" style="float: left"></textarea>
		           <input type=hidden name=fno value="<%=fno%>">
		           <input type=submit value="댓글쓰기" class="btn-primary"
		            style="float: left;height: 88px"
		           >
	           </form>
	          </td>
	         </tr>
	        </table>
	   <%
	     }
	   %>
   </div>
  </div>
</body>
</html>