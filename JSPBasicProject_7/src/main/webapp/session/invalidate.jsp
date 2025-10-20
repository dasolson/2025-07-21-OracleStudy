<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    session.invalidate();
%>
<%= "모든 세션 종료 완료" %>
<%= session.getAttribute("username")%><br>
<%= session.getAttribute("role")%>