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
</head>
<body>
  <div class="container">
   <div class="row">
    <h1 class="text-center">글쓰기</h1>
    <form method="post" action="../board/insert_ok.do">
    <table class="table">
     <tr>
      <th width=15% class="text-center">이름</th>
      <td width=85%>
       <input type=text name=name size=20 class="input-sm" required>
      </td>
     </tr>
     <tr>
      <th width=15% class="text-center">제목</th>
      <td width=85%>
       <input type=text name=subject size=50 class="input-sm" required>
      </td>
     </tr>
     <tr>
      <th width=15% class="text-center">내용</th>
      <td width=85%>
       <textarea rows="10" cols="50" name=content required></textarea>
      </td>
     </tr>
     <tr>
      <th width=15% class="text-center" required>비밀번호</th>
      <td width=85%>
       <input type=password name=pwd size=10 class="input-sm">
      </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center">
         <input type=submit value="글쓰기"
           class="btn-warning btn-sm">
         <input type=submit value="취소"
           class="btn-warning btn-sm"
           onclick="javascript:history.back()"  
         >
       </td>
     </tr>
    </table>
    </form>
   </div>
  </div>
</body>
</html>