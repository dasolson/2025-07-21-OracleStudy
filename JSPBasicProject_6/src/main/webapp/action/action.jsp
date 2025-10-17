<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      JSP 액션 태그
        => 데이터 관리
           -------- setter / getter
           <jsp:setProperty>
           <jsp:getProperty>
           bean (자바빈)
            => 데이터를 모아서 한번에 전송 / 관리
            => BoardBean
                   |
                BoardDTO
                   |
                BoardVO
                : 캡슐화 => 데이터 보호
                   => 데이터를 감춘다 (은닉화)   => private
                   => 메소드를 통해서 외부와 연결 => public
                   => getter / setter
                      private int age;
                      public int getAge(){}
                      
                      public void setAge(int age){}
                      private boolean dash;
                      => public void setDash(boolean dash){} => x
                      => public void isDash(boolean dash){}  => o               
        => 메모리 할당
           <jsp:useBean>
        => 화면 이동
           <jsp:forward>
        => 화면 포함
           <jsp:include>
        => 데이터 전송
           <jsp:param>
      -----------
       prefix => jsp : <jsp:태그명> 
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
         <h1>회원 정보</h1>
         <form method="post" action="action_ok.jsp">
         <table class="table">
            <tr>
               <td width="20%">이름</td>
               <td width="80%">
                  <input type="text" name=name size="15" class="input-sm">
               </td>
            </tr>
            <tr>
               <td width="20%">성별</td>
               <td width="80%">
                  <input type="radio" value="남자" name=sex checked>남자
                  <input type="radio" value="남자" name=sex >여자 
               </td>
            </tr>
            <tr>
               <td width="20%">주소</td>
               <td width="80%">
                  <input style="text" name=address size="30" class="input-sm">
               </td>
            </tr>
            <tr>
               <td width="20%">전화</td>
               <td width="80%">
                  <input type="text" name=phone size="20" class="input-sm">
               </td>
            </tr>
            <tr>
               <td width="20%">관리자</td>
               <td width="80%">
                  <input type="radio" name=admin value="true">관리자
                  <input type="radio" name=admin value="false">사용자
               </td>
            </tr>
            <tr>
               <td colspan="2" class="text-center">
                  <button class="btn-sm btn-danger">전송</button>
               </td>
            </tr>
         </table>
         </form>
      </div>
   </div>
</body>
</html>