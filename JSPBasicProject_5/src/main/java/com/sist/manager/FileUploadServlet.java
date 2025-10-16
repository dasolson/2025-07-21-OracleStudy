package com.sist.manager;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.*;

@WebServlet("/FileUploadServlet")
@MultipartConfig(
   fileSizeThreshold = 1024*1024*100,
   maxFileSize = 1024*1024*500,
   maxRequestSize = 1024*1024*10
)
public class FileUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		String uploadPath=getServletContext().getRealPath("/")+"upload";//"C:\\webDev\\webStudy\\JSPBasicProject_5\\src\\main\\webapp\\upload";
		uploadPath=uploadPath.replace("\\", File.separator);
		File uploadDir=new File(uploadPath);
		if(!uploadDir.exists())
		{
			uploadDir.mkdir();
		}
		try
		{
			// file 읽기
			Part filePart=request.getPart("upload");
			String fileName=filePart.getSubmittedFileName();
			// 파일 저장 
			filePart.write(uploadPath+File.separator+fileName);
			// c:\\upload\\mm1.jpg
			String uploader=request.getParameter("upload");
			/*response.getWriter().println("<h1>업로드 완료</h1>");
			response.getWriter().println("<p>업로더:"+uploader+"</p>");
			response.getWriter().println("<p>파일명:"+fileName+"</p>");
			response.getWriter().println("<p>위치:"+uploadPath+"</p>");*/
			response.sendRedirect("application_exam/print.jsp?fn="+fileName);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			
			response.getWriter().println("파일 업로드 실패:"+ex.getMessage());
		}
	}

}