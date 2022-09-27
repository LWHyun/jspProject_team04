package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

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
	
	public int showSize(int product_id, int size, int stock) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT s.product_id, s.stock, s.\"size\" \r\n"
				+ "FROM product_size s, product p\r\n"
				+ "WHERE s.product_id = p.product_id";
		int sizeStock  = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				sizeStock = rs.getInt(2); // 재고 수량
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
		return sizeStock;
	}
	
}
