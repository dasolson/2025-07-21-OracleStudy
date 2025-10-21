package com.sist.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
/*
 *     MVC
 *      |
 *    Model => 기능처리 :  ~VO, ~Model, ~DAO
 *              => 비지니스 로직
 *    ------------------------------------ Back-End          
 *    View  => JSP + JavaScript
 *             화면 출력
 *              => 프레젠테이션 로직
 *    ------------------------------------ Front-End          
 *    Controller    
 *    ------------------------------------ Model + View를 연결
 *    
 *    동작 순서
 *                               웹에서 받는 클래스
 *                                JSP / Servlet
 *                                         | Spring에서 이미 제작
 *                                           Servlet => DispatchServlet
 *                                                      -------- 배달부
 *                                  요청                                  위임(요청 처리)                   
 *         JSP(사용자 요청) =======================> Controller =====================> Model <======> DAO
 *                                                     |                              |
 *                                                     --------------------------------
 *                                                            request / session
 *                                                                 결과값 담기
 *              |                                                      |
 *              <-------------------------------------------------------
 *                                     결과값 전송 
 *          = <a> , <form>
 *          = JavaScript:location.href
 *          
 *          1. 파일이 많이 생성
 *                JSP
 *                 |
 *             ---------
 *             |       |
 *            Java    HTML ==> 파일로 분리  
 *            ------------
 *                 |
 *                연결 => Controller
 *              JSP => 자바를 이용해서 데이터를 가지고 온다
 *                     ---------------------------
 *                      => repuest / session / Cookie  
 *               | <% %> , <%= %> => 사라진다
 *                           
 *          2. 복잡하다
 *          3. 장점 : JSP는 확장이 안된다
 *                   자바로 구현 => 재사용 가능 / 확장 가능
 *                    => JSP : Model 1 => 단순한 사이트 
 *                                        유지보수가 없는 사이트
 *                    => MVC : Model 2 => 대규모 프로그램
 *                                        실무 => MVC 구조 (spring)
 *                        => NCS / KDT
 *                                 --- 실무 중심(프로젝트)
 *                                     신기술 중점 (구현 중심 => 실무)                                     
 *                           --- 표준화 (이론 중심) 
 *      
 *        MVC                   
 *          사용자(손님) ========== 서빙 ========== 주방 (여러개 음식) 
 *                        주문          주문요청            | Model
 *                         |             |
 *                         ---------------
 *                                |
 *                               전달 
 *                         => Controller => 모든 메뉴
 *                         => 메뉴 => XML / Properties
 *                                  ----------------- Spring                         
 *                                                                 
 */
import com.sist.model.*;
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*
		 *    http://localhost/JSPFrontProject_2/list.do
		 *                                       ------- 구분 처리
		 *    ------------------------------------------- URL
		 *                     -------------------------- URI  
		 *     *.do
		 *     ----
		 *     list.do / insert.do / main.do
		 *     ----------------------------- Controller 호출                     
		 */
		String cmd = request.getRequestURI();
		cmd = cmd.substring(request.getContextPath().length()+1);
		//System.out.println(cmd);
		String jsp = "";
		if(cmd.equals("list.do")) {
			ListModel model = new ListModel();
			model.execute(request);
			jsp = "list.jsp";
		}else if(cmd.equals("insert.do")) {
			InsertModel model = new InsertModel();
			model.execute(request);
			jsp = "insert.jsp";
		}else if(cmd.equals("update.do")) {
			UpdateModel model = new UpdateModel();
			model.execute(request);
			jsp = "update.jsp";
		}else if(cmd.equals("delete.do")) {
			DeleteModel model = new DeleteModel();
			model.execute(request);
			jsp = "delete.jsp";
		}
		
		// 전송
		RequestDispatcher rd = request.getRequestDispatcher("view/"+jsp);
		rd.forward(request, response);
	}

}
