<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.row {
  margin: 0px auto;
  width: 700px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#sendBtn').click(function(){
		let name=$('#name').val()
		if(name.trim()==="")
		{
			$('#name').focus()
			return
		}
		
		let subject=$('#subject').val()
		if(subject.trim()==="")
		{
			$('#subject').focus()
			return
		}
		
		let content=$('#content').val()
		if(content.trim()==="")
		{
			$('#content').focus()
			return
		}
		
		let pwd=$('#pwd').val()
		if(pwd.trim()==="")
		{
			$('#pwd').focus()
			return
		}
		
		let no = $('#no').val()
		
		$.ajax({
			type:"post",
		    url:'../board/update_ok.do',
		    data:$('#frm').serialize(),
		    success:function(result){
		    	if(result === 'yes'){
		    		location.href="../board/detail.do?no="+no
		    	}else{
		    		alert("비밀번호가 다릅니다")
		    		$('#pwd').val("")
		    		$('#pwd').focus()
		    	}
		    },
		    error:function(error){
		    	console.log(error.responseText)
		    }
		})
		//let a = $('#frm').serialize()
		//console.log(a)
	})
})
</script>
</head>
<body>
  <div class="container">
   <div class="row">
    <h1 class="text-center">수정하기</h1>
    <form id="frm">
    <!-- <form method="post" action="../board/update_ok.do"> -->
    <table class="table">
     <tr>
      <th width="15%" class="text-center">이름</th>
      <td width="85%">
       <input type="text" name="name" id="name" size="20" class="input-sm" value="${vo.name }">
       <input type="hidden" name="no" id="no" value="${vo.no }">
      </td>
     </tr>
     <tr>
      <th width="15%" class="text-center">제목</th>
      <td width="85%">
       <input type="text" id="subject" name="subject" size="50" class="input-sm" value="${vo.subject }">
      </td>
     </tr>
     <tr>
      <th width="15%" class="text-center">내용</th>
      <td width="85%">
       <textarea rows="10" cols="50" id="content" name="content" >${vo.content }</textarea>
      </td>
     </tr>
     <tr>
      <th width="15%" class="text-center">비밀번호</th>
      <td width="85%">
       <input type="password" id="pwd" name="pwd" size="10" class="input-sm">
      </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type="button" value="수정"
           class="btn-warning btn-sm" id="sendBtn">
         <input type="submit" value="취소"
           class="btn-warning btn-sm"
           onclick="javascript:history.back()"  
         >
       </td>
     </tr>
     <%--
          id,class : 자바스크립트에서 제어 / CSS
          name : 자바로 데이터로 전송 = 구분자 
      --%>
    </table>
    </form>
    <!-- </form> -->
   </div>
  </div>
</body>
</html>