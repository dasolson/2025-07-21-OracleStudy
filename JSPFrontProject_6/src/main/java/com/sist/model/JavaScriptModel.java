package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class JavaScriptModel {
	@RequestMapping("js/model.do")
    public String js_model(HttpServletRequest request, HttpServletResponse response) {
    	request.setAttribute("main_jsp", "../js/model.jsp");
		return "../main/main.jsp";
    }
}
