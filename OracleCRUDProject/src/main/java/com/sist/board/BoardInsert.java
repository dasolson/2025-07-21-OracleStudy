package com.sist.board;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import com.sist.vo.*;
import com.sist.dao.*;

@WebServlet("/BoardInsert")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    // 화면 출력	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 1.HTML을 전송 => 브라우저에 알린다
		response.setContentType("text/html;char=UTF-8");
		// 2. 어떤 브라우저에 HTML을 전송 할지 확인
		PrintWriter out = response.getWriter();
		
		out.println("<html>");
		out.println("<head>");
		out.println("<link rel=stylesheet href=\"css/table.css\">");
		out.println("<style type=text/css>");
		out.println("h1{text-align:center}");
		out.println("table{margin:0px auto}");
		out.println("</style>");
		out.println("</head>");
		out.println("<body>");
		
		out.println("<h1>글쓰기</h1>");
		out.println("<form method=post action=BoardInsert>");
		out.println("<table id=table_content width=800>");
		out.println("<tr>");
		out.println("<th width=20%>이름</th>");
		out.println("<td width=80%>");
		out.println("<input type=text size=20 name=name required>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th width=20%>제목</th>");
		out.println("<td width=80%>");
		out.println("<input type=text size=50 name=subject required>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th width=20%>내용</th>");
		out.println("<td width=80%>");
		out.println("<textarea rows=5 cols=50 name=content required></textarea>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");
		out.println("<th width=20%>비밀번호</th>");
		out.println("<td width=80%>");
		out.println("<input type=password size=10 name=pwd required>");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("<tr>");		
		out.println("<td cols=2 align=centet>");
		out.println("<input type=submit value=글쓰기>");
		out.println("<input type=button value=취소 onclick=\"Javascript:history.back()\">");
		out.println("</td>");
		out.println("</tr>");
		
		out.println("</table>");	
		out.println("</form>");
		out.println("</body>");
		out.println("</html>");
	}

	// 데이터베이스 처리
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// => BoardList로 이동
		// 사용자가 보낸 값을 받는다
		String name = request.getParameter("name");
		String subject = request.getParameter("subject");
		String content = request.getParameter("content");
		String pwd = request.getParameter("pwd");
		
		BoardDTO vo = new BoardDTO();
		vo.setName(name);
		vo.setPwd(pwd);
		vo.setSubject(subject);
		vo.setContent(content);
		
		// DAO에 전송
		//System.out.println(name);
		BoardDAO dao = BoardDAO.newInstance();
		dao.boardInsert(vo);
		response.sendRedirect("BoardList");
	}

}



























