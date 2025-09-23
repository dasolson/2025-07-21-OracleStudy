package com.sist.dao;
import java.util.*;
import java.sql.*;
/*
 *     JDBC 
 *       1. 드라이버 등록
 *          -----
 *           thin : 연결만 담당
 *           oci  : 드라이버 안에 오라클의 모든 데이터를 추가한 다음에 사용
 *                   => 오라클보다 비싸다
 *           Class.forName("Oracle.jdbc.driver.OracleDriver")
 *           => 드라이버는 소프트웨어로 되어있다
 *           => 한번만 연결 : 생성자에서 주로 연결        
 *       2. 오라클 연결
 *           Connection conn = DriverManager.getConnection(URL,usernaem,password)
 *                             ------------- 해당 드라이버를 연결
 *                              => 오라클 : Oracle.jdbc.driver.OracleDriver
 *                              => MySQL : com.mysql.cj.jdbc.Driver
 *       3. 오라클로 SQL 문장 전송
 *           = Statment
 *           = PreparedStatment : SQL 문장 전송
 *             ---------------- 대입하는 데이터를 나중, 동시에 전송
 *                 String name, sex, address, phone;
 *                 int age;
 *                 Statment => sql="INSERT INTO member VALUES('" + name +"','" + sex + "','" + address + "','" + phone +"','" + age + ")"
 *                 PreparedStatment => sql="INSERT INTO member VALUES(?,?,?,?,?)"
 *           = CallableStatment : Procedure 호출    
 *       4. 결과값
 *           = ResultSet rs = ps.executeQuery()
 *                            ----------------- SELECT 
 *           = int count = ps.executeUpdate()
 *                         ------------------ INSERT / UPDATE / DELETE
 *                          => commit포함
 *                          => 정상수행 1. 비정상수행 0
 *           = ResultSet 구조
 *           
 *               SELECT id, name, sex,age, birthday
 *               FROM member; 
 *             ------------------------------------------
 *              id      name     sex     age    birthday
 *             ------------------------------------------
 *        next| aaa     홍길동     남자      20    20/01/01
 *             ------------------------------------------
 *              aaa     홍길동     남자      20    20/01/01
 *               1        2       3        4        5
 *     getString(1)      (2)     (3)   getInt(4) getDate(5)
 *                                                | TO_CHAR
 *                                                | getString()
 *                                      | getDouble(4)          
 *             ------------------------------------------
 *              aaa     홍길동     남자      20    20/01/01
 *             ------------------------------------------
 *    previous| aaa     홍길동     남자      20    20/01/01
 *             ------------------------------------------ | 커서위치   
 *             
 *             rs.close()
 *             ps.close()
 *             conn.close()
 *           ---------------------------------------------------------
 *           SELECT => SQL / VO
 *                     --------
 *                      while / no while
 *                      selecetList  selectOne
 *           INSERT / UPDATE / DELETE => SQL / VO
 *                                       insert() / update() / delete()                                                  
 */
public class TestDAO {
    private Connection conn;
    private PreparedStatement ps;
    // 변경 사항이 없다
    private static final String URL = "jdbc:oracle:thin:@localhost:1521:XE";
    /*
     *     jdbc:업체명:@IP:port:데이터베이스명
     *     jdbc:mysql:@localhost:3306:mydb
     */
    // 각 user당 1개의 DAO를 사용이 가능하게 만든다 => 싱글턴
    public static TestDAO dao;
    
    // 드라이버 등록
    public TestDAO() {
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    		// ojdbc11 => oracle.jdbc.OracleDriver
    	}catch(Exception ex) {}
    }
    // 싱글턴 연결 => Spring : 등록한 모든 클래스(실글턴)
    public static TestDAO newInstance() {
    	if(dao == null)
    		dao = new TestDAO();
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
    public List<String> foodFindData(String type, String fd){
    	// 주소 검색 / 음식종류 검색 / 업체명 검색
    	List<String> list = new ArrayList<String>();
    	try {
    		// 연결
    		getConnection();
    	    // SQL문장
    		String sql = "SELECT name "
    				   +"FROM menupan_food "
    				  // +"WHERE " + type + " LIKE '%'||?||'%'";
    				   +"WHERE REGEXP_LIKE("+type+",?)";
    		// ----------------------------------------------
    		//                              LIKE CONCAT('%',?,'%') MySQL / MariaDB
    		// 오라클 전송
    		ps = conn.prepareStatement(sql);
    		// 필요한 데이터 첨부
    		ps.setString(1, fd);    		
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


























