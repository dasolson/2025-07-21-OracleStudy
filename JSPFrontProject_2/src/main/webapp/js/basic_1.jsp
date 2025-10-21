<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
       자바스크립트 제어문
        1. 조건문 : 유효성 검사 / 상세보기
            = 단일 조건문
                if(조건문) { => 비교연산자 / 논리연산자 / 부정연산자
                              -------- === / !== : 데이터형 비교 (권장)
                                         if("1" === 1) => false
                                       == / !=   : 데이터형 무시
                                         if("1" == 1) => true
                    조건 true일 때 처리
                }
            = 선택 조건문
                if(조건문) {
                    조건이 true일 때 처리
                } else {
                    조건이 false일 때 처리
                }
        2. 반복문 : for / for-each / map() / forEach()
        3. 반복 제어문 : break / continue
        
       자바스크립트 함수
        = 선언적 함수 / 익명의 함수
       
       태그를 제어하는 기능 : DOM
       
       이벤트 처리
       
       라이브러리 처리 : 내장 함수 
        라이브러리화 : JQuery / VueJS
        
        
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
   margin: 50px;
}
.row {
   width: 500px;
   margin: 0px auto;
}
</style>
<script type="text/javascript">
/*
 *              window
                   |
           -----------------
           |       |       |
       document location history
           |
         form  
 */
function login(){
	let frm = document.frm
	if(frm.id.value === ""){
		alert("ID를 입력하세요")
		frm.id.focus()
		return
	}
	if(frm.pwd.value === ""){
		alert("비밀번호를 입혁하세요")
		frm.pwd.focus()
		return
	}
	
	alert("ID :" +frm.id.value+ "\n" +"Password :" +frm.pwd.value)
}
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <form name="frm">
            <table class="table">
               <tr>
                  <td width="20%">ID</td>
                  <td width="80%">
                     <input type="text" name="id" size="20" class="input-sm">
                  </td>                     
               </tr>
               <tr>
                  <td width="20%">PW</td>
                  <td width="80%">
                     <input type="password" name="pwd" size="20" class="input-sm">
                  </td>                     
               </tr>
               <tr>
                  <td colspan="2" class="text-center">
                     <input type="button" value="로그인" class="btn-sm btn-primary" onclick="login()">
                  </td>
               </tr>
            </table>
         </form>
      </div>
   </div>
</body>
</html>