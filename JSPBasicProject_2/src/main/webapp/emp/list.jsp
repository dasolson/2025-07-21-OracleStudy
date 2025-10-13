<%@ page import="com.sist.dao.empDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ page import="java.util.*" %>
<%@ page import="com.sist.vo.*" %>
<%@ page import="com.sist.dao.*" %>    
<%--
       1. 사용자 요청값 받기 => getParameter()
       2. 데이터베이스 연동 후 값 읽기
 --%>    
 <%
    List<empVO> list = empDAO.empListData();
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="table.css">
<style type="text/css">
.table {
   margin: 0px auto;
}
a {
   color: black;
   text-decoration: none;
}
a:hover{
   color: green;
   text-decoration: none;
}
</style>
</head>
<body>
   <h1>사원 목록</h1>
   <table class="table" width="800">
      <thead>
         <tr>
            <th>사번</th>
            <th>이름</th>
            <th>직위</th>
            <th>입사일</th>
            <th>급여</th>
         </tr>
      </thead>
      <tbody>
         <%
            for(empVO vo:list){
         %>
                <tr>
                   <td align="center"><%=vo.getEmpno() %></td>
                   <td align="center">
                   <a href="detail.jsp?empno=<%=vo.getEmpno()%>"><%=vo.getEname() %></a>
                   </td>
                   <td align="center"><%=vo.getJob() %></td>
                   <td align="center"><%=vo.getDbday() %></td>
                   <td align="center"><%=vo.getSal() %></td>
                </tr>
         <%   	
            }
         %>
      </tbody>
   </table>
</body>
</html>