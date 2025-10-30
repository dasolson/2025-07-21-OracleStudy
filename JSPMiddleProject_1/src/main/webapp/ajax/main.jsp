<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       JSP ---------- 서버 ----------- JSP
        |                              |
        --------------------------------
                       | 
                 새로 생성되는 파일 => new
                       
       Ajax 동작 순서
         Ajax : 페이지 전체를 새로고침 하지 않고 서버에서 필요한 데이터만 주고 받는 기술
                 => Vue / React / next / nust...
                 => jquery : 4ver , 5ver 
           | ==> axios
         1) 이벤트 발생 (버튼 클릭 => window.onload...)
                | $('btn').click(function(){})
         2) XMLHttpRequest 객체 생성
            -------------- 브라우저 안에 존재
                |
         3) 요청 설정
             = method / url / data
               ------ GET/POST
                       | $.ajax({
                           type:'post',
                           url:~,
                           data:{}
                       })
         4) 요청 전송 (서버로 요청사항 전송)
                       |
         5) 서버가 요청 처리 후 응답 (JSON, XML)
                       |
         6) 응답을 받아서 Callback 실행
               | success:function(result)
         7) 화면에 출력                                                                             
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
let httpRequest;
function getXMLHttpRequest(){
	if(windoe.XMLHttpRequest){ // firefox , crome
		return new XMLHttpRequest()
	    // $.ajax
	}else {
		return null
	}
}
// 요청 = 응답 데이터 받기
function sendRequest(url, params, callback, method){
	/*
	   $.ajax({
		   type => method
	       url  => url
	       data => params
	       success:function(response){}
	       error:function(e)
	       complete:function()
	   })
	*/
	// 1. 객체 생성
	httpRequest=getXMLHttpRequest()
	// 2. method 방식 설정
	// <form action=""> => GET
	let httpMethod = method?method:'GET'
	if(httpMethod != 'GET' && httpMethod != 'POST'){
		httpMethod = 'GET'
	}		
	// 3. params => ?id=admin
	let httpParams = (params == null || params == "")?null:params
	// 4. url 처리
	let httpUrl = url
	// 전송 데이터가 있는 경우
	if(httpMethod == 'GET' && httpParams != null){
		httpUrl = httpUrl + "?" + httpParams
	}
	// 5. 서버 연결
	httpRequest.open(httpMethod, httpUrl, true)
	// true (비동기) / false (동기)
	// 한글 처리
	httpRequest.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded')
	// 자동 호출 함수 지정
	httpRequest.onreadystatechange = callback
	// success
	// 데이터 전송
	httpRequest.send(httpMethod == 'POST' ? httpParams:null)
	// 응답 => responseText / responseXML(JSON)
	// JSP => 70% / ajax => 30%
}
function send(){
	sendRequest('sub.jsp', null, ok, 'POST')
}
function ok(){ // success:function
	/*
	    readyState => 0~4
	     => open : 서버 연결
	     => send : 요청 데이터 전송
	     0 서버 연결 준비
	     1 서버 연결 => open
	     2 서버 연결 완료
	     3 데이터 전송 준비
	     4 데이터 전송 완료
	*/
	if(httpRequest.readyState == 4){
		/*
		    status
		      200 정상수행
		      500
		      404
		      403
		      ...
		      => success
		         error
		*/
		if(httpRequest.status == 200){
			let div = document.querySelector("div")
			div.innerHTML = httpRequest.responseText
			// $('div').html()
		}
	}
}
</script>
</head>
<body>
   <input type="button" value="클릭" onclick="send()">
   <div></div>
</body>
</html>