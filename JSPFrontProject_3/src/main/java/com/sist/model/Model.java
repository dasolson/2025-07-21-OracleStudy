package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface Model {
	// 요청처리 메소드
	public String handlerRequest(HttpServletRequest request, HttpServletResponse response);	
    
}
