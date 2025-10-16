<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
    // 1. 사용자가 보내준 값 받기
    String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String pwd = request.getParameter("pwd");
	String no = request.getParameter("no");
	
	// 2. BoardVO로 모아서 => DAO로 전송
	BoardVO vo = new BoardVO();
	vo.setName(name);
	vo.setSubject(subject);
	vo.setContent(content);
	vo.setPwd(pwd);
	vo.setNo(Integer.parseInt(no));
    // 2. 요청 처리 => 이동 
    boolean bCheck = BoardDAO.boardUpdate(vo);
    
    if(bCheck == true) {
    	response.sendRedirect("detail.jsp?no="+ vo.getNo());
    }else {
    	out.println("<script>");
    	out.println("alert(\"비밀번호가 틀립니다\");");
    	out.println("history.back();");
    	out.println("</script>");
    }
    
%>    
