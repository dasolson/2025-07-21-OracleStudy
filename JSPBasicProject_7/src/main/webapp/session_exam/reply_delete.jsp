<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    String rno = request.getParameter("rno");
    String fno = request.getParameter("fno");
    ReplyDAO.replyDelete(Integer.parseInt(rno));
    response.sendRedirect("food_detail.jsp?fno="+fno);
%>