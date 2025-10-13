<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- 
       class ClassName {
          --------------
           <%! %>
          --------------
          public void method(){
              ------------------
               <% %>
              ------------------
          }
       }
--%>
<%!
    String name = "홍길동"; // 멤버변수
    /*
        class basic_005f5 extends HttpServlet {
    	    String name = "홍길동";
    	    
    	    public void _jspInit(){}
    	    public void _jspDestory(){}
    	    public void _jspService(){
    	    	스크립트릿에 코딩된 내용
    	    }
        }
    
    */
    public int add(int a, int b){
    	return a+b;
    }
    public String getName(){
    	return name;
    }
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>선언식 &lt;%! %&gt;</h1>
   <%
      int a = 10;
      int b = 20;
      int c = add(a,b);
      String k = getName();
      
      out.println(c);
      out.println(k);
   %>
   <%= c %><br>
   <%= k %>
</body>
</html>