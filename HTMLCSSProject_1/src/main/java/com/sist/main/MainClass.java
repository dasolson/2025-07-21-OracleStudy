package com.sist.main;
import java.util.*;
import com.sist.dao.*;
import com.sist.vo.*;
public class MainClass {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
        MusicDAO dao = MusicDAO.newInstance();
        List<MusicVO> list = dao.musicListData(1);
        for(MusicVO vo:list) {
        	System.out.println(vo.getNo() + "." + vo.getTitle());
        }
        
        System.out.println("---------------------------------");
        list = MusicDAO2.musicListData(1);
        for(MusicVO vo:list) {
        	System.out.println(vo.getNo() + "." + vo.getTitle());
        }
	}

}
