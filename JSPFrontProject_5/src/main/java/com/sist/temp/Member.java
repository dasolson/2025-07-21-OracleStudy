package com.sist.temp;
import com.sist.controller.*;
public class Member {
	@RequestMapping("member_join.do")
    public void memberJoin() {
    	System.out.println("Member:memberJoin() Call...");
    }
	@RequestMapping("member_delete.do")
    public void membetDelete() {
    	System.out.println("Member:memberDelete() Call...");
    }
	@RequestMapping("member_update.do")
    public void memberUpdate() {
    	System.out.println("Member:memberUpdate() Call...");
    }
}
