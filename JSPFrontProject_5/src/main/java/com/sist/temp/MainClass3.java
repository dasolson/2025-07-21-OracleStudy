package com.sist.temp;
import java.util.*;

import com.sist.controller.Controller;
public class MainClass3 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        List<String> list = new ArrayList<String>();
        list.add("com.sist.model.BoardModel");
        list.add("com.sist.model.SawonModel");
        list.add("com.sist.model.MainClass");
        list.add("com.sist.model.FoodModel");
        
        try {
        	for(String cls:list) {
        		Class clsName = Class.forName(cls);
        		if(clsName.isAnnotationPresent(Controller.class) == false) {
        			continue;
        		}
        		Object obj = clsName.getDeclaredConstructor().newInstance();
        		System.out.println(obj);
        	}
        }catch(Exception ex) {}
	}

}
