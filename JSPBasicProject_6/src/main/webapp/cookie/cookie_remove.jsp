<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String fno = request.getParameter("fno");
    Cookie[] cookies = request.getCookies();
    if(cookies != null){
    	for(int i = cookies.length-1; i >= 0; i--){
			if(cookies[i].getName().equals("food_" +fno)){
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
				break;
			}
    	}	
    }
%>