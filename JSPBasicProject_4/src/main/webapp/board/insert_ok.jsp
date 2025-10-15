<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*, com.sist.vo.*"%>
<%
   // 사용자가 보내준 값 받기
   String name = request.getParameter("name");
   String subject = request.getParameter("subject");
   String content = request.getParameter("content");
   String pwd = request.getParameter("pwd");
   
   BoardVO vo = new BoardVO();
   vo.setName(name);
   vo.setSubject(subject);
   vo.setContent(content);
   vo.setPwd(pwd);
   
   BoardDAO.boardInsert(vo);
   
   // 화면 이동
   response.sendRedirect("list.jsp");
%>