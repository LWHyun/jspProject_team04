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

import dto.QABoardDTO;

public class QABoardDAO { 
	// 싱글톤
	private static QABoardDAO instance;
	
	// 생성자 
	private QABoardDAO() {}
	
	// getInstance 수행 시 생성자 만들어줌
	public static QABoardDAO getInstance() {
		if (instance == null) {
			instance = new QABoardDAO();
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
	
	// Q&A 게시판 게시물 총 개수
	public int getQATotalCnt(int product_id) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from qa_board where product_id =" + product_id;
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
	// 리뷰 게시판 게시물 총 개수
	public int getTotalRBCnt(int product_id) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		int tot = 0;
		String sql = "select count(*) from review_board where product_id =" + product_id;
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
	
	// Q&A 목록 불러오기
	public List<QABoardDTO> qABoardList(int product_id,int startRow, int endRow) {
		List<QABoardDTO> qAList = new ArrayList<QABoardDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT *  "
	 	    	+ "FROM (Select rownum rn ,a.*  "
	 		    + "      From 	 (select * from qa_board where product_id=? order by q_date desc) a ) "
	 		    + "WHERE rn BETWEEN ? AND ? " ;
		
		
		System.out.println("DAO qABoardList sql->"+sql);
		System.out.println("DAO qABoardList startRow->"+startRow);
		System.out.println("DAO qABoardList endRow->"+endRow);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QABoardDTO qABoard = new QABoardDTO();
				
				qABoard.setQ_id(rs.getInt("q_id"));
				qABoard.setMem_id(rs.getString("mem_id"));
				qABoard.setProduct_id(rs.getInt("product_id"));
				qABoard.setMem_id(rs.getString("mem_id"));
				qABoard.setQ_title(rs.getString("q_title"));
				qABoard.setQ_content(rs.getString("q_content"));
				qABoard.setQ_date(rs.getDate("q_date"));
				qABoard.setQ_views(rs.getInt("q_views"));
				qABoard.setQ_answer(rs.getString("q_answer"));
				qAList.add(qABoard); 
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		} finally {
			close(rs, pstmt, conn);
		}
		return qAList;
	}
	
	// 게시글 1개 선택
	public QABoardDTO select(int q_id) throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from qa_board where q_id=" + q_id;
		
		QABoardDTO qABoard = new QABoardDTO();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				qABoard.setQ_id(rs.getInt("q_id"));
				qABoard.setMem_id(rs.getString("mem_id"));
				qABoard.setProduct_id(rs.getInt("product_id"));
				qABoard.setMem_id(rs.getString("mem_id"));
				qABoard.setQ_title(rs.getString("q_title"));
				qABoard.setQ_content(rs.getString("q_content"));
				qABoard.setQ_date(rs.getDate("q_date"));
				qABoard.setQ_views(rs.getInt("q_views"));
				qABoard.setQ_answer(rs.getString("q_answer"));
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		} finally {
			close(rs, stmt, conn);
		}
		return qABoard;
	}
	
	// 조회수 증가
	public void readCount(int q_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update qa_board set q_views=q_views+1 where q_id=?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(pstmt, conn);
		}
	}
	
	// 게시물 작성
	public int insert(QABoardDTO qABoard) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		
		String sql1  = "SELECT NVL(max(q_id), 0) FROM qa_board";
		String sql  = "INSERT INTO qa_board VALUES(?,?,?,?,?,sysdate,?,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			
			// 새로 작성된 글의 q_id : 마지막 글의 q_id + 1
			int newQId = rs.getInt(1)+ 1;
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newQId);
			pstmt.setString(2, qABoard.getMem_id());
			pstmt.setInt(3, qABoard.getProduct_id());
			pstmt.setString(4, qABoard.getQ_title());
			pstmt.setString(5, qABoard.getQ_content());
			pstmt.setInt(6, qABoard.getQ_views());
			pstmt.setString(7, qABoard.getQ_answer());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(pstmt , conn);
		}
		
		return result;
	}
	
	public int update(QABoardDTO qABoard) throws SQLException {
		
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;	
		String sql="UPDATE qa_board SET q_title=?, q_content=?, q_date=sysdate WHERE q_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, qABoard.getQ_title());
			pstmt.setString(2, qABoard.getQ_content());
			pstmt.setInt(3, qABoard.getQ_id());
			
			
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			close(pstmt, conn);
		}
		return result;
	}
	

	
	// 삭제
	public int delete(int q_id) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql = "DELETE FROM qa_board WHERE q_id=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_id);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(pstmt, conn);
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
	
	
	// (관리자) Q&A 게시물 총 개수 
	public int getQATotal() throws SQLException {
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
	
	// (관리자) Q&A 목록 불러오기
	public List<QABoardDTO> qaList(int startRow, int endRow) {
		List<QABoardDTO> qAList = new ArrayList<QABoardDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT *  "
	 	    	+ "FROM (Select rownum rn ,a.*  "
	 		    + "      From 	 (select * from qa_board order by q_date desc) a ) "
	 		    + "WHERE rn BETWEEN ? AND ? " ;
		
		
		System.out.println("DAO qABoardList sql->"+sql);
		System.out.println("DAO qABoardList startRow->"+startRow);
		System.out.println("DAO qABoardList endRow->"+endRow);
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				QABoardDTO qABoard = new QABoardDTO();
				
				qABoard.setQ_id(rs.getInt("q_id"));
				qABoard.setMem_id(rs.getString("mem_id"));
				qABoard.setProduct_id(rs.getInt("product_id"));
				qABoard.setMem_id(rs.getString("mem_id"));
				qABoard.setQ_title(rs.getString("q_title"));
				qABoard.setQ_content(rs.getString("q_content"));
				qABoard.setQ_date(rs.getDate("q_date"));
				qABoard.setQ_views(rs.getInt("q_views"));
				qABoard.setQ_answer(rs.getString("q_answer"));
				
				qAList.add(qABoard); 
			}
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		} finally {
			close(rs, pstmt, conn);
		}
		return qAList;
	}

	
}