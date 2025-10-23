package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class SawonModel {
	@RequestMapping("sawon/list.do")
    public String sawon_list(HttpServletRequest request, HttpServletResponse response) {
    	request.setAttribute("msg", "사원 목록");
    	return "../sawon/list.jsp";
    }
}
