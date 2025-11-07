<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,com.sist.dao.*"%>
<%
String msg = request.getParameter("msg");
    String fno = request.getParameter("fno");
    String id = (String)session.getAttribute("id");
    String name = (String)session.getAttribute("name");
    // session에 저장 => 모든 JSP에서 사용 가능
    BoardReplyVO vo = new BoardReplyVO();
    vo.setId(id);
    vo.setName(name);
    vo.setMsg(msg);
    vo.setFno(Integer.parseInt(fno));
    
    // DAO 연동
    ReplyDAO.replyInsert(vo);
    
    // 이동 => detail로 이동
    response.sendRedirect("food_detail.jsp?fno="+fno);
%>
