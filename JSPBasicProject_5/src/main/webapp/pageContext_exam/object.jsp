<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <div class="container">
      <div class="row">
         <h1>JSP 내장 객체의 영역</h1>
         <table class="table">
            <tr>
               <th>객체</th>
               <th>사용 범위</th>
               <th>공유 여부</th>
            </tr>
            <tr>
               <td>request</td>
               <td>요청하는 동안</td>
               <td>같은 JSP에서만 사용 가능</td>
            </tr>
            <tr>
               <td>session</td>
               <td>브라우저 유지 동안(접속자 마다 생성)</td>
               <td>사용자 별로 유지</td>
            </tr>
            <tr>
               <td>application</td>
               <td>서버 실행 동안</td>
               <td>모든 사용자와 공유</td>
            </tr>
            <tr>
               <td>pageContext</td>
               <td>현재 페이지에서만</td>
               <td>include가 된 JSP는 공유 가능</td>
            </tr>
         </table>
         <h1>JSP 내장 객체 종류</h1>
         <table class="table">
           <caption>내장 객체는 서블릿 변환 => 자동으로 생성되는 객체</caption>
            <tr>
               <th>객체명</th>
               <th>타입</th>
               <th>주요 기능</th>
               <th>주요 메소드</th>
               <th>사용법</th>
            </tr>
            <tr>
               <td>request</td>
               <td>HttpServletRequest</td>
               <td>클라이언트가 보낸 요청 데이터를 모아서 전송 (파라미터, 쿠키, 세션)</td>
               <td>
                  <ul>
                     <li>*** String getParameter() : 단일값을 받는다</li>
                     <li>*** String[] getParameterValue() : 다중값을 받는다</li>
                     <li>getMethod() : GET /POST 확인</li>
                     <li>getRemoteAddr() : 접속자의 IP 얻기</li>
                     <li>*** getRequestURI() : 사용자가 요청한 폴더 ~ 파일명</li>
                     <li>getRequestURL() : 서버 주소 포함</li>
                     <li>*** getContextPath() : 루트</li>
                     <li>*** getCookie() : 쿠키에 저장된 모든 데이터</li>
                     <li>getSession() : 세션 객체 생성</li>
                     <li>*** setAttribute() : 다른 JSP 전송을 할 경우 추가해 전송</li>
                     <li>*** getAttribute() : setAttribute에 저장된 데이터 출력</li>                     
                  </ul>
               </td>
               <td>Cookie[] cookies = request.getCookies()<br>
                   HttpSession session = request.getSession()
               </td>
            </tr>
            <tr>
               <td>response</td>
               
               <td>HttpServletResponse</td>
               <td>서버에서 클라이언트로 응답 할 때 사용<br>
                   HTML / COOKIE => 한 개의 JSP안에서 두 가지를 동시에 보낼 수 없다 <br>
                   HTML : text/html;charset=UTF-8 <br>
                   Cookie : response.addCookie(cookie)
               </td>
               <td>
                  <ul>
                     <li>contentType() : 변환 형식</li>
                     <li>*** sendRedirect() : 서버에서 화면 이동 => GET</li>
                     <li>addCookie() : 쿠키를 브라우저로 전송</li>
                     <li>setHeader() : 다운로드시에 미리 전송</li>
                  </ul>
               </td>
               <td>쿠키 전송 / 다운로드 ...</td>
            </tr>
            <tr>
               <td>application</td>
               <td>ServletContext</td>
               <td>웹 애플리케이션 전체에 대한 정보를 저장, 공유<br>
                   전역적 데이터 저장소
               </td>
               <td>
                  <ul>
                     <li>getInitParameter() : web.xml에 등록된 데이터 읽기</li>
                     <li>getRealPath() : 실제 톰캣이 읽는 메모리 공간</li>
                  </ul>
               </td>
               <td></td>
            </tr>
            <tr>
               <td>pageContext</td>
               <td>pageContext</td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td>out</td>
               <td>JspWriter</td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
            <tr>
               <td>session</td>
               <td>HttpSession</td>
               <td></td>
               <td></td>
               <td></td>
            </tr>
         </table>
      </div>
   </div>
</body>
</html>