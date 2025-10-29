<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<!-- jquery는 충돌시에 오류 발생  -->
<script type="text/javascript">
/*
 *   DOMScript 
     ---------
     => 태그를 제어하는 프로그램 
        --------
        태그를 가지고 온다 : CSS 선택자 
        => 속성 변경 / HTML 추가 / 이벤트 동작 
           Vue / React 
        => 기반 자바스크립트 
     1) 시작점 (main) 
        $(function(){
        	
        })
        
        $(document).ready(function(){})
         ----------------
        => 자바스크립트로 변경 : window.onload=function(){}
        => Vue: mounted() , React : effect()
     2) 속성 변경 
        $('선택자').css("속성","값")
        $ => doucment.querySelector(CSS)
        $('선택자').attr("속성명") => getter
        $('선택자').attr("속성명","값") =>  stter 
        $('선택자').text("값") => setter
        $('선택자').text() ==> getter 
        => <td>사이에 값 추가</td>
        => $('선택자').val("값")
           $('선택자').val()
           
           => textContent
        <input type=text id="" value="값">
        $('선택자').html() 
           => innerHTML
           
        $('선택자').append() => 계속 추가 
               
 */
$(function(){
	$('h3').css("backgroundColor","yellow")
	$('h3').css("color","blue")
})
</script>
</head>
<body>
  <h1>태그의 CSS적용:$(선택자).css()</h1>
  <h3>Hello Jquery1</h3>
  <h3>Hello Jquery2</h3>
  <h3>Hello Jquery3</h3>
</body>
</html>







