package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.sist.dao.*;
import com.sist.vo.*;
public class EmpDetailModel implements Model{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String empno = request.getParameter("empno");
		EmpVO vo = EmpDAO.empDetailData(Integer.parseInt(empno));
		JSONObject obj = new JSONObject();
		obj.put("empno", vo.getEmpno());
		obj.put("ename", vo.getEname());
		obj.put("job", vo.getJob());
		obj.put("mgr", vo.getMgr());
		obj.put("dbday", vo.getDbday());
		obj.put("sal", vo.getSal());
		obj.put("comm", vo.getComm());
		obj.put("deptno", vo.getDeptno());
		request.setAttribute("vo", obj.toJSONString());
		return "../emp/detail.jsp";
	}

}
