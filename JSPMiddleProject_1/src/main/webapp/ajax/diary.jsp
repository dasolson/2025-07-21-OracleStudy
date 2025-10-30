<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.row {
   margin: 0px auto;
   width: 600px;
}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript">
$(function(){
	$('#y').change(function(){
		let year = $('#y').val()
		let month = $('#m').val()
		$.ajax({
			type:'post',
		    url:'../ajax/diary.do',
		    data:{"year":year,"month":month},
		    success:function(result){
		    	$('body').html(result)
		    }
		})
	})
	$('#m').change(function(){
		let year = $('#y').val()
		let month = $('#m').val()
		$.ajax({
			type:'post',
		    url:'../ajax/diary.do',
		    data:{"year":year,"month":month},
		    success:function(result){
		    	$('body').html(result)
		    }
		})
	})
})
</script>
</head>
<body>
   <div class="container">
      <div class="row">
         <h2 class="text-center">${year }년도 ${month }월</h2>
         <table class="table">
            <tr>
               <td>
                  <select id="y" class="input-sm">
                     <c:forEach var="i" begin="2025" end="2030">
                        <option ${i == year?"selected":"" }>${i }</option>
                     </c:forEach>
                  </select>년도
                  <select id="m" class="input-sm">
                     <c:forEach var="i" begin="1" end="12">
                        <option ${i == month?"selected":"" }>${i }</option>
                     </c:forEach>
                  </select>월
               </td>
            </tr>
         </table>         
         <table class="table" style="margin-top: 30px">
            <tr class="danger" height="55">
               <c:forEach var="w" items="${strWeek }">
                  <th class="text-center" valign="middle">${w }</th>
               </c:forEach>
            </tr> 
            <c:set var="week" value="${week }"/>
            <c:forEach var="i" begin="1" end="${lastday }">
               <c:if test="${i == 1 }">
                  <tr height="55">
                     <c:forEach var="j" begin="1" end="${week }">
                        <td class="text-center" valign="middle">&nbsp;</td>
                     </c:forEach>                  
               </c:if>
                  <td class="text-center ${i == day?'success':'' }" valign="middle">${i }</td>
               <c:set var="week" value="${week+1 }"/>
               <c:if test="${week > 6 }">
                  <c:set var="week" value="0"/>
                  </tr>
                  <tr height="55">
               </c:if>   
            </c:forEach>   
            </tr>        
         </table>
      </div>
   </div>
</body>
</html>