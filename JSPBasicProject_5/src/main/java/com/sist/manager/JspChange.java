package com.sist.manager;

public class JspChange {
    private String[] jsp = {
    	"home.jsp",
    	"action.jsp",
    	"directive.jsp",
    	"el.jsp",
    	"object.jsp"
    };
    public String change(int no) {
    	return jsp[no];
    }
}
