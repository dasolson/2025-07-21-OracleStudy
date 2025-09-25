package com.sist.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sist.vo.BoardDTO;

public class BoardDAO {
	private Connection conn;
    private PreparedStatement ps;
    // 변경 사항이 없다
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    /*
     *     jdbc:업체명:@IP:port:데이터베이스명
     *     jdbc:mysql:@localhost:3306:mydb
     */
    // 각 user당 1개의 DAO를 사용이 가능하게 만든다 => 싱글턴
    public static BoardDAO dao;
    
    // 드라이버 등록
    public BoardDAO() {
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		// ojdbc11 => oracle.jdbc.OracleDriver
    	}catch(Exception ex) {}
    }
    // 싱글턴 연결 => Spring : 등록한 모든 클래스(실글턴)
    public static BoardDAO newInstance() {
    	if(dao == null)
    		dao = new BoardDAO();
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
    
    //기능
    // 목록 => 페이징
    public List<BoardDTO> boardListData(int page){
    	List<BoardDTO> list = new ArrayList<BoardDTO>();
    	try{
    		//연결
    		getConnection();
    		// SQL문장
    		String sql = "SELECT no, subject, name, TO_CHAR(regdate,'YYYY-MM-DD'),hit "
    				   + "FROM web_board "
    				   + "ORDER BY no DESC "
    				   + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
    		           // LIMIT 1,10
    		int rowSize = 10;
    		int strat = (rowSize*page)-rowSize;
    		ps = conn.prepareStatement(sql);
    		ps.setInt(1, strat);
    		// 결과값
    		ResultSet rs = ps.executeQuery();
    		while(rs.next()) {
    			BoardDTO vo = new BoardDTO();
    			vo.setNo(rs.getInt(1));
    			vo.setSubject(rs.getString(2));
    			vo.setName(rs.getString(3));
    			vo.setDbday(rs.getString(4));
    			vo.setHit(rs.getInt(5));
    			list.add(vo);
    		}
    		rs.close();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally {
    		disConnection();
    	}
    	return list;
    }
    // 총페이지
    public int boardTotalPage() {
    	int total = 0;
    	try {
    		getConnection();
    		String sql = "SELECT CEIL (COUNT(*)/10.0) "
    				   + "FROM web_board";
    		ps = conn.prepareStatement(sql);
    		ResultSet rs = ps.executeQuery();
    		rs.next();
    		total = rs.getInt(1);
    		rs.close();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally {
    		disConnection();
    	}
    	return total;
    }
    // 새글 => INSERT
    public void boardInsert(BoardDTO vo) {
    	try {
    		getConnection();
    		String sql = "INSERT INTO web_board(no, name, subject, content, pwd) "
    				    + "VALUES(wb_no_seq.nextval,?,?,?,?)";
    		ps = conn.prepareStatement(sql);
    		ps.setString(1, vo.getName());
    		ps.setString(2, vo.getSubject());
    		ps.setString(3, vo.getContent());
    		ps.setString(4, vo.getPwd());
    		
    		ps.executeUpdate();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally {
    		disConnection();
    	}
    }
    // 상세보기 => 조회수 증가
    public BoardDTO boaardDetailData(int no) {
    	BoardDTO vo = new BoardDTO();
    	try {
    		getConnection();
    		//SQL=>hit를 증가
    		String sql = "UPDATE web_board SET "
    				   + "hit=hit+1 "
    				   + "WHERE no=?";
    		ps = conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		//실행
    		ps.executeUpdate();
    		
    		sql ="SELECT no, name, subject, content, hit, "
    				+"TO_CHAR(regdate,'YYYY-MM-DD hh24:mi:ss') "
    				+"FROM web_board "
    				+"WHERE no=?";
    		ps = conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		
    		ResultSet rs = ps.executeQuery();
    		rs.next();
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));
    		vo.setHit(rs.getInt(5));
    		vo.setDbday(rs.getString(6));
    		rs.close();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally {
    		disConnection();
    	}
    	return vo;
    }
    // 수정 => hidden 비밀번호 검색
    public BoardDTO boaardUpdateData(int no) {
    	BoardDTO vo = new BoardDTO();
    	try {
    		getConnection();
    		//SQL=>hit를 증가
    		String sql ="SELECT no, name, subject, content "    				
    				+"FROM web_board "
    				+"WHERE no=?";
    		ps = conn.prepareStatement(sql);
    		ps.setInt(1, no);
    		
    		ResultSet rs = ps.executeQuery();
    		rs.next();
    		vo.setNo(rs.getInt(1));
    		vo.setName(rs.getString(2));
    		vo.setSubject(rs.getString(3));
    		vo.setContent(rs.getString(4));    		
    		rs.close();
    	}catch(Exception ex) {
    		ex.printStackTrace();
    	}finally {
    		disConnection();
    	}
    	return vo;
    }
    // 삭제 => hidden
    // 검색 => 이름, 제목, 내용
}























