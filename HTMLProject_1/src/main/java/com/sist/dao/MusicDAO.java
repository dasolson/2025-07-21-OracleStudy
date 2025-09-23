package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class MusicDAO {
	private Connection conn;
    private PreparedStatement ps;
    // 변경 사항이 없다
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    /*
     *     jdbc:업체명:@IP:port:데이터베이스명
     *     jdbc:mysql:@localhost:3306:mydb
     */
    // 각 user당 1개의 DAO를 사용이 가능하게 만든다 => 싱글턴
    public static MusicDAO dao;
    
    // 드라이버 등록
    public MusicDAO() {
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		// ojdbc11 => oracle.jdbc.OracleDriver
    	}catch(Exception ex) {}
    }
    // 싱글턴 연결 => Spring : 등록한 모든 클래스(실글턴)
    public static MusicDAO newInstance() {
    	if(dao == null)
    		dao = new MusicDAO();
    	return dao;
    }
    
    // 연결
    public void getConnection() {
    	try {
    		conn = DriverManager.getConnection(URL,"hr","happy");
    	}catch(Exception ex) {}
    }
    // 해제
    public void disConnection() {
    	try {
    		if(ps != null) ps.close(); // 송수신
    		if(conn != null) conn.close(); //전화
    	}catch(Exception ex) {}
    }
    /////// => 모든 DAO의 공통 사항
    // 기능별 처리
    /*
     *     인덱스를 이용해서 검색 => 가급적이면 페이지 처리 권장
     *                                 --------
     *                                 rownum : 가상 컬럼
     *                                 => 경우에 따라 변경이 가능
     */
    public List<String> MusicListData(int cno){
    	// 주소 검색 / 음식종류 검색 / 업체명 검색
    	List<String> list = new ArrayList<String>();
    	try {
    		// 연결
    		getConnection();
    	    // SQL문장
    		String sql ="SELECT title "
    				   +"FROM genie_music "
    				   +"WHERE con="+ cno 
    				   +" ORDER BY no ASC";
    				  // +"WHERE " + type + " LIKE '%'||?||'%'";
    				   //+"WHERE REGEXP_LIKE("+type+",?)";
    		// ----------------------------------------------
    		//                              LIKE CONCAT('%',?,'%') MySQL / MariaDB
    		// 오라클 전송
    		ps = conn.prepareStatement(sql);
    		// 필요한 데이터 첨부
    		//ps.setString(1, fd);    		
    		// 결과값 
    		ResultSet rs = ps.executeQuery();
    		// List에 채운다
    		while(rs.next()) {
    			list.add(rs.getString(1));
    		}
    		// 오라클은 0(x), 1번부터 시작
    		// ResultSet 닫기
    		rs.close();
    	}catch(Exception ex) {
    		//오류 확인
    		ex.printStackTrace();
    	}finally {
    		// 해제
    		disConnection();
    	}
    	return list;
    }
}
