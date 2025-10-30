package com.sist.dao;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.sist.vo.*;
import com.sist.commons.*;
public class ReplyBoardDAO {
   private static SqlSessionFactory ssf;
   static
   {
	   ssf=CreateSqlSessionFactory.getSsf();
   }
   /*
    *   <select id="boardListData" resultType="ReplyBoardVO"
   parameterType="int"
  >
    <!-- 
           group_tab : 간격조절 
             AAAAA 0
               => BBBBB 1
                 => CCCCC 2
           group_id : 답변을 모아둔것 
             AAAAA 1
               => BBBBB 1
                => CCCCCC 1
               => DDDD 1
             EEEE 2
              => KKKK 2
           group_step
              AAAAA 0
               => BBBBB 1
                => CCCCCC 2
               => DDDD 3
               
           AAAAAA           1  0
             
             => BBBBBB      1  1
             
               => CCCCCCC   1  2
             => DDDDDD      1  3
              
               
     -->
    SELECT no,subject,name,
           TO_CHAR(regdate,'YYYY-MM-DD') as dbday,
           hit,group_tab
    FROM replyboard
    ORDER BY group_id DESC,group_step ASC
    OFFSET #{start} ROWS NEXT 10 ROWS ONLY
    
  </select>
  <select id="boardTotalPage" resultType="int">
   SELECT CEIL(COUNT(*)/10.0)
   FROM replyboard
  </select>
    */
   public static List<ReplyBoardVO> boardListData(int start)
   {
	   SqlSession session=ssf.openSession(); // 오라클 연결 
	   List<ReplyBoardVO> list=session.selectList("boardListData",start);
	   session.close(); // 오라클 종료 
	   return list;
   }
   
   public static int boardTotalPage()
   {
	   SqlSession session=ssf.openSession(); // 오라클 연결 
	   int total=session.selectOne("boardTotalPage");
	   session.close(); // 오라클 종료 
	   return total;
   }
   
