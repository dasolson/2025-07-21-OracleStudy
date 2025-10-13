package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
/*
 *   2 버전 => ibatis  => opensource
 *   3 버전 => mybatis => google 인수
 */
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class empDAO {
    private static SqlSessionFactory ssf;
    static {
    	// xml에 등록된 데이터 읽기 => XML(파싱)
    	try {
    		Reader reader = Resources.getResourceAsReader("Config.xml");
    		ssf = new SqlSessionFactoryBuilder().build(reader);
    	}catch(Exception ex) {}
    }
    // 기능 설정
    public static List<empVO> empListData(){
    	SqlSession session = ssf.openSession(); //getConnection()
    	List<empVO> list = session.selectList("empListData");
    	session.close(); // 반환 => disConnection()
    	return list;
    }
    //            resultType          parameterType
    public static empVO empDetailData(int empno) {
    	SqlSession session = ssf.openSession(); //getConnection()
    	empVO vo = session.selectOne("empDetailData", empno);
    	session.close(); // 반환 => disConnection()
    	return vo;
    }
}
