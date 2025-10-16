<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.container{
  margin-top: 50px;
}
.row{
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
      <h1>이미지 업로드</h1>
      <form action="../FileUploadServlet"
       method="post"
       enctype="multipart/form-data"
      >
      <table class="table">
       <tr>
        <td>
         첨부파일:<input type=file name=upload size=20>
        </td>
       </tr>
       <tr>
        <td>
         <button class="btn-sm btn-success">업로드</button>
        </td>
       </tr>
      </table>
      </form>
    </div>
  </div>
</body>
</html>