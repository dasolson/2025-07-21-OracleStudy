<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    List<String> names = new ArrayList<String>();
	names.add("홍길동");
	names.add("심청이");
	names.add("이순신");
	names.add("강감찬");
	names.add("박문수");
	// for-each : 배열 / 컬렉션
	List<String> sexs = new ArrayList<String>();
	sexs.add("남자");
	sexs.add("여자");
	sexs.add("남자");
	sexs.add("남자");
	sexs.add("남자");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>&lt;c:forEach&gt;</h1>
   <h2>자바</h2>
   <%
      for(int i = 1; i <= 10; i++){
   %>
          <%= i %>&nbsp;
   <% 	  
      }
   %>
   <h2>JSTL</h2>
   <%--
         단점 : var   => 변수
               begin => 시작점
               end   => 끝 ==> 포함 (<=)
               step  => 증가값
               ** step = "1" ==> 생략 가능
               ** - 는 사용 불가
               ** 화면 출력만 담당
               ---------------------------
               => 페이징 
    --%>
   <c:forEach var="i" begin="1" end="10" step="1">
      ${i }&nbsp;
   </c:forEach>
   <h2>자바 : for-each</h2>
   <%
      for(String name:names){
   %>
          <%=name %>&nbsp;
   <% 	  
      }
   %>
   <%
      request.setAttribute("list", names);
   %>
   <%--
          var       : 배열이나 컬렉션에 저장된 데이터를 받는 변수
          items     : 배열 / 컬렉션
          varStatus : 배열 / 컬렉션의 인덱스
    --%>
   <h2>JSTL</h2>
   <ul>
      <c:forEach var="name" items="${list }" varStatus="s">
         <li>${s.index+1 }.${name }</li>
      </c:forEach>
   </ul>
   <h2>자바 : &lt;c:forTokens&gt;</h2>
   <%
      String color = "green, blue, yellow, black, red";
      StringTokenizer st = new StringTokenizer(color, ",");
      while(st.hasMoreTokens()){
   %>
          <%= st.nextToken() %>&nbsp;
   <% 	  
      }
   %>
   <h2>JSTL</h2>
   <c:forTokens items="green, blue, yellow, black, red" delims="," var="color">
      ${color }&nbsp;
   </c:forTokens>
   <h2>자바 (List 두개 출력)</h2>
	   <ul>
	   <%
	      for(int i = 0; i < names.size(); i++){
	   %>
	          <li><%= names.get(i) %>(<%=sexs.get(i) %>)</li>
	   <% 	  
	      }
	   %>
	   </ul>
	   <h2>JSTL</h2>
	   <%
	      request.setAttribute("sexs", sexs);
	   %>
	   <ul>
	      <c:forEach var="name" items="${list }" varStatus="s">
	         <li>${name }(${sexs[s.index] })</li>
	      </c:forEach>
	   </ul>
</body>
</html>