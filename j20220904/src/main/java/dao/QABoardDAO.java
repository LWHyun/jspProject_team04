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
	
	// 총 개수
	public int getTotalCnt() throws SQLException {
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
	
	public List<QABoardDTO> qABoardList(int startRow, int endRow) {
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