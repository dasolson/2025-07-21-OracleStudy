package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class FoodDAO {
    private static SqlSessionFactory ssf;
    static {
    	ssf = CreateSqlSessionFactory.getSsf();
    }
    public static List<FoodVO> foodListData(Map map){
    	SqlSession session = ssf.openSession();
    	List<FoodVO> list = session.selectList("foodListData", map);
    	session.close();
    	return list;
    }
    public static int foodTotalPage() {
    	SqlSession session =ssf.openSession();
    	int total = session.selectOne("foodTotalPage");
    	session.close();
    	return total;
    }
    public static FoodVO foodDetailData(int fno) {
    	SqlSession session = ssf.openSession();
    	FoodVO vo = session.selectOne("foodDetailData", fno);
    	session.close();
    	return vo;
    }
}
