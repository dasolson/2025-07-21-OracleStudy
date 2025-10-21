package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.vo.*;
import com.sist.dao.*;
public class FoodListModel implements Model {

	@Override
	public String handlerRequest(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String strPage = request.getParameter("page");
		if(strPage == null)
			strPage = "1";
		int curpage = Integer.parseInt(strPage);
		Map map = new HashMap();
		int rowSize = 12;
		int start = (rowSize*curpage)-(rowSize-1);
		int end = rowSize*curpage;
		map.put("start", start);
		map.put("end", end);
		List<FoodVO> list = FoodDAO.foodListdata(map);
		int totalpage = FoodDAO.foodTotalPage();
		final int BLOCK = 10;
		int startPage = ((curpage-1)/BLOCK*BLOCK)+1;
		int endPage = ((curpage-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage > totalpage)
			endPage = totalpage;
		
		// 결과값 전송 
				JSONArray arr = new JSONArray(); // List매칭 
				// [] => [{},{},{},{}...]
				int i = 0;
				for(FoodVO vo:list) {
					JSONObject obj = new JSONObject(); // {}
					obj.put("fno", vo.getFno());
					obj.put("name", vo.getName());
					obj.put("poster", vo.getPoster());
					if(i == 0) {
						obj.put("curpage", curpage);
						obj.put("totalpage", totalpage);
						obj.put("startPage", startPage);
						obj.put("endPage", endPage);
					}
					i++;
					arr.add(obj);
				}
				request.setAttribute("json", arr.toJSONString());
				//System.out.println(arr.toJSONString());
				return "list.jsp";
			}

}
