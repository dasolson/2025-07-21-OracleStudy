<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*,java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    List<Member> list = new ArrayList<Member>();
	list.add(new Member(1, "홍길동1","서울","1111-1111"));
	list.add(new Member(2, "홍길동2","서울","1111-1111"));
	list.add(new Member(3, "홍길동3","서울","1111-1111"));
	list.add(new Member(4, "홍길동4","서울","1111-1111"));
	list.add(new Member(5, "홍길동5","서울","1111-1111"));
	
	//request.setAttribute("list", list);
%>   
<c:set var="list" value="<%=list %>"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>자바 버전</h1>
   <ul>
   <%
       for(Member m:list){
   %>
           <li><%= m.getName() %> - <%= m.getAddress() %> - <%= m.getPhone() %></li>
   <% 	   
       }
   %>
   </ul>
   <h1>JSTL + EL</h1>
   <ul>
      <c:forEach var="m" items="${list }">
         <li>${m.name } - ${m.address } - ${m.phone }</li>
      </c:forEach>
   </ul>
</body>
</html>