package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.sist.vo.ZipcodeVO;

import java.io.*;
public class MemberDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   try
	   {
		   Reader reader=Resources.getResourceAsReader("Config.xml");
		   ssf=new SqlSessionFactoryBuilder().build(reader);
		   // xml => 태그 / 속성 (데이터베이스의 컬럼)
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
   }
   /*
    *    <select id="postFindData" resultType="ZipcodeVO"
		   parameterType="string"
		 >
		   SELECT zipcode,sido,gugun,dong,NVL(bunji,' ') as bunji
		   FROM zipcode 
		   WHERE dong LIKE '%'||#{dong}||'%'
		 </select>
    */
   public static List<ZipcodeVO> postFindData(String dong)
   {
	   SqlSession session=ssf.openSession();
	   List<ZipcodeVO> list=session.selectList("postFindData",dong);
	   session.close();
	   return list;
   }
}
