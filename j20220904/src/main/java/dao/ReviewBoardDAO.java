package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ReviewBoardDAO {
	
	private static ReviewBoardDAO instance;
	
	private ReviewBoardDAO() {}
	
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
	
}
