<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
   
<%--
       변수 선언 : <c:set>
                 var   : 변수명
                 value : 값 설정
                 => request.setAttribute() => 변경
 --%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>자바</h2>
      <%
         int sum = 0;
         for(int i = 1; i <= 10; i++){
             sum += i;       	 
         }
      %>
      <%= "1~10까지의 총합 : " +sum %>
   <h2>JSTL</h2>
      <c:set var="sum" value="0"/>
      <c:forEach var="i" begin="1" end="10">
         <c:set var="sum" value="${sum + i }"/>
      </c:forEach>   
      1~10까지의 총합 : ${sum }
   <%--
         JSTL => XML 형식
           = 쌍으로 만든다 : 여는 태그 / 닫는 태그가 동일해야 한다
                         -------   -------
                           <>        </>
                         => 단독 태그 : <태그/>
                              <c:set />
                         => 태그가 완성 (표준화)  
           = 반드시 속성값에는 "" 사용
           = 대소문자 구분 (태그, 속성)
           = 사용자 정의 태그 / 속성은 사용 불가
           = import => <%@ taglib ~ %>
                            시작 태그 => prefix="c"
                                       ---------- 사용자 정의
                                       uri="jakarta.tags.core" 
                                       uri="jakarta.tags.format"
                                       uri="jakarta.tags.functions"
                                      ------------------------------------ tomcat 10ver 이상  
                                       uri="http://java.sun.com/jsp/jstl/core"
                                       uri="http://java.sun.com/jsp/jstl/format"
                                       uri="http://java.sun.com/jsp/jstl/functions"                                      
    --%>   
</body>
</html>