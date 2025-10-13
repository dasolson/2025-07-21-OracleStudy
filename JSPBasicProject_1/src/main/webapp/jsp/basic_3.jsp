<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%--
      => 요청처리 => doGet
       _jspService() {
           out.write('\r');
           out.write('\n');
           out.write("    \r\n");
           out.write("<!DOCTYPE html>\r\n");
           out.write("<html>\r\n");
           out.write("<head>\r\n");
           out.write("<meta charset=\"UTF-8\">\r\n");
           out.write("<title>Insert title here</title>\r\n");
           out.write("</head>\r\n");
           out.write("<body>\r\n");
           out.write("    <h1> Hello JSP!! </h1>\r\n");
           out.write("</body>\r\n");
           out.write("</html>");            
       }
       
       => JSP 실행
           메모리에 적재 => 파일 이동 / 새로고침 => 메모리 삭제 _jspDestory()
    71page
       _jspInit()    : 설정 파일 (web.xml)
       _jspDestory() : 메모리 해제 => 자동 호출
       _jspService() : 요청 처리 => 화면 출력 (HTML 구현)
       ------------- 비워둔다 (JSP를 이용해서 채운다)
       JSP는 메소드 영역에 코딩
       _jspService() {
          ---------------
           JSP 파일로 만든다
          --------------- 
       }      
                         
 --%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <h1> Hello JSP!! </h1>
</body>
</html>