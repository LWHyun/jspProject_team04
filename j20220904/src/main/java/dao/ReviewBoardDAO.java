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

import dto.ReviewBoardDTO;

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
	
	// 총 개수
	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from review_board";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(rs, stmt, conn);
		}
		return tot;
	}
	
	public List<ReviewBoardDTO> reviewBoardList(int startRow, int endRow) {
		List<ReviewBoardDTO> reviewList = new ArrayList<ReviewBoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT *  "
	 	    	+ "FROM (Select rownum rn ,a.*  "
	 		    + "      From 	 (select * from review_board order by rb_date desc) a ) "
	 		    + "WHERE rn BETWEEN ? AND ? " ;
		
		System.out.println("DAO reviewBoardList sql->"+sql);
		System.out.println("DAO reviewBoardList startRow->"+startRow);
		System.out.println("DAO reviewBoardList endRow->"+endRow);
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewBoardDTO reviewBoard = new ReviewBoardDTO();
				System.out.println("DAO reviewBoardList rb_title->"+rs.getString("rb_title"));
				
				reviewBoard.setRb_id(rs.getInt("rb_id"));
				reviewBoard.setMem_id(rs.getString("mem_id"));
				reviewBoard.setProduct_id(rs.getInt("product_id"));
				reviewBoard.setRb_total(rs.getInt("rb_total"));
				reviewBoard.setRb_size(rs.getInt("rb_size"));
				reviewBoard.setRb_color(rs.getInt("rb_color"));
				reviewBoard.setRb_wide(rs.getInt("rb_wide"));
				reviewBoard.setRb_instep(rs.getInt("rb_instep"));
				reviewBoard.setRb_title(rs.getString("rb_title"));
				reviewBoard.setRb_content(rs.getString("rb_content"));
				reviewBoard.setRb_img(rs.getString("rb_img"));
				reviewBoard.setRb_date(rs.getDate("rb_date"));
				reviewBoard.setRb_views(rs.getInt("rb_views"));
				reviewList.add(reviewBoard);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		return reviewList;
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
