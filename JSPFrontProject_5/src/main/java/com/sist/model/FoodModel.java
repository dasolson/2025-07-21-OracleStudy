package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class FoodModel {
	@RequestMapping("food/list.do")
    public String food_list(HttpServletRequest request, HttpServletResponse response) {
    	request.setAttribute("msg", "맛집 목록");
    	return "../food/list.jsp";
    }
}
