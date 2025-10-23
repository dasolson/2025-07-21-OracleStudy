<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       객체 모델
        = 태그를 제어 => 태그를 찾는 방법
          HTML은 캐그를 클래스로 인식 / 속성을 멤버변수로 인식 
        1. 태그 id 속성이 있는 경우
            document.getElementById("id명") => $('#id명')
             <button id="btn">
        2. 태그 class 속성이 있는 경우
            document.getElementByClassName("class명") => $('.class명')
             <button class="btns">
        3. 태그 name 속성이 있는 경우
            document.getElementByName("name명")
             <input type=text name="id">
        4. 태그명
             document.getElementByTagName("Tag명")
        5. CSS 선택자를 이용하는 방법 
             document.querySelector("CSS 선택자")
                     => id    : #
                     => class : .
                     => 태그 > 태그
                     => 태그 태그 ...
          => DOMScript => Vue / React / Jquery
             --- 태그를 제어하는 프로그램
                 태그를 찾는 방법 => CSS 선택자  
                 
        문서 객체 조작 (345page)
          1. 글자 조작
              = innerHTML => HTML 적용 => html()
              = textContent => 순수하게 문자열 => text()
          2. 스타일 조작
              = 태그.style.속성=값 => css()
          3. 속성 조작                    
              = img.src="" => attr("src"."") 
--%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
   margin: 0px auto;
   width: 350px;
}
h1 {
   text-align: center;
}
</style>
<script type="text/javascript">
function gesan(){
	let kor=document.getElementById("kor");
	if(kor.value === ""){
		kor.focus()
		return
	}
	let eng=document.getElementById("eng");
	if(eng.value === ""){
		eng.focus()
		return
	}
	let math=document.getElementById("math");
	if(math.value === ""){
		math.focus()
		return
	}
	
	let total=Number(kor.value)+parseInt(eng.value)+parseInt(math.value);
	document.getElementById("total").value=total;
	
	let avg=total/3
	document.getElementById("avg").value=Math.round(avg,2)
	
	let score='A'
	if(avg >= 90)
		score='A'
	else if(avg >= 80)
		score='B'
    else if(avg >= 70)
		score='C'
	else if(avg >= 60)
		score='D'
	else 
		score='F'
	document.getElementById("score").value=score	
}
window.onload=()=>{
	// 태그 읽기
	let h2=document.querySelector("h2")
	// <h2 id="" class="" style="">
	// style 변경 
	h2.style.background='red'
	// 값 변경
	h2.innerHTML="Hello JS"
	
	// h2 전체 읽기
	let h2s=document.querySelectorAll('h2')
	// h2s => 배열
	for(let i of h2s){
		i.style.background='green'
		i.innerHTML="Hello JavaScript"
	}
	
	let h3=document.querySelector("h3")
	h3.textContent="아이디를 입력하세요"
	
	let img=document.querySelectorAll("img")
	for(let im of img){
		im.width=120
		im.height=200
	}
	
	let acc=document.querySelector("#account")
	acc.onchange=function(){
		let val=acc.value
		let price=document.querySelector("#price")
		let total=Number(val)*Number(price.textContent)
		document.querySelector("#sum").innerHTML='<font color=red>'+total+'원</font>'
	}
}
</script>
</head>
<body>
   <div class="conyainer">
      <div class="row">
         <h1>성적 계산</h1>
         <table class="table">
            <tr>
              <th width="35%" class="text-center">국어</th>
              <td width="65%">
                 <input type="text" class="input-sm" id="kor" size="15">
              </td> 
            </tr>
            <tr>
              <th width="35%" class="text-center">영어</th>
              <td width="65%">
                 <input type="text" class="input-sm" id="eng" size="15">
              </td> 
            </tr>
            <tr>
              <th width="35%" class="text-center">수학</th>
              <td width="65%">
                 <input type="text" class="input-sm" id="math" size="15">
              </td> 
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <input type="button" id="btn" onclick="gesan()" class="btn-sm btn-danger" value="계산">
               </td>
            </tr>
         </table>
         <h1>처리 결과</h1>
         <table class="table">
            <tr>
              <th width="35%" class="text-center">총점</th>
              <td width="65%">
                 <input type="text" class="input-sm" id="total" size="15" readonly>
              </td> 
            </tr>
            <tr>
              <th width="35%" class="text-center">평균</th>
              <td width="65%">
                 <input type="text" class="input-sm" id="avg" size="15" readonly>
              </td> 
            </tr>
            <tr>
              <th width="35%" class="text-center">학점</th>
              <td width="65%">
                 <input type="text" class="input-sm" id="score" size="15" readonly>
              </td> 
            </tr>
         </table>
      </div>
      <div style="height: 20px"></div>
      <div class="row">
         <h2>Hello DOM-1</h2>
         <h2>Hello DOM-2</h2>
         <h2>Hello DOM-3</h2>
         <h2>Hello DOM-4</h2>
         <h2>Hello DOM-5</h2>         
      </div>
      <div style="height: 20px">
         <h1>글자 조작</h1>
         <h3></h3>
         <img src="../main/mm1.jpg" width="200" height="300">
         <img src="../main/mm2.jpg" width="200" height="300">
         <img src="../main/mm3.jpg" width="200" height="300">
         <div style="height: 20px"></div>
         <div class="row">
            <h1>select 태그 이용</h1>
            <table class="table">
               <tr>
                  <td>
                     수량 : <select id="account">
                        <option value="1">1개</option>
                        <option value="2">2개</option>
                        <option value="3">3개</option>
                        <option value="4">4개</option>
                        <option value="5">5개</option>
                     </select>
                  </td>
               </tr>
               <tr>
                  <td>
                    가격 : <span id="price">3000</span>
                  </td>
               </tr>
               <tr>
                  <td>
                    총금액 : <span id="sum"></span> 
                  </td>
               </tr>
            </table>
         </div>
      </div>
   </div>
</body>
</html>