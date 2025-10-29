<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
/*
 *   val() : input / textarea / select
     text() : <h1> , <td> , <span> ...
              <h1>값추가</h1>
     attr() : 각태그의 속성값 읽기 
     html() : 태그와 태그사이의 => html문서를 저장 
     --------------------------------------- Ajax 
 */
$(function(){
	$('#btn').click(function(){
		let id=$('#id').val()
		if(id.trim()==="")
		{
			$('#la_id').text('<font color=red>아이디를 입력하세요</font>')
		}
		else
		{
			$('#la_id').html('')
		}
		let pw=$('#pwd').val()
		if(pw.trim()==="")
		{
			$('#la_pw').html('<font color=red>비밀번호를 입력하세요</font>')
		}
		else
		{
			$('#la_pw').html('')
		}
		
	})
})
</script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
  margin-top: 50px
}
.row {
  margin: 0px auto;
  width: 400px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="row">
     <h1 class="text-center">로그인</h1>
     <table class="table">
      <tr>
       <td width=30%>ID</td>
       <td width=70%>
         <input type=text id=id size=20 class="input-sm">
       </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center" id="la_id"></td>
      </tr>
      <tr>
       <td width=30%>PW</td>
       <td width=70%>
         <input type=password id=pwd size=20 class="input-sm">
       </td>
      </tr>
      <tr>
        <td colspan="2" class="text-center" id="la_pw"></td>
      </tr>
      <tr>
        <td colspan="2" class="text-center">
         <button id="btn" class="btn-sm btn-danger">로그인</button>
        </td>
      </tr>
     </table>
    </div>
  </div>
</body>
</html>