package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.*;
import java.util.*;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import com.sist.model.Model;

@WebServlet("*.do")
public class DispatcherServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String[] keys = {
			"emp/detail.do",
			"emp/list.do",
			"music/find.do",
			"music/list.do"
	};
	private Map clsMap = new HashMap();
	private List<String> clsList = new ArrayList<String>();
	public void init(ServletConfig config) throws ServletException {
		// TODO Auto-generated method stub
		// config => web.xml 
		try {
			URL url = this.getClass().getClassLoader().getResource(".");
			// RealPath
			File file = new File(url.toURI());
			System.out.println(file.getPath());
			// C:\oracleDev\oracleStudy\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\JSPFrontProject4\WEB-INF\classes
			String path = file.getPath();
			// 경로명 조절
			path = path.replace("\\", File.separator);
			path = path.substring(0,path.lastIndexOf(File.separator));
			// WEB-INF/  WEB-INF\\
			path = path + File.separator + "config" + File.separator + "application.xml";
			System.out.println(path);
			// xml 읽기
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			// xml 데이터 읽기 : 파서
			// 자바 == xml == 자바스크립트 (json)
			// XML / WML / VML / HDML ...
			DocumentBuilder db = dbf.newDocumentBuilder();
			// xml 읽기
			Document doc = db.parse(new File(path));
			// Document : 문서 저장 공간
			// root 태그 읽기   root => xml에서는 문서형 데이터베이스 : root가 테이블
			/*     
			 *     <beans>
			 *        <bean id="aaa">Test</bean>
			 *        <bean id="aaa">Test</bean>
			 *              ------- Attribute
			 *     </beans>   
			 *         
			 *               beans : root 태그
			 *                 |
			 *          ---------------
			 *          |             |
			 *         bean          bean  => Element   
			 *          |             |
			 *         Test          Test  => TextNode     
			 */
			Element beans = doc.getDocumentElement();
			System.out.println("태그명 : " + beans.getTagName());
			// 같은 이름의 태그를 모아서 반복 수행 
			NodeList list = beans.getElementsByTagName("context:component-scan");
			for(int i = 0; i < list.getLength(); i++) {
				Element ccs = (Element)list.item(i);
				String pack = ccs.getAttribute("basePackage");
				System.out.println(pack);
				clsList = FileConfig.packageClassData(file.getPath(), pack);
			}
			// XML 파싱
			int i = 0;
			for(String cls:clsList)
			{
				Class clsName=Class.forName(cls);
				// 클래스 정보 읽기 => 메소드 호출 / 메모리 할당 / 변수값 설정 
				// 리플렉션 
				Object obj=clsName.getDeclaredConstructor().newInstance();
				clsMap.put(keys[i], obj);
				// 메뉴 완성 
				System.out.println(keys[i]+":"+obj);
				i++;
			}
		}catch(Exception ex) {}
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//1. 사용자 요청정보 받기 => URL
		String cmd=request.getRequestURI();
		//System.out.println(cmd);
		// http://localhost/JSPFrontProject_4/emp/list.do?id=admin
		/*
		 *  /JSPFrontProject_4/emp/list.do
		 */
		cmd=cmd.substring(request.getContextPath().length()+1);
		System.out.println(cmd);
		//2. 해당 Model을 찾는다 
		Model model=(Model)clsMap.get(cmd);
		//3. Model이 가지고 있는 execute를 실행 
		String jsp=model.execute(request, response);
		//4. 실행결과를 => JSP로 전송 
		RequestDispatcher rd=request.getRequestDispatcher(jsp);
		rd.forward(request, response);
		/*
		 *   1. String : 해당 JSP => return 
		 *   2. void : 해당 JavaScript로 전송 => JSON
		 */
	}

}