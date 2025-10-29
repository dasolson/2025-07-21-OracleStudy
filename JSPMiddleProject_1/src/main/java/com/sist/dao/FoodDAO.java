package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.commons.*;
import com.sist.vo.*;
public class FoodDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   
   /*
    *   <select id="foodListData" resultType="FoodVO" 
    *     parameterType="hashmap">
    *   SELECT fno,name,poster,num 
	    FROM (SELECT fno,name,poster,rownum as num
	    FROM (SELECT fno,name,poster 
	    FROM menupan_food ORDER BY fno))
	    WHERE num BETWEEN #{start} AND #{end}
	    
	    id = 메소드명 
    */
   public static List<FoodVO> foodListData(Map map)
   {
	   SqlSession session=ssf.openSession();
	   List<FoodVO> list=session.selectList("foodListData",map);
	   session.close();
	   return list;
   }
   
   /*
    *   <select id="foodTotalPage" resultType="int">
         SELECT CEIL(COUNT(*)/12.0) 
         FROM menupan_food
        </select>
    */
   public static int foodTotalPage()
   {
	   SqlSession session=ssf.openSession();
	   int total=session.selectOne("foodTotalPage");
	   session.close();
	   return total;
   }
   /*
    *   <!-- 상세보기 : 조회수 증가 -->
		  <update id="hitIncrement" parameterType="int">
		   UPDATE menupan_food SET
		   hit=hit+1
		   WHERE fno=#{fno}
		  </update>
		  <select id="foodDetailData" resultType="FoodVO" 
		  parameterType="int">
		   SELECT * FROM menupan_food
		   WHERE fno=#{fno}
		  </select>
		  
		  JSP => 요청 (form / a)
		   |
		  Mapper 
		   | 
		  DAO 
		   |
		  Model =====> JSP에서 출력 
    */
   public static FoodVO foodDetailData(int fno)
   {
	   SqlSession session=ssf.openSession();
	   session.update("hitIncrement",fno);
	   session.commit();
	   FoodVO vo=session.selectOne("foodDetailData", fno);
	   session.close();
	   return vo;
   }
   /*
    *   <!-- 음식 종류별  -->
	  <select id="foodTypeListData" resultType="FoodVO"
	   parameterType="hashmap"
	  >
	    SELECT fno,name,poster,type
	    FROM menupan_food
	    WHERE type LIKE '%'||#{type}||'%'
	    ORDER BY fno ASC
	    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	    <!-- 
	       MySQL : LIMIT start,12
	       Oracle : Inline View
	     -->
	  </select>
	  <select id="foodTypeTotalPage" resultType="int"
	   parameterType="string" 
	  >
	    SELECT CEIL(COUNT(*)/12.0)
	    FROM menupan_food
	    WHERE type LIKE '%'||#{type}||'%'
	    <!-- 
	         MySQL : WHERE type LIKE CONCAT('%',#{type},'%')
	         NVL = IFNULL , TO_CHAR = DATE_FORMAT
	     -->
	  </select>
    */
   public static List<FoodVO> foodTypeListData(Map map)
   {
	   List<FoodVO> list=null;
	   try
	   {
		   SqlSession session=ssf.openSession();
		   list=session.selectList("foodTypeListData",map);
		   session.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return list;
   }
   public static int foodTypeTotalPage(String type)
   {
	   int total=0;
	   try
	   {
		   SqlSession session=ssf.openSession();
		   total=session.selectOne("foodTypeTotalPage",type);
		   session.close();
	   }catch(Exception ex)
	   {
		   ex.printStackTrace();
	   }
	   return total;
   }
   /*
    *   <select id="foodFindListData" resultType="FoodVO"
	    parameterType="hashmap"
	  >
	    SELECT fno,name,subject,address
	    FROM menupan_food
	    WHERE ${column} LIKE '%'||#{ss}||'%'
	    <!-- 
	      WHERE 'address' LIKE ~
	      $ = table , column 
	     -->
	  </select>
    */
   public static List<FoodVO> foodFindListData(Map map)
   {
	   List<FoodVO> list=null;
	   try
	   {
		   SqlSession session=ssf.openSession();
	       list=session.selectList("foodFindListData",map);
	       session.close();
	   }catch(Exception ex)
	   {
		  System.out.println("foodFindListData:"+ex.getMessage());
	   }
	   
	   return list;
   }
   
   /*
    * <select id="foodAjaxListData" resultType="FoodVO"
	   parameterType="String"
	  >
	    SELECT fno,name,poster,type, rownum
	    FROM menupan_food
	    WHERE type LIKE '%'||#{type}||'%' AND rownum%lt;=12    
	    OFFSET #{start} ROWS FETCH NEXT 12 ROWS ONLY
	    <!-- 
	       MySQL : LIMIT start,12
	       Oracle : Inline View
	     -->
	  </select>
    */
   public static List<FoodVO> foodAjaxListData(String type){
	   SqlSession session = ssf.openSession();
	   List<FoodVO> list = session.selectList("foodAjaxListData", type);
	   session.close();
	   return list;
   }
}
