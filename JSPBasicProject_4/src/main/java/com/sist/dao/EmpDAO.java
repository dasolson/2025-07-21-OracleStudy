package com.sist.dao;

import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.EmpVO;

public class EmpDAO {
	private static SqlSessionFactory ssf;
    static {
    	// xml 파싱 => 저장된 데이터 읽기
    	try {
    		// xml파일 읽기
    		Reader reader = Resources.getResourceAsReader("Config.xml");
    		ssf = new SqlSessionFactoryBuilder().build(reader);
    		// map에 저장 => Key=id value=SQL
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}
    }
    /*
     * <select id="empdeptJoinData" resultMap="empMap"> 
	      SELECT empno, ename, job, TO_CHAR(hiredate,'YYYY-MM-DD') as dbday, sal, dname, loc
	      FROM emp, dept
	      WHERE emp.deptno=dept.deptno
	   </select>
     */
    public static List<EmpVO> empdeptJoinData(){
    	SqlSession session = ssf.openSession();
    	List<EmpVO> list = session.selectList("empdeptJoinData");
    	session.close();
    	
    	return list;
    }
}
