package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class LikeProDAO {
	private static LikeProDAO instance;
	
	private LikeProDAO() {}
	
	public static LikeProDAO getInstance() {
		if(instance == null) {
			instance = new LikeProDAO();
		}
		
		return instance;
	}
	
	// DBCP
	public Connection getConnection() {
		Connection conn = null;
		
		try {
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}
	
	// 회원의 찜한 상품 갯수 가져오는 메서드
	public int memLikeProCnt(String mem_id) {
		Connection conn = getConnection();
		
		String sql = "select count(*) from like_pro where mem_id=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int likeCnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) likeCnt = rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return likeCnt;
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
