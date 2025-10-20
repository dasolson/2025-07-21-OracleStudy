<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.removeAttribute("username");    
%>
<%= "username 삭제 완료" %><br>
<%= session.getAttribute("username")%><br>
<%= session.getAttribute("role")%>
