<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JavaScript
          | JQuery : Ajax
          | VueJS : vuex / pinia / nustjs
          | ReactJS : redux / tanStack-Query / nextjs
      자바스크립트
        1. 정의 : 웹 브라우저에서 동작하는 스크립트 언어
                                   ------ 단순한 언어
        2. 용도 : 동적 웹페이지 제작 시, 서버 개발 (NodeJS), 
                 앱 개발 (React Native)
        3. 실행 환경 : 브라우저
        4. 특징 : 인터프리터 언어, 객체 기반, 이벤트 중심
        
       1. 기본 문법
           = 변수 : 1개의 데이터를 저장하는 메모리 공간
                   데이터형이 없다 : 저장되는 데이터를 통해서 자동 인식
                   - var : a = 10 => a:int
                   - var : b =10.5 => a:double
                                      --------- number
                   - var : c = 'Hello' => c:string
                   - var : d = "Hello"  => d:string
                   - var : e = {"name":"홍길동", sex:"남자", age:20}
                            => e:object => 객체 (JSON)
                               javaScript Object Notation
                               => 자바스크립트 객체 표현법
                               => 전송 (자바 === 자바스크립트)
                                        |         |
                                        -----------
                                             | 연결시 사용 => JSON
                   - var : f = ["","",""] => f:array
                   ==============================================> 재선언 가능 (스코프가 명확하지 않다)
                                                                             ---- 변수 사용 범위가 명확하지 않다
                   ===> var : ES5버전
                   - let : ES6버전 => 재사용 불가
                           블록을 벗어나면 자동으로 메모리 해제
                           사용법은 동일 => 지역 변수                          
                   - const : 상수형 변수 (final)
                   
                   ** 단점 
                       let a = 10;
                       a = "Hello";
                       a = []
                       a = {}
                       ------------- 가독성이 떨어진다
                       => 데이터형을 고정 
                       let a:string = "10" => TypeScript
                   => 자료형 (데이터형)
                       = 기본형 : number, string, boolean
                                null, undifined, bigint
                       = 참조형 : object, array, function
                           ** function도 데이터형의 일종
                              --------
                               | 매개변수로 사용 가능 => Callback
                               | 시스템에 의해 자동으로 호출되는 함수
                   => 형변환
                       = 숫자변환 : Number("10") => 10
                                  parseInt("10") => 10
                                  String(10) => 10
                                  Boolean(0) => false
                                     0, 0.0
                                  Boolean(1) => true
           ------------------------------------------------------------
                            
                            | 호환 => VO, List
                            |       {  }  [ ]
                            |       JSON  Array
                -------------------------
                |                       |
            자바스크립트 ================= 자바 =================== 오라클
                |                                                |
                --------------------------------------------------
                                        | 연결이 안된다
                = 사용법
                   - 외부 자바스크립트  : 여러개의 파일에서 공통으로 사용
                         => 자바스크립트 파일 생성 (.js)
                            = .js .jsx .ts .tsx 
                         <script type="text/javascript" src="파일명">   
                   - 내부 자바스크립트  : 1개의 파일에서 사용
                         <head
                            <script>
                               => 설정
                            </script>
                         </head>
                   - 인라인 자바스크립트 : 1개의 태그 안에서 사용   
                         <input type="button" onclick="javascript:history.back()">                                                           
           = 연산자
           = 제어문
           = 함수 
           = 객체 지향 
           = DOM => 태그를 제어하는 프로그램
           = 이벤트 처리 방법
           = 라이브러리 => JQuery 
                                                   
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
// 한줄 수석
/*
 * 여러줄 주석
 */
 // 변수 선언 => main 함수 => 자동 호출 함수
 // fuction aaa() => 반드시 호출 후 사용
 // jquery : $(function(){})
 // vuejs : mounted()
 // react : effect()
 window.onload=function(){
	/*
	   변수 선언 => var / let(권장) / const
	   => 식별자 
	        = 알파벳으로 시작(대소문자 구분)
	        = 숫자 사용 가능 (앞에 사용 금지)
	        = 공백 불가
	        = 문자 길이 상관 없다
	        = 키워드 사용 불가
	        = 특수문자 사용 가능 (_ , $)
	*/
	let a=10;
	// ;은 사용할 수도 , 사용 하지 않을 수도 있다 
	let b=10.5;
	/*
	   출력 방식
	     console.log() : console에 출력 => 개발자 도구
	     docment.write() : 브라우저에 출력
	     alert() : 팝업창에 출력
	     innerHTML : HTML안에 HTML을 첨부
	*/
	// 1. 변수의 데이터형 확인 typeof
	console.log("a="+typeof a);
	console.log("b="+typeof b);   // number
	let c="Hello"
	let d='Hello'
	console.log("c="+typeof c);
	console.log("d="+typeof d);  //String
	let e=true
	let f; //undifined
	console.log("e="+typeof e);
	console.log("f="+typeof f);
	let i=["홍길동","심청이","강감찬"]; // Array
	console.log("i="+typeof i);
	let j={"name":"홍길동", age:20}; // object
	console.log("j="+typeof j);
	let k = function(){} // function
	console.log("k="+typeof k);
	
	let m="Hello JavaScript";
	m="JavaScript ES6";
	
	console.log("m="+m);
	const n="Hello";	
	// 상수형 => 값을 변경 할 수 없다
	n="JavaScript";
	console.log("n="+n);
	
	// 단점 => 데이터형 변경이 가능 => 가독성이 떨어진다
	let o=10
	o="Hello"
	o={"name":"심청이", age:20}
	o=["홍길동","심청이","강감찬"]
	o=function(){}
	o=true 
	
}
</script>
</head>
<body>

</body>
</html>