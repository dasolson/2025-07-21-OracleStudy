<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
    1. 라이브러리 로드 
       <script src="http://code.jquery.com/jquery.js"></script>
        => 라이브러리 충돌 (include) 
                       ---------- 모든 라이브러리는 main.jsp
    2. JQuery는 자바스크립트 라이브러리다 
       => 자바스크립트의 기본 문법 사항 
       => 변수 : let / const => 데이터베이스에서 값을 받는 경우
          if()
          {
            let a=10 : 자동 메모리 해제 
            var b=20 : 메모리 해제가 안된다 
          }
          
       => 데이터형 : number,string,date,boolean,null,undefined
             => 형변환 : Number("10"),parseInt("10")
                       String(10) , Boolean(1) = true 
                                    Boolean(0) = false  
       => 연산자 : + :문자열 결합 / 덧셈 
                 / : 정수/정수=실수 
                 비교연산자 => ===(데이터형), ==(데이터형 관계없이)
                            "10"===10     "10"==10
                              false          true 
                            => 문자열 / 날짜까지 비교가 가능 
       => 제어문 : if / if~else 
                  for => for in / for of
                        --------  -------
                        인덱스번호   실제 데이터  
                  forEach / map 
                  -------------- 인덱스 / 실제 데이터
       => 태그를 가지고 오기 
          : 객체 모델 
          : document.querySelector(let css)
            ----------------------    | CSS 선택자
               => jquery : $
               
          => 태그명 $("a") 
             ID   $('#id명')
             Class $('.class명')
             후손 $('div span')
             자손 $('div > span')
             속성 $('input[type="button"]')
          
 --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row {
  margin: 0px auto;
  width: 600px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
$(function(){
	$('#postBtn').click(function(){
		new daum.Postcode({
			oncomplete:function(data){
				$('#post').val(data.zonecode)
				$('#addr').val(data.address)
			}
		}).open()
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
      <h1 class="text-center">회원가입</h1>
      <form name="frm">
      <table class="table">
        <tr>
         <th width=20%>
          우편번호
         </th>
         <td width=80%>
           <input type=text size=10 id="post" readonly class="input-sm">
           <input type=button value="우편번호검색"
           id="postBtn" class="btn-sm btn-danger">
         </td>
        </tr>
        <tr>
          <th width=20%>주소</th>
          <td width=80%>
           <input type=text id=addr size=50 
             readonly class="input-sm">
          </td>
        </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>