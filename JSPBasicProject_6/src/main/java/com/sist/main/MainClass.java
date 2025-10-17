package com.sist.main;
import java.util.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        Map map = new HashMap();
        map.put("name", "홍길동");
        System.out.println(map.get("name"));
        map.put("name", "심청이");
        System.out.println(map.get("name"));
	}

}
