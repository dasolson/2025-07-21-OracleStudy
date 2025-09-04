package com.sist.dao;
import java.sql.*;
public class CreateDataBase {
    private Connection conn;
    private PreparedStatement ps;
    private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
    
    public CreateDataBase() {
    	try {
    		Class.forName("oracle.jdbc.driver.OracleDriver");
    	}catch(Exception ex ) {}
    }
    
    public Connection grtConnection() {
    	try {
    		conn=DriverManager.getConnection(URL, "hr","happy");
    	}catch(Exception ex ) {}
    	  
    	return conn;
    }
    
    public void disConnection() {
    	
    }
}
