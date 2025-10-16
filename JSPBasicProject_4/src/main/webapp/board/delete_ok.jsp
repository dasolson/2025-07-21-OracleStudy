<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*"%>
<%
    String no = request.getParameter("no");
    String pwd = request.getParameter("pwd");
    boolean bCheck = BoardDAO.boardDelete(Integer.parseInt(no), pwd);
    if(bCheck == true) {
    	response.sendRedirect("list.jsp");
    }else {
    	out.println("<script>");
    	out.println("alert(\"비밀번호가 틀립니다\");");
    	out.println("history.back();");
    	out.println("</script>");
    }
%>