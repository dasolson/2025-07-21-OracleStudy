package com.sist.model;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.StringTokenizer;

public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String today = new SimpleDateFormat("YYYY-MM-dd").format(new Date());
		StringTokenizer st = new StringTokenizer(today,"-");
		String strYear = "2025";
		String strMonth = "10";
		String strDay = null;
		
		if(strYear == null) {
    	    strYear = st.nextToken();	
    	}
    	if(strMonth == null) {
    		strMonth = st.nextToken();
    	}
    	strDay = st.nextToken();
    	
    	System.out.println(strYear + " " + strMonth + " " + strDay);
    	
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
    	System.out.println("요일 : " +strWeek[week]);
    	System.out.println("마지막일 : " +lastday);
    	
	}

}
