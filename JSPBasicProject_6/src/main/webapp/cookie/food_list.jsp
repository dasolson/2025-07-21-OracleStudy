<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.dao.*,com.sist.vo.*" %>     
<%--
       Cookie : 내장 객체가 아니다 => 필요시에 생성
         1. 생성
             Cookie cookie = new Cookie("키", "값")
                                              -- 문자열
                                        --- 중복 없이 => 중복 되는 경우 덮어 쓴다
         2. 기간 설정
             cookie.setMaxAge(초단위)
               하루 => 60*60*24
         3. 브라우저 전송
             response.addCookie(cookie)
        ---------------------------------------------------------------------
        1. 쿠키 읽기
            Cookie[] cookies = reauest.getCookies()
        2. 소멸     
            cookie.setMaxAge(0)
 --%>    
 <%
     // 1. 사용자가 보낸 데이터 받기 => 페이지 요청
     // food_list.jsp?page=2
     String strPage = request.getParameter("page");
     // 첫페이지 문제 => 페이지 지정 어렵다 => default page 지정
     if(strPage == null)
    	 strPage = "1";
     // 1-1. 현재 페이지 저장
     int curpage = Integer.parseInt(strPage);
     // 2. 데이터베이스 값 읽어오기
     int rowSize = 12;
     int start = (rowSize*curpage) - (rowSize-1); // 1 , 13 , 25 ...
     int end = rowSize*curpage; // 12 , 24 , 36 ...
     Map<String, Integer> map = new HashMap<String, Integer>();
     map.put("start", start);
     map.put("end", end);
     // 2-1. 목록 읽기
     List<FoodVO> list = FoodDAO.foodListData(map);
     // 2-2. 총 페이지
     int totalpage = FoodDAO.foodTotalPage();
     
     // 블록별 처리
     final int BLOCK = 10;
     int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
     int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
     
     if(endPage > totalpage)
    	 endPage = totalpage;
     
     // 쿠키 읽기
     Cookie[] cookies = request.getCookies();
     List<FoodVO> cList = new ArrayList<FoodVO>();
     // getName(). getValue()
     // ---------  ----------
     //  키 읽기        값
     if(cookies != null){
    	 // 최신 순으로 읽기
    	 for(int i = cookies.length-1; i >= 0; i--){
    		 // food_로 시작하는 키만 가지고 온다
    		 if(cookies[i].getName().startsWith("food_")){
    			 // 값 읽기
    			 String fno = cookies[i].getValue();
    			 // 번호에 해당되는 VO 객체 읽기
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
</head>
<body>
   <div class="container">
      <div class="row">
         <%
             for(FoodVO vo:list){
         %>
                 <div class="col-md-3">
				    <div class="thumbnail">
				      <a href="food_detail_before.jsp?fno=<%=vo.getFno()%>">
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
      <div style="height: 10px">
      <div class="row text-center">
         <ul class="pagination">
            <%
               if(startPage > 1){
            %>
                  <li><a href="food_list.jsp?page=<%= startPage-1 %>">&lt;</a></li>
            <%
               }
            %>            
            <%
               for(int i = startPage; i <= endPage; i++){         	   
               
            %>
                  <li <%= curpage == i? "class=active":"" %>><a href="food_list.jsp?page=<%= i %>"><%= i %></a></li>
            <%
               }
            %>
            <%
               if(endPage < totalpage){
            %>
                  <li><a href="food_list.jsp?page=<%= endPage+1 %>">&gt;</a></li>
            <%
               }
            %>
         </ul>
      </div>
      <div style="height: 10px"></div>
      <div class="row">
         <div class="recent-container">
            <h3>최근 방문 맛집</h3>
            <a href="cookie_all_view.jsp" class="btn btn-sm btn-info">전체 보기</a>
            <a href="cookie_all_remove.jsp" class="btn btn-sm btn-warning">전체 삭제</a>
            <div class="recent-list">
               <%
                  int i = 0;
                  for(FoodVO vo:cList){                	  
                	  //if(i > 9) break;
               %>
                      <a class="recent-card" href="food_detail.jsp?fno=<%=vo.getFno()%>">
                         <div class="thumb">
                            <img src="<%= vo.getPoster() %>">
                         </div>
                         <div class="meta">
                            <div class="title"><%= vo.getName() %></div>                            
                         </div>
                      </a>
               <% 	  
                	  i++;
                  }
               %>
            </div>
         </div>
      </div>
      </div>
   </div>
</body>
</html>