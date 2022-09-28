package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewBoardDAO {
	// 싱글톤
	private static ReviewBoardDAO instance;
	
	// 생성자
	private ReviewBoardDAO() {}
	
	// getInstance 수행 시 생성자 만들어줌
	public static ReviewBoardDAO getInstance() {
		if(instance == null) {
			instance = new ReviewBoardDAO();
		}
		return instance;
	}
	
	// DBCP
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) 
					ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return conn;
	}
	
	
	
	private void close(AutoCloseable... ac) {
		try {
			for(AutoCloseable a : ac) {
				if(a != null) {
					a.close();
				}
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
