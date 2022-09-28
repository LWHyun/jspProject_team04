package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class SizeDAO {
	private static SizeDAO instance;

	private SizeDAO() {
	}

	public static SizeDAO getInstance() {
		if (instance == null) {
			instance = new SizeDAO();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext(); // context쓰면 DBCP
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	
	public int showSize(int product_id, int pd_size) throws SQLException {
		int sizeStock  = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(product_id);
		System.out.println(pd_size);
		String sql = "SELECT stock FROM product_size WHERE product_id = ? AND pd_size = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setInt(2, pd_size);
			rs = pstmt.executeQuery();
			if (rs.next()) sizeStock = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return sizeStock;
	}
	
}
