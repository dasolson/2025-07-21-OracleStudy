<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>   
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ taglib prefix="fn" uri="jakarta.tags.functions" %> 
<%--
        JSTL => 태그로 자바의 기본 문법 제작 (화면 UI)
        <%@ taglib prefix="c" uri="jakarta.tags.core" %> => 라이브러리 로드
                   ----------
                    접두어 : <c:~> => 사용자 정의
                    prefix="core" => <core:~>
                 1) 변수 선언
                     <c:set> => request.setAttribute()
                 2) 제어문 
                     <c:forEach> => for문
                     <c:if>      => 조건문 <c:else>(X)
                     <c:choose>  => 다중 조건 , 선택문
                        <c:when><c:when>
                        <c:when><c:when>
                        <c:when><c:when>
                        <c:otherwise><c:otherwise> : default
                     </c:choose>
                 2-1) 화면 이동
                     <c:redirect> => sendRedirect()
                 ------------- core 태그
                 3) 변환
                 ------------- fmt
                 4) 문자열 함수 
                 ------------- fn (function)
                   fn:trim() => String이 가지고 있는 모든 메소드 
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>