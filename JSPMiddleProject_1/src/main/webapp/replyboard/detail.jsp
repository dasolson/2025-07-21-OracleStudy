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
pre{
  white-space: pre-wrap;
  border: none;
  background-color: white;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
let bCheck=false
$(function(){
	// java=main / javascript=window.onload=function(){}
	// vue = mounted / react = effect 
	/*
	    1. click : button , span , td ...
	    2. hover : img / button 
	    3. change : select 
	    4. mousedown / mouseup 
	    5. keyup / keydown
	    
	    $ = document.querySelector(CSS선택자)
	        id => #
	        class => .
	        tag => tag명
	*/
	$('#delBtn').click(function(){
		if(bCheck===false) {
			$('#delBtn').text("취소")
			$('#del').show("slow")// display:''
			bCheck=true
		}else {
			$('#delBtn').text("삭제") 
			$('#del').hide("slow") // display:none
			bCheck=false
		}
	})
	
	$('#deleteBtn').on('click', function(){
		let pwd = $('#pwd').val()
	    if(pwd.trim() == ""){
	    	$('#pwd').focus()
	    	return
	    }
		let no = $('#deleteBtn').attr("data-no")
		
		$.ajax({
			type: 'post',
		    url: '../board/delete.do',
		    data: {"no":no, "pwd":pwd},
		    // 요청             | => 요청 결과값
		    success: function(result){
		    	// try
		    	if(result === 'yes'){
		    		// 이동
		    		location.href = "../board/list.do"
		    	}else{
		    		alert("비밀번호가 다릅니다")
		    		$('#pwd').val("")
		    		$('#pwd').focus()
		    	}
		    },
		    error:function(error){
		    	// catch
		    	console.log(error)
		    }
		})
	})
})
</script>
</head>
<body>
  <div class="container">
    <div class="row">
     <h1 class="text-center">내용보기</h1>
     <table class="table">
       <tr>
        <th width=20% class="text-center">번호</th>
        <td width=30% class="text-center">${vo.no}</td>
        <th width=20% class="text-center">작성일</th>
        <td width=30% class="text-center">${vo.dbday }</td>
       </tr>
       <tr>
        <th width=20% class="text-center">이름</th>
        <td width=30% class="text-center">${vo.name}</td>
        <th width=20% class="text-center">조회수</th>
        <td width=30% class="text-center">${vo.hit }</td>
       </tr>
       <tr>
        <th width=20% class="text-center">제목</th>
        <td colspan="3">${vo.subject}</td>
       </tr>
       <tr>
         <td colspan="4" class="text-left" valign="top"
          height="200"><pre>${vo.content}</pre></td>
       </tr>
       <tr>
         <%--
                 list(목록)   detail(상세)
                   |            |
                 insert       update / reply / delete
                                |       |        |
                               detail   list    list
          --%>
          <td colspan="4" class="text-right">
            <a href="../board/reply.do?no=${vo.no }" class="btn btn-xs btn-success">답변</a>
            <a href="../board/update.do?no=${vo.no }" class="btn btn-xs btn-warning">수정</a>
            <span class="btn btn-xs btn-info" id="delBtn">삭제</span>
            <a href="../board/list.do" class="btn btn-xs btn-primary">목록</a>
          </td>
       </tr>
       <tr id="del" style="display:none">
         <td colspan="4" class="text-right">
           비밀번호:<input type="password" name=pwd size=10 class="input-sm" id="pwd">                  
                  <input type=button class="btn-sm btn-danger" value="삭제" id="deleteBtn" data-no="${vo.no }">
         </td>
       </tr>
     </table>
    </div>
  </div>
</body>
</html>