   public static void boardInsert(ReplyBoardVO vo)
   {
	   SqlSession session=ssf.openSession(true);
	   session.insert("boardInsert",vo);
	   session.close();
   }
   /*
    *   <update id="boardHitIncrement" parameterType="int">
      UPDATE replyboard SET
      hit=hit+1 
      WHERE no=#{no}
    </update>
    <select id="boardDetailData" resultType="ReplyBoardVO"
     parameterType="int"
    >
      SELECT no,name,subject,content,hit,
             TO_CHAR(regdate,'YYYY-MM-DD HH24:MI:SS') as dbday
      FROM replyboard
      WHERE no=#{no}
    </select>
    */
   public static ReplyBoardVO boardDetailData(int no)
   {
	   SqlSession session=ssf.openSession();
	   session.update("boardHitIncrement",no);
	   session.commit();
	   ReplyBoardVO vo=
			   session.selectOne("boardDetailData",no);
	   session.close();
	   return vo;
   }
   /*
    *    <select id="boardUpdateData" resultType="ReplyBoardVO" parameterType="int">
	       SELECT no, subject, content
	       FROM replyboard
	       WHERE no=#{no}
	    </select>
	    <select id="boardGetPassword" resultType="String" parameterType="int">
	       SELECT pwd FROM replyBoard
	       WHERE no=#{no}
	    </select>
	    <update id="boardUpdate" parameterType="ReplyBoardVO">
	       UPDATE replyboard SET
	       name=#{name}, subject=#{subject}, content=#{content}
	       WHERE no=#{no}
	    </update>
    */
   public static ReplyBoardVO boardUpdateData(int no) {
	   SqlSession session = ssf.openSession();
	   ReplyBoardVO vo = session.selectOne("boardUpdateData", no);
	   session.close();
	   return vo;
   }
   /*
    * <update id="boardUpdate" parameterType="ReplyBoardVO">
	       UPDATE replyboard SET
	       name=#{name}, subject=#{subject}, content=#{content}
	       WHERE no=#{no}
	    </update>
    */
   public static String boardUpdate(ReplyBoardVO vo) {
	   String res = "no";
	   SqlSession session = ssf.openSession();
	   String db_pwd = session.selectOne("boardGetPassword", vo.getNo());
	   if(db_pwd.equals(vo.getPwd())) {
		   res = "yes";
		   session.update("boardUpdate", vo);
		   session.commit();
	   }
	   session.close();
	   return res;
   }
   /*
    * <select id="boardParentInfoData" resultType="ReplyBoardVO" parameterType="int">
	       SELECT group_id, group_step, group_tab
	       FROM replyboard
	       WHERE no=#{no}
	    </select>
	    <!-- 
	          Update 설정  gi DESC, gs ASC
	                          gi  gs  gt
	            AAAAA          1   0   0
	             =>BBBBB       1   1   1
	                => CCC     1   2   2
	             DDDDD         1   1   1   
	     -->
	     <update id="boardGroupStepIncrement" parameterType="ReplyBoardVO">
	        UPDATE replyboard SET
	        group_step=group_step+1
	        WHERE group_id=#{group_id} AND group_step>#{group_step}
	     </update>
	    <!-- 
	          Insert
	     --> 
	     <insert id="boardReplyInsert" parameterType="ReplyBoardVO">
	        INSERT INTO replyboard(no, name, subject, content, pwd, group_id, group_step, group_tab, root, depth)
	        VALUES(rb_no_seq.nextval, #{name}, #{subject}, #{content}, #{pwd}, #{group_id}, #{group_step}, #{group_tab}, #{root}, 0)
	     </insert>
	    <!-- 
	          Update  
	     --> 
	     <update id="boardDepthIncrement" parameterType="int">
	        UPDATE replyboard SET
	        depth=depth+1
	        WHERE no=#{no}
	     </update>
    */
   // 트랜젝션 프로그램 = 일괄처리
   public static void boardReplyInsert(int pno, ReplyBoardVO vo) {
	   SqlSession session = ssf.openSession();
	   // 1. 상위 게시물 받기
	   ReplyBoardVO pvo = session.selectOne("boardParentInfoData", pno);
	   // 2. update
	   session.update("boardGroupStepIncrement", pvo);
	   // 3. insert
	   vo.setGroup_id(pvo.getGroup_id());
	   vo.setGroup_step(pvo.getGroup_step()+1);
	   vo.setGroup_tab(pvo.getGroup_tab()+1);
	   vo.setRoot(pno);
	   session.insert("boardReplyInsert",vo);
	   session.update("boardDepthIncrement",pno);
	   session.commit();
	   session.close();
   }
   /*
    * <select id="boardDeleteInfoData" resultType="ReplyBoardVO" parameterType="int">
       SELECT pwd, depth, root
	       FROM replyboard
	       WHERE no=#{no}
	    </select>
	    <update id="boardSCData" parameterType="int">
	       UPDATE replyboard SET
	       subject='관리자가 삭제한 게시물입니다', content='관리자가 삭제한 게시물입니다'
	       WHERE no=#{no}
	    </update>
	    <delete id="boardDelete" parameterType="int">
	       DELETE FROM replyboard
	       WHERE no=#{no}
	    </delete>
	    <update id="boardDepthDecrement" parameterType="int">
	       UPDATE replyboard SET
	       depth=depth-1
	       WHERE no=#{no}
	    </update>
    */
   public static String boardDelete(int no, String pwd) {
	   String res = "no";
	   SqlSession session = ssf.openSession();
	   ReplyBoardVO vo = session.selectOne("boardDeleteInfoData",no); 
	   if(pwd.equals(vo.getPwd())) {
		   res = "yes";
		   if(vo.getDepth() == 0) {
			   session.delete("boardDelete",no);
		   }else {
			   session.delete("boardSCData",no);
			   //session.update("boardSCData",no);
		   }
		   session.update("boardDepthDecrement",vo.getRoot());
	   }
	   session.commit();
	   session.close();
	   return res;
   }
}
