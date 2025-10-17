<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*"%>
<%--
   // 1. 사용자가 보내준 값 받기
    String name = request.getParameter("name");
	String sex = request.getParameter("sex");
	String address = request.getParameter("address");
	String phone = request.getParameter("phone");
	String admin = request.getParameter("admin");
	
	MemberVO vo = new MemberVO();
	vo.setName(name);
	vo.setSex(sex);
	vo.setAddress(address);
	vo.setPhone(phone);
	vo.setAdmin(Boolean.parseBoolean(admin));
--%> 
<%--
      jsp:useBean id="vo" class="com.sist.vo.MemberVO"
       => MemberVO vo = new MemberVO();
       
      jsp:setProperty name="vo" property="*"
       => String name = request.getParameter("name");
		  String sex = request.getParameter("sex");
		  String address = request.getParameter("address");
		  String phone = request.getParameter("phone");
		  String admin = request.getParameter("admin"); 
 --%> 
<jsp:useBean id="vo" class="com.sist.vo.MemberVO">
   <jsp:setProperty name="vo" property="*"/>
</jsp:useBean>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   이름 : <%=vo.getName() %><br>
   성별 : <%=vo.getSex() %><br>
   주소 : <%=vo.getAddress() %><br>
   전화 : <%=vo.getPhone() %><br>
   관리자 : <%=vo.isAdmin() %>
</body>
</html>