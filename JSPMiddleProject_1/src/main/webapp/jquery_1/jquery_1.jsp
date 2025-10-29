<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
        자바스크립트
         => 내장 함수
             1) 문자열 
                 substring(start)
                 substring(start, end) => end-1 : 문자열 인덱스 0번부터 시작
                 indexOf() : 문자의 인덱스 번호 찾기
                 trim()    : 공백 제거
                 length()  : 문자 길이
                 split()   : [], 구분자별로 문자 분리
                 ------------------------------- 자바 String과 동일
                 slice()   : 특정 위치에서 문자열 자르기
                 객체 생성
                  let 변수명=new String("저장 할 문자열")
                  let 변수명='', ""
                  => Ajax / Vue / React
                  *** toLocalString()
             2) 숫자
                 형변환 : HTML 태그에서 값을 읽는 경우 => 문자열로 들어온다
                          => Number("10")
                             parseInt("10")
                          => NodeJS (서버측 사이드)
                 NaN / Infinity
                          | 0으로 나눈 경우
                  | Not a Number            
             3) 날짜 
                 getFullYear() yyyy
                 getMonth()    10
                 getDate()     29
                 getDay()      요일(0:일, 6:토)
                 
                 => 오늘 날짜를 가지고 와서 자신의 자동차가 휴무인지 체크
                     
             4) 배열
                 pop()  : 마지막 삭제
                 push() : 마지막에 추가
                 sort() : 
                 slice(start, end) : 특정 위치로 배열 새롭게 생성
                 map / foEach : 배열 출력 => 반복문
         => 브라우저 객체
             window : 브라우저 창 => open, close
                |
         -----------------------------------------
         |         |         |         |         |
      document  history    screen    event    location
                                              -------- href
                ------- back(), forward(), reload()
      -------- write, 태그 querySelector()
      
      $(CSS선택자) => document.querySelector(CSS선택자)
      
      <a href="" id="a"> => $('#a')
      <img src="" class="i"> => $('.i')
      <div> => $('div')
      
      <div>
        <span></span> ==> $('div > span')
        <h1></h1> ==>$('div > span+h1')
        <h1></h1> ==>$('div > span~h1') 
        <div>
           <span></span> ==> $('div div span')
        </div>
      </div>  
      
      <input type=text>   ==> $('input[type="text"]')
      <input type=button> ==> $('input[type="button"]')
      
      Jquery => 태그의 속성 변경 / 값 / 태그를 추가
             => 이벤트, 애니메이션 사용
             => 태그 관련 프로그램 => DOM
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
window.onload=function(){
	//let won = 100000
	//document.write(won.toLocaleString()+"원")
	
	/* let now = new Date()
	document.write("현재 : "+now.toLocaleString()+"<br>")
	document.write("년도 : "+now.getFullYear()+"<br>")
	document.write("월 : "+(now.getMonth()+1)+"<br>")
	document.write("일 : "+now.getDate()+"<br>")
	document.write("요일 : "+now.['일','월','화','수','목','금','토'][now.getDay()]+"<br>")
	
	let a = new Date()
	a.setDate(a.getDate()+3)
	document.write(a.toLocaleString()+"<br>") */
	
	let info = {name:"홍길동", sex:"남자", age:20}
	let data = JSON.stringify(info)
	console.log(data)
	let change = JSON.parse(data)
	console.log(change)
}
</script>
</head>
<body>

</body>
</html>