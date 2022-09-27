package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.NoticeDTO;

public class NoticeDAO {
	private static NoticeDAO instance;
	private NoticeDAO() {}
	public static NoticeDAO getInstance() {
		if (instance == null) {	
			instance = new NoticeDAO();		
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
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	
	
	// 페이징 메소드
	public List<NoticeDTO> noticeList(int startRow, int endRow) throws SQLException {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;
		// String sql = "select * from notice order by num desc";
		 String sql = "SELECT *  "
		 	    	+ "FROM (Select rownum rn ,a.*  "
		 		    + "      From 	 (select * from notice order by ref desc,re_step) a ) "
		 		    + "WHERE rn BETWEEN ? AND ? " ;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				notice.setNum(rs.getInt("num"));
				notice.setReadcount(rs.getInt("readcount"));
				notice.setRef(rs.getInt("ref"));
				notice.setRe_level(rs.getInt("re_level"));
				notice.setRe_step(rs.getInt("re_step"));
				notice.setReg_date(rs.getDate("reg_date"));
				
				list.add(notice);
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn !=null) conn.close();
		} 
		return list;
	}
	
	public NoticeDTO select(int num) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		String sql = "select * from notice where num="+num;
		NoticeDTO notice = new NoticeDTO();
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {				
				notice.setNum(rs.getInt("num"));
				notice.setContent(rs.getString("content"));
				notice.setReadcount(rs.getInt("readcount"));
				notice.setReg_date(rs.getDate("reg_date"));
				notice.setRef(rs.getInt("ref"));
				notice.setRe_level(rs.getInt("re_level"));
				notice.setRe_step(rs.getInt("re_step"));
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return notice;
	}
}