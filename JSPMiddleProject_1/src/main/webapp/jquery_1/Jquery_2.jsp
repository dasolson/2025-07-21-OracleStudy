<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       1. 테그 읽기
            $(선택자) 
       2. 변경
           1) 속성 변경  ==> $(태그).attr("href")
                           => $(태그).attr("href","값)
           2) 값 변경   ==> $(태그).text()
                           => $(태그).text(값)  <태그>||</태그>
           3) HTML 추가 ==> $(태그).html()
                           => $(태그).html(값)
          --------------------------------------------------- setter                 
           4) 계속 추가  ==> $(태그).append(값) 
       3. 이벤트
           $(태그).이벤트(function(){처리})
                    | click / mousedown / mouseup
                      keyup / keydown / change / hover
           $(태그).on('click', function(){처리})
                      |click / mousedown / mouseup
                       keyup / keydown / change / hover   
           $(태그).hover(function(){
                => 처리 => fi
           }, function(){
                => 처리 => else
           })                 
           
           ==> show / hide   
       4. ajax
       5. effect    
                              
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function() {
	$('#btn1').click(function(){
		let len = $('input[type=checkbox]:checked').length
		alert("선택된 취미 : " +len+ "입니다")
	})
	
	$('#btn2').click(function(){
		$('input[type=checkbox]').prop('checked', true)
	})
	
	$('#btn3').click(function(){
		$('input[type=checkbox]').prop('checked', false)
	})
})
</script>
</head>
<%--
      val()    => input / textarea / select
      text()   => 모든 태그 / 읽기 / 쓰기
      html()   => 읽기 / 쓰기
      append() => 여러개 태그 추가
      attr()   => 속성값 읽기
      prop()   => checkbox / radio
 --%>
<body>
   <button id="btn1">확인</button>
   <button id="btn2">전체</button>
   <button id="btn3">해제</button>
   <p>
   <input type="checkbox" checked>낚시
   <input type="checkbox" checked>운동
   <input type="checkbox" checked>쇼핑
   <input type="checkbox" checked>등산
   <input type="checkbox" checked>게임
</body>
</html>