package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.lang.reflect.Method;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.net.*;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private List<String> cList = new ArrayList<String>();
	
    public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
	    try {
	    	// realpath 만들기 : 톰캣이 읽어가는 위치
	    	URL url = this.getClass().getClassLoader().getResource(".");
	    	File file = new File(url.toURI());
	    	System.out.println(file.getPath());
	    	String path = file.getPath();
	    	path = path.replace("\\", File.separator);
	    	path = path.substring(0, path.lastIndexOf(File.separator)); // 마지막 \에서 잘라
	    	System.out.println(path);
	    	path = path + File.separator + "application.xml";
	    	System.out.println(path);
	    	
	    	// xml 파싱
	    	DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	    	// 파서기 생성기
	    	DocumentBuilder db = dbf.newDocumentBuilder();
	    	// 파서 => DOM => 트리형태로 저장
	    	Document doc = db.parse(new File(path));
	    	// ROOT
	    	Element beans = doc.getDocumentElement();
	    	System.out.println(beans.getTagName());
	    	NodeList list = beans.getElementsByTagName("context:component-scan");
	    	Element cs = (Element)list.item(0);
	    	String pack = cs.getAttribute("basepackage");
	    	
	    	System.out.println(pack);
	    	cList = FileRead.packageClassLoader(file.getPath(), pack);
	    	
	    	for(String cls:cList) {
	    		System.out.println(cls);	    		
	    	}
	    }catch(Exception ex) {}
    }
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// 사용자의 요청 정보 받기
		/*
		 *    cmd = "/JSPFrontProject_5/sawon/lisr.do
		 *           ------------------
		 *             Contextpath
		 *             
		 *    cmd = "sawon/list.do"         
		 */
		String cmd = request.getRequestURI();
		cmd = cmd.substring(request.getContextPath().length()+1);
		try {
			for(String cls:cList) {
				Class clsName = Class.forName(cls);
				if(clsName.isAnnotationPresent(Controller.class) == false)
					continue;
				Object obj = clsName.getDeclaredConstructor().newInstance();
				Method[] methods = clsName.getDeclaredMethods();
				/*
				 *     @RequestMapping("board/list.do")
				 *     public String board_list()   객체.board_list()
				 *                                  ---------------- invoke 
				 *     {
				 *     
				 *     }
				 *     
				 *     sawon/list.do
				 */
				for(Method method:methods) {
					RequestMapping rm = method.getAnnotation(RequestMapping.class);
					if(cmd.equals(rm.value())) {
						String jsp = (String)method.invoke(obj, request, response); // 찾은 메소드 호출해
						if(jsp == null) { //return => void ====> JSON
							return;
						}else {
							if(jsp.startsWith("redirect:")) {
								String s = jsp.substring(jsp.indexOf(":")+1);
								response.sendRedirect(s);
							}else {
								RequestDispatcher rd = request.getRequestDispatcher(jsp);
								rd.forward(request, response);
							}
						}
					}
				}
			}
		}catch(Exception ex) {}
	}

}
