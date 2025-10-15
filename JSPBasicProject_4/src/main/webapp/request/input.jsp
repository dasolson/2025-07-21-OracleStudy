<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container {
   margin-top: 50px;
}
.row {
   width: 350px;
   margin: 0px auto;
}
h1 {
   text-align: center;
}
</style>
</head>
<body>
   <div class="container">
      <div class="row">
         <h1>개인 정보</h1>
         <form method="post" action="output.jsp">
         <table class="table">
            <tr>
               <td>이름</td>
               <td><input type=text name=name size=20 class="input-sm"></td>
            </tr>
            <tr>
               <td>성별</td>
               <td>
                  <input type="radio" name=sex value=남자 checked>남자
                  <input type="radio" name=sex value=여자>여자
               </td>
            </tr>
            <tr>
               <td>지역</td>
               <td>
                  <select name="loc" class="input-sm">
                     <option>경기</option>
                     <option>인천</option>
                     <option>강원</option>
                     <option selected>서울</option>
                     <option>제주</option>
                  </select>
               </td>
            </tr>
            <tr>
               <td>소개</td>
               <td>
                  <textarea rows="3" cols="30" name="content"></textarea>
               </td>
            </tr>
            <tr>
               <td>취미</td>
               <td>
                  <input type="checkbox" name="hobby" value="운동">운동
                  <input type="checkbox" name="hobby" value="낚시">낚시
                  <input type="checkbox" name="hobby" value="등산">등산
                  <input type="checkbox" name="hobby" value="게임">게임
                  <input type="checkbox" name="hobby" value="여행">여행
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <button class="btn-sm btn-info">전송</button>
               </td>
            </tr>
         </table>
         </form>
      </div>
   </div>
</body>
</html>