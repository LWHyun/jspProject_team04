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
	
	// 리뷰 게시판 게시물 총 개수
	public int getTotalRBCnt() throws SQLException {
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
	
	// Q&A 게시판 게시물 총 개수
	public int getQATotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from qa_board";
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
				reviewBoard.setRb_title(rs.getString("rb_title"));
				reviewBoard.setRb_content(rs.getString("rb_content"));
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
	
	// 게시글 1개 선택
	public ReviewBoardDTO select(int rb_id) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from review_board where rb_id=" + rb_id;
		
		ReviewBoardDTO reviewBoard = new ReviewBoardDTO();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				reviewBoard.setRb_id(rs.getInt("rb_id"));
				reviewBoard.setMem_id(rs.getString("mem_id"));
				reviewBoard.setProduct_id(rs.getInt("product_id"));
				reviewBoard.setRb_title(rs.getString("rb_title"));
				reviewBoard.setRb_content(rs.getString("rb_content"));
				reviewBoard.setRb_date(rs.getDate("rb_date"));
				reviewBoard.setRb_views(rs.getInt("rb_views"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		} finally {
			close(rs, stmt, conn);
		}
		return reviewBoard;			
	}

	
	// 조회수 증가
	public void readCount(int rb_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update review_board set rb_views=rb_views+1 where rb_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rb_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
	}

	
	// 게시물 작성
	public int insert(ReviewBoardDTO reviewBoard) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		
		String sql1  = "SELECT NVL(max(rb_id), 0) FROM review_board";
		String sql  = "INSERT INTO review_board VALUES(?,?,?,?,?,?,sysdate,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			
			// 새로 작성된 글의 rb_id : 마지막 글의 rb_id + 1
			int newRbId = rs.getInt(1)+ 1;
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newRbId);
			pstmt.setString(2, reviewBoard.getMem_id());
			pstmt.setInt(3, reviewBoard.getProduct_id());
			pstmt.setString(4, reviewBoard.getRb_title());
			pstmt.setString(5, reviewBoard.getRb_content());
			pstmt.setInt(7, reviewBoard.getRb_views());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(pstmt , conn);
		}
		
		return result;
	}
	
	public int update(ReviewBoardDTO reviewBoard) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;	
		String sql="UPDATE review_board SET rb_title=?, rb_content=?, rb_date=sysdate  WHERE rb_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, reviewBoard.getRb_title());
			pstmt.setString(2, reviewBoard.getRb_content());
			pstmt.setInt(3, reviewBoard.getRb_id());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
	}
	
	// 삭제
	public int delete(int rb_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "DELETE FROM review_board WHERE rb_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rb_id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
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
