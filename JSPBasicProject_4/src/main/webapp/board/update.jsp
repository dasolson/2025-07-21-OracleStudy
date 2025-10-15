<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.sist.vo.*, com.sist.dao.*"%>
<%
    // 사용자 요청
    String no = request.getParameter("no");
    // 요청 처리 => 결과값 전송
    BoardVO vo = BoardDAO.boardUpdateData(Integer.parseInt(no));
%>    
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
   width: 800px;
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
         <h1>수정하기</h1>
         <form method="post" action="update_ok.jsp">
         <table class="table">
            <tr>
               <th width="15%">이름</th>
               <td width="85%">
                  <input type="text" name="name" size="20" class="input-sm" required value="<%=vo.getName()%>">
               </td>
            </tr>
            <tr>
               <th width="15%">제목</th>
               <td width="85%">
                  <input type="text" name="subject" size="60" class="input-sm"  required value="<%=vo.getSubject()%>">
               </td>
            </tr>
            <tr>
               <th width="15%">내용</th>
               <td width="85%">
                  <textarea rows="10" clos="60" name="content"  required><%=vo.getContent() %></textarea>
               </td>
            </tr>
            <tr>
               <th width="15%">비밀번호</th>
               <td width="85%">
                  <input type="password" name="pwd" size="10" class="input-sm"  required>
               </td>
            </tr>
            <tr>
               <td class="text-center" colspan="2">
                  <input type="submit" value="수정" class="btn btn-sm btn-info">
                  <input type="submit" value="취소" class="btn btn-sm btn-info" onclick="javascript:history.back()">
               </td>
            </tr>
         </table>
         </form>
      </div>
   </div>
</body>
</html>