<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      325page : 함수
                 => 명령문의 집합 , 구조화 프로그램
                 => 함수 / 메소드
                    ---------- 차이점 : 독립적 / 클래스 종속
                 => 목적 : 기능 처리 (요청 처리) / 반복 제거 / 재사용 / 단락 나누기(구조화)
                 => 자바스크립트 단점 : Function을 데이터형으로 인식
                 => let a = function(){}
                 => 장점 : 매개변수로 사용 가능 function(a) 
      함수 제작 
        = 선언적 함수
            function 함수명(){
            
            }
        = 익명의 함수 : 함수 안에 함수를 사용 할 수 있다 / 매개변수로 사용 가능
            let 변수명 = function(){}
            let 변수명 =()=>{}    
                     
      함수의 구성요소 
        = 선언부 : 함수명 / 매개변수 => 특징 : 리턴형을 서술하지 않는다
                                        --- 리턴은 가능
             function 함수명(변수명만 설정) => (let a, let b) X
                                       => (a, b) O
             {
                ...
                ...
                return 값
             }                           
        = 구현부     
          {
              변수선언(지역변수)
              연산처리
              제어문
          }
          
      함수의 종류  
           리턴형          매개변수
        --------------------------------   
             o             o
             function login(id,pwd) {
                return 결과값
             }
        --------------------------------             
             o             x
             function func_name() {
                return 결과값
             }
        -------------------------------             
             x             o
             function func_name(a, b) {
             
             }
        -------------------------------             
             x             x
             function func_name() {
             
             }   
        -------------------------------             
      
      익명의 함수 => 변수 선언 = function을 데이터형으로 취급
               => 매개변수 지정
        let a = function(a, b) {}
        let a = (a, b)=>{}     
        
        변경
         function add(x, y) {
             return x+y
         }           
         ====> 호출 add(10,20)
         => 익명의 함수
         let add = function(x, y){
             return x+y
         }           
         ====> 호출 add(10, 20)
         let add = (x, y)=>x+y
         ====> 호출 add(10, 20) 
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// main => 자동 호출
/* window.onload = function(){
	let func = function(){}
	document.write("func :" +typeof func)
} */
function plus(a,b){
	return a+b
}
let plus2 = function(a,b){
	return a+b
}
let plus3=(a,b)=>{
	return a+b
}
let plus4 =(a,b)=>a+b
window.onload=()=>{
	let a = 10;
	let b = 20;
	
	let c = plus(a,b);
	let d = plus2(a,b);
	let e = plus3(a,b);
	let f = plus4(a,b);
	
	document.write('c=' +c+ "," +typeof plus+ "<br>")
	document.write('d=' +d+ "," +typeof plus2+ "<br>")
	document.write('e=' +e+ "," +typeof plus3+ "<br>")
	document.write('f=' +f+ "," +typeof plus4+ "<br>")
	
	func(callback)
}
// 매개변수로 함수를 전달하는 방식 => callback : 329page
// setTimer(callback) / setInterval(callback)
// redux / react-query (tanStack-query) => open source 그룹
// Jquery
// $('CSS:태그').click(function(){처리내용})
// => 회원가입 => 완료 이미지 => main 이동
// 실시간 데이터 갱신
let callback = function(){
	document.write("함수 호출<br>")
}
// map(function()=>{}) => 이벤트
function func(call){
	for(let i = 1; i <= 10; i++){
		call()
	}
}
</script>
</head>
<body>

</body>
</html>