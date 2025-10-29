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
 *   태그에서 이벤트 
     ------------
     모든 태그 : click
     <select> : onchange 
     input : keyup / keydown 
     img : hover , mousedown , mouseup
     tr / td => click
     -----------------------------------
     $('select').change(function(){여기서 처리})
     $('button').click(function(){여기서 처리})
     $('input').keyup(function(){여기서 처리})
     
     $('button').on("click",function(){여기서 처리})
     
 */
let fileIndex=0
$(function(){
	$('#addBtn').click(function(){
		$('.user-table tbody').append(
		  '<tr id="m'+fileIndex+'">'
		 +'<td>File '+(fileIndex+1)+'</td>'
		 +'<td><input type=file size=20></td>'
		 +'</tr>'
		)
		fileIndex++;
	})
	$('#removeBtn').on('click',function(){
		if(fileIndex>0)
		{
		   $('#m'+(fileIndex-1)).remove()
		   fileIndex--;
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
  width: 600px;
}
</style>
</head>
<body>
    <div class="container">
     <h1 class="text-center">append</h1>
     <div class="row">
      <table class="table">
        <tr>
         <td class="text-center">
          <input type=button class="btn-sm btn-danger"
            value="Add" id="addBtn">
          <input type=button class="btn-sm btn-danger"
            value="Remove" id="removeBtn">
         </td>
        </tr>
      </table>
      <table class="table user-table">
       <tbody>
         
       </tbody>
      </table>
     </div>
    </div>
</body>
</html>