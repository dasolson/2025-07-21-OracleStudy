package com.sist.controller;
import java.io.*;
import java.util.*;

public class FileConfig {
   public static void main(String[] args) {
	   packageClassData("C:\\webDev\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\JSPFrontProject4\\WEB-INF\\classes", 
			   "com.sist.model");
   }
   public static List<String> packageClassData(String path, String pack)
   {
	   List<String> list=new ArrayList<String>();
	   try {
		   String strPack = pack.replace(".", File.separator);
		   String strPath = path+File.separator+strPack;
		   System.out.println(strPath);
		   File dir = new File(strPath);
		   File[] listFiles = dir.listFiles();
		   for(File f:listFiles) {
			   //System.out.println(f.getName());
			   String name = f.getName();
			   String ext = name.substring(name.lastIndexOf(".")+1);
			   if(ext.equals("class") && !name.startsWith("Model")) {
				   String cls = pack+"."+name;
				   cls = cls.substring(0,cls.lastIndexOf("."));
				   list.add(cls);
			   }
		   }
		   for(String s:list) {
			   System.out.println(s);
		   }
	   }catch(Exception ex){}
	   return list;
   }
}