<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       1. Jquery => ajax
           1) 라이브러리 다운로드 / 원력
               <script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
              ** 라이브러리가 충돌되면 오류 발생 (실행이 안된다)
              ** <jsp:include> : $가 정의 되어 있지 않다 
              ** main.jsp에 추가 
           2) jquery 시작 => 자바스크립트 메인 => windoe.onload=function
                $(function(){})
                $(document.ready(function(){})
                  -------------- 생략이 가능
           3) jquery의 함수 : $ : 태그를 찾아서 읽기
                == document.querySelector()   
                == $('#a')  <h1 id="a">
                == $('.a')  <h1 class="a">
                == $('h1')  <h1>
                   ------- CSS 선택자를 이용한 태그 읽기
                           --------
                            CSS 디자인 / 자바스크립트에서 태그 제어 / 크롤링
                == 태그 > 태그, 태그 태그
                   태그[속성=값]
           4) 태그 제어 프로그램
               4-1) 데이터 변경
                     = <태그>( )</태그>
                             | => text(), text(값)
                                  getter   setter
                                  html(), html(값)
                                  일회성
               4-2) 속성 변경
                     = <input> <textarea> <select>
                       ---------------------------
                          val() => 입력 된 데이터 읽기
                          val(값)
                     = <태그 속성=값>
                            ----- 
                             => attr("속성")
                                attr("속성", 값)
                                <img src="">
                                     ------
                                <a href="">
                                   -------
                                <a class="">
                                   --------
                                태그 안에 속성은 사용자 정의 사용이 가능
                                필요한 데이터를 속성을 이용해서 저장           
               4-3) 태그 추가
                     = 다중성 : append() : appendChild()
                              --------
               4-4) 이벤트 발생 : 유효성 검사 / 읽기 / 쓰기          
                     $().on('이벤트 종류',function(){처리})
                     $().이벤트 종류(function(){처리})
                         --------
                          click / hover
                          keyup / keydown
                          mousedown / mouseup
                          change
            5) CSS 적용
                 $(태그).css("속성","값")
                 $(태그).css({"속성":값, "속성":값..})
                   => 속성 : - => 대문자로 변환
                        margin-top => marginTop
            6) 모든 Front 개발자는 동일하게 코딩 : 표준화
               단점 : 라이브러리를 많이 추가 => 무겁다
                             ---------------- 서버 속도가 느려진다
                      => Vue / React 
            7) Ajax 
                서버 연결 = 결과 요청 = 응답
                형식) 
                     $.ajax({
                        type: get.post,
                        url : .jsp / .do,
                        data: {키:값,...} ==> ?,
                        -------------------------- 요청
                        -------------------------- 응답
                                         | => 일반 값, JSON
                        success:function( ){
                            정상 수행
                        },
                        error:function(){
                            오류 발생
                        }
                     })                                                     
                                            
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let no = 1;
$(function(){
	$('button').click(function(){
		//$('div').append("Hello Jquery" + no)
		$('div').text("Hello Jquery" + no)
		no++
	})
})
</script>
</head>
<body>
   <button>클릭</button>
   <div></div>
</body>
</html>