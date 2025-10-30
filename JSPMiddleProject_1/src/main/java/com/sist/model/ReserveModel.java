package com.sist.model;
import java.text.SimpleDateFormat;
import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@Controller
public class ReserveModel {
    @RequestMapping("ajax/reserve/do")
    public String reserve(HttpServletRequest request, HttpServletResponse response) {
    	
    	return "../main/main.jsp";
    }
    @RequestMapping("ajax/diary.do")
    public String diary(HttpServletRequest request, HttpServletResponse response) {
    	String today = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
    	String strYear = request.getParameter("year");
    	String strMonth = request.getParameter("month");    	
    	StringTokenizer st = new StringTokenizer(today,"-");
    	String sy = st.nextToken();
    	String sm = st.nextToken();
    	String sd = st.nextToken();
    	
    	if(strYear == null) {
    	    strYear = sy;	
    	}
    	if(strMonth == null) {
    		strMonth = sm;
    	}
    	String strDay = sd;
    	
    	int year = Integer.parseInt(strYear);
    	int month = Integer.parseInt(strMonth);
    	int day = Integer.parseInt(strDay);
    	
    	Calendar cal = Calendar.getInstance();
    	cal.set(Calendar.YEAR, year);
    	cal.set(Calendar.MONTH, month-1);
    	cal.set(Calendar.DATE, 1);
    	
    	String[] strWeek = {"일","월","화","수","목","금","토"};
    	int week = cal.get(Calendar.DAY_OF_WEEK);
    	week = week-1;
    	int lastday = cal.getActualMaximum(Calendar.DATE);
    	
    	request.setAttribute("year", year);
    	request.setAttribute("month", month);
    	request.setAttribute("day", day);
    	request.setAttribute("strWeek", strWeek);
    	request.setAttribute("week", week);
    	request.setAttribute("lastday", lastday);
    	
    	request.setAttribute("main_jsp", "../ajax/diary.jsp");
    	return "../main/main.jsp";
    }
}
