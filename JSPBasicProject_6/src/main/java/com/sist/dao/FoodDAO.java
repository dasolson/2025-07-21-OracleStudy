
package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.FoodVO;

import java.io.*;
public class FoodDAO {
  private static SqlSessionFactory ssf;
  static {
	  // XML에 등록된 데이터를 읽어서 Map에 저장하는 과정 
	  // XML 파싱 
	  try {
		  Reader reader = Resources.getResourceAsReader("Config.xml");
		  ssf = new SqlSessionFactoryBuilder().build(reader);
	  }catch(Exception ex) {
		  ex.printStackTrace();
	  }
  }
  // SQL문장 실행 결과값 
  public static List<FoodVO> foodListData(Map map) {
	  List<FoodVO> list = new ArrayList<FoodVO>();
	  SqlSession session = null;
	  try {
		  session = ssf.openSession();
		  list = session.selectList("foodListData",map);
	  }catch(Exception ex) {
		  ex.printStackTrace();
	  }finally {
		  if(session != null)
			  session.close();
	  }
	  return list;
  }
  // 총 페이지
  public static int foodTotalPage() {
	  int total = 0;
	  SqlSession session = null;
	  try {
		  session = ssf.openSession();
		  total = session.selectOne("foodTotalPage");
	  }catch(Exception ex) {
		  ex.printStackTrace();
	  }finally {
		  if(session != null)
			  session.close();
	  }
	  return total;
  }
  /*
   * <select id="foodDetilData" resultType="FoodVO" parameterType="int">
	      SELECT * FROM menupan_food
	      WHERE fno=#{fno}
	   </select>
   */
  public static FoodVO foodDetilData(int fno) {
	  SqlSession session = ssf.openSession();
	  FoodVO vo = session.selectOne("foodDetilData", fno);
	  session.close();
	  return vo;
  }
}
