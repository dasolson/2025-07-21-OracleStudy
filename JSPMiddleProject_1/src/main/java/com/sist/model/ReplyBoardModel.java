package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.sist.dao.*;
@Controller
public class ReplyBoardModel {
  @RequestMapping("board/list.do")
  public String board_list(HttpServletRequest request, HttpServletResponse response) {
	  String page = request.getParameter("page");
	  // HttpServletRequest는 사용하지 않는다 
	  // 스프링 board_list(int page)
	  // 스프링 board_insert(BoardVO vo)
	  if(page == null)
		  page = "1";
	  int curpage = Integer.parseInt(page);
	  List<ReplyBoardVO> list = ReplyBoardDAO.boardListData((curpage-1)*10);
	  int count = ReplyBoardDAO.boardTotalPage();
	  int totalpage = (int)(Math.ceil(count/10.0));
	  count = count-((curpage*10)-10);
	  request.setAttribute("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
	  request.setAttribute("count", count);
	  request.setAttribute("list", list);
	  request.setAttribute("curpage", curpage);
	  request.setAttribute("totalpage", totalpage);
	  request.setAttribute("msg", "관리자가 삭제한 게시물입니다");
	  request.setAttribute("main_jsp", "../replyboard/list.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("board/insert.do")
  public String board_insert(HttpServletRequest request, HttpServletResponse response) {
	  request.setAttribute("main_jsp", "../replyboard/insert.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("board/insert_ok.do")
  public String board_insert_ok(HttpServletRequest request, HttpServletResponse response) {
	  // 처리 
	  //1. 사용자가 보낸 데이터 받기  name , subject, content,pwd
	  String name = request.getParameter("name");
	  String subject = request.getParameter("subject");
	  String content = request.getParameter("content");
	  String pwd = request.getParameter("pwd");
	  
	  ReplyBoardVO vo = new ReplyBoardVO();
	  vo.setName(name);
	  vo.setContent(content);
	  vo.setSubject(subject);
	  vo.setPwd(pwd);
	  
	  // vo=>DAO : 오라클 저장 
	  ReplyBoardDAO.boardInsert(vo);
	  // 화면 이동 
	  // sendRedirect() => 화면 이동 (request를 초기화)
	  // 재호출 => list.do 다시 호출한다
	  return "redirect:../board/list.do";
  }
  @RequestMapping("board/detail.do")
  public String board_detail(HttpServletRequest request, HttpServletResponse response) {
	  // 사용자 전송 데이터 받기 
	  // ?no=10
	  String no = request.getParameter("no");
	  // 요청 처리 => DAO
	  ReplyBoardVO vo = ReplyBoardDAO.boardDetailData(Integer.parseInt(no));
	  // 처리된 결과값 => 해당 JSP전송 
	  request.setAttribute("vo", vo);
	  // 화면 출력 
	  request.setAttribute("main_jsp", "../replyboard/detail.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("board/update.do")
  public String board_update(HttpServletRequest request, HttpServletResponse response) {
	  String no = request.getParameter("no");
	  ReplyBoardVO vo = ReplyBoardDAO.boardUpdateData(Integer.parseInt(no));
	  // update.jsp로 전송
	  request.setAttribute("vo", vo);
	  request.setAttribute("main_jsp", "../replyboard/update.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("board/reply.do")
  public String board_reply(HttpServletRequest request, HttpServletResponse response) {
	  String no = request.getParameter("no");
	  request.setAttribute("no", no);
	  request.setAttribute("main_jsp", "../replyboard/reply.jsp");
	  return "../main/main.jsp";
  }
  @RequestMapping("board/update_ok.do")
  public void board_update_ok(HttpServletRequest request, HttpServletResponse response) {
	//1. 사용자가 보낸 데이터 받기  name , subject, content,pwd
	  String name = request.getParameter("name");
	  String subject = request.getParameter("subject");
	  String content = request.getParameter("content");
	  String pwd = request.getParameter("pwd");
	  String no = request.getParameter("no");
	  
	  ReplyBoardVO vo = new ReplyBoardVO();
	  vo.setName(name);
	  vo.setContent(content);
	  vo.setSubject(subject);
	  vo.setPwd(pwd);
	  vo.setNo(Integer.parseInt(no));
	  
	  // DAO 연동
	  String res = ReplyBoardDAO.boardUpdate(vo);
	  // 결과값을 받아서 => Ajax 로 전송	  
	  try {
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  out.write(res);
	  }catch(Exception ex) {}
  }
  @RequestMapping("board/reply_ok.do")
  public String board_reply_ok(HttpServletRequest request, HttpServletResponse response) {
	//1. 사용자가 보낸 데이터 받기  name , subject, content,pwd
	  String name = request.getParameter("name");
	  String subject = request.getParameter("subject");
	  String content = request.getParameter("content");
	  String pwd = request.getParameter("pwd");
	  String no = request.getParameter("pno");
	  
	  ReplyBoardVO vo = new ReplyBoardVO();
	  vo.setName(name);
	  vo.setContent(content);
	  vo.setSubject(subject);
	  vo.setPwd(pwd);
	  int pno = Integer.parseInt(no);
	  
	  // DB 연동 
	  ReplyBoardDAO.boardReplyInsert(pno, vo);
	  return "redirect:../board/list.do";
  }
  @RequestMapping("board/delete.do")
  public void board_delete(HttpServletRequest request, HttpServletResponse response) {
	  String no = request.getParameter("no");
	  String pwd = request.getParameter("pwd");
	  
	  String res = ReplyBoardDAO.boardDelete(Integer.parseInt(no), pwd);
	  
	  try {
		  response.setContentType("text/html;charset=UTF-8");
		  PrintWriter out = response.getWriter();
		  out.write(res);
	  }catch(Exception ex) {}
  }
  
  
}
