package com.sist.dao;
import java.util.*;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.*;
import com.sist.vo.*;
public class MusicDAO2 {
    private static SqlSessionFactory ssf;
    // DAO
    static {
    	// XML을 읽어 온다 => 파싱 => Map 저장
    	try {
    		Reader reader = Resources.getResourceAsReader("Config.xml");
    		ssf = new SqlSessionFactoryBuilder().build(reader);
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}
    }
    /*
     *     selectList() while(re.next())
     *     selectOne() rs.next() => 상세보기 / count(*) / pwd
     *        | selectList
     *          return => list.get(0)
     *     ---------------- row가  몇개 
     *     insert()
     *     update()
     *     delete()
     */
    public static List<MusicVO> musicListData(int cno){
    	return ssf.openSession().selectList("musicListData", cno);
    }
}
