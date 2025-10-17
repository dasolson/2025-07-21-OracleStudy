<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   String fno = request.getParameter("fno");
   Cookie[] cookies = request.getCookies();
   if(cookies != null){
	   for(int i = 0; i < cookies.length; i++){
		   if(cookies[i].getName().equals("food_"+fno)){
			   cookies[i].setMaxAge(0);
			   response.addCookie(cookies[i]);
			   break;
		   }
	   }
   }
   // 1. cookie 생성
   Cookie cookie = new Cookie("food_"+fno, fno);
   // 2. 저장 기간 
   cookie.setMaxAge(60*60*24); // 1일 저장
   // 3. 쿠키를 브라우저로 전송 
   response.addCookie(cookie);
   
   // 4. 이동 
   response.sendRedirect("food_detail.jsp?fno="+fno);
%>