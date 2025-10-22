package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;

public class EmpListModel implements Model{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		List<EmpVO> list = EmpDAO.empListData();
		JSONArray arr = new JSONArray(); // list
		for(EmpVO vo:list) {
			JSONObject obj = new JSONObject(); // vo
			obj.put("empno", vo.getEmpno());
			// {"empno":7788}
			obj.put("ename", vo.getEname());
			obj.put("job", vo.getJob());
			obj.put("dbday", vo.getDbday());
			obj.put("deptno", vo.getDeptno());
			arr.add(obj);
		}
		request.setAttribute("json", arr.toJSONString());
		return "../emp/list.jsp";
	}

}
