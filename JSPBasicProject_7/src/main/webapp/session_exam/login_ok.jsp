<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.dao.*,com.sist.vo.*"%>
<%
    //1. 사용자가 보낸 데이터 읽기
    String id=request.getParameter("id");
    String pwd=request.getParameter("pwd");
    
    MemberVO vo=MemberDAO.memberLogin(id, pwd);
    if(vo.getMsg().equals("NOID"))
    {
    	// AJAX / VueJS
%>
        <script>
        alert("아이디 존재하지 않습니다!!");
        history.back();
        </script>
<%
    }
    else if(vo.getMsg().equals("NOPWD"))
    {
%>
       <script>
        alert("비밀번호가 틀립니다!!");
        history.back();
        </script>
<%
    }
    else
    {
    	// 로그인인 경우 
    	session.setAttribute("id", vo.getId());
    	session.setAttribute("name", vo.getName());
    	// 이동 
    	response.sendRedirect("food_list.jsp");
    }
%>