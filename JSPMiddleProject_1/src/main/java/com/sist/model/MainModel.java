package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.util.*;
import com.sist.vo.*;
import com.sist.dao.*;
@Controller
public class MainModel {
  @RequestMapping("main/main.do")
  public String main_main(HttpServletRequest request,
		  HttpServletResponse response)
  {
	  //1.사용자가 요청한 데이터 받기 
	  String page=request.getParameter("page");
	  if(page==null)
		  page="1";
	  int curpage=Integer.parseInt(page);
	  Map map=new HashMap();
	  int rowSize=12;
	  int start=(rowSize*curpage)-(rowSize-1);
	  int end=rowSize*curpage;
	  map.put("start", start);
	  map.put("end", end);
	  List<FoodVO> list=FoodDAO.foodListData(map);
	  int totalpage=FoodDAO.foodTotalPage();
	  
	  // 블록별 처리 
	  final int BLOCK=10;
	  int startPage=((curpage-1)/BLOCK*BLOCK)+1;
	  int endPage=((curpage-1)/BLOCK*BLOCK)+BLOCK;
	  
	  if(endPage>totalpage)
	  {
		  endPage=totalpage;
	  }
	  
	  // 데이터 전송 
	  request.setAttribute("list", list);//${list}
	  request.setAttribute("curpage", curpage);//${curpage}
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("startPage", startPage);
	  request.setAttribute("endPage", endPage);
	  //include => 설정파일 
	  request.setAttribute("main_jsp", "../main/home.jsp");
	  return "../main/main.jsp";
  }
}
