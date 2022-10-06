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
	
	/* DBCP */
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
	
	
	// [ALL] 공지사항 한 페이지 데이터 가져오기
	public List<NoticeDTO> noticeList(int startRow, int endRow) throws SQLException {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		Connection conn = null;	
		PreparedStatement pstmt= null;
		ResultSet rs = null;

		String sql = "SELECT * FROM (SELECT rownum rn, a.*  "
		 		    + "             FROM(select * from notice order by notice_date desc) a ) "
		 		    + "WHERE rn BETWEEN ? AND ? " ;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				NoticeDTO notice = new NoticeDTO();
				
				notice.setNotice_code(rs.getInt("notice_code"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_content(rs.getString("notice_content"));
				
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
	
	/* [관리자] 게시글 작성 메소드 */
	public int insert(NoticeDTO notice) throws SQLException {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		ResultSet rs = null;
		
		String sql1  = "SELECT NVL(max(notice_code), 0) FROM notice";
		String sql  = "INSERT INTO notice VALUES(?,?,sysdate,?)";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql1);
			rs = pstmt.executeQuery();
			rs.next();
			
			// 새로 작성된 글의 notice_code : 마지막 글의 notice_code +1 
			int newNoticeCode = rs.getInt(1) + 1;
			rs.close();
			pstmt.close();
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, newNoticeCode);
			pstmt.setString(2, notice.getNotice_title());
			pstmt.setString(3, notice.getNotice_content());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
	}
	
	/* 게시글 Read 메소드 */
	public NoticeDTO select(int notice_code) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		String sql = "SELECT * FROM notice where notice_code=" + notice_code;
		
		NoticeDTO notice = new NoticeDTO();
		
		try {
			conn = getConnection(); 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {				
				notice.setNotice_code(rs.getInt("notice_code"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_content(rs.getString("notice_content"));
			}
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null)    rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null)  conn.close();
		}
		return notice;
	}

	/* [회원] 게시글 Read -> 이전글 이후글 제목 포함 메소드 */
	public NoticeDTO selectBeforeAfter(int notice_code) throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;
		// notice_code, notice_title , notice_content
	    // , notice_bef_aft(notice_code,1) notice_title_before 
	   //  , notice_bef_aft(notice_code,2) notice_title_after 
		String sql  = " SELECT notice_code, notice_title , notice_date, notice_content, "
					+ " notice_title_bef_aft(notice_code,1) notice_title_before, notice_title_bef_aft(notice_code,2) notice_title_after, "
					+ " notice_date_bef_aft(notice_code,1) notice_date_before,   notice_date_bef_aft(notice_code,2)  notice_date_after"
			    	+ " FROM notice  where notice_code=" + notice_code;
		
		NoticeDTO notice = new NoticeDTO();
		
		try {
			conn = getConnection(); 
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {				
				notice.setNotice_code(rs.getInt("notice_code"));
				notice.setNotice_title(rs.getString("notice_title"));
				notice.setNotice_date(rs.getDate("notice_date"));
				notice.setNotice_content(rs.getString("notice_content"));
				
				// 이전 글 · 다음 글
				notice.setNotice_title_before(rs.getString("notice_title_before"));
				notice.setNotice_title_after(rs.getString("notice_title_after"));
				notice.setNotice_date_before(rs.getDate("notice_date_before"));
				notice.setNotice_date_after(rs.getDate("notice_date_after"));
				
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

	/* [관리자] 게시글 수정 메소드 */
	public int notice_update(NoticeDTO notice) throws SQLException {
		Connection conn = null;	
		PreparedStatement pstmt= null; 
		int result = 0;			
		String sql="UPDATE notice SET notice_title=?, notice_content=? WHERE notice_code=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, notice.getNotice_title());
			pstmt.setString(2, notice.getNotice_content());
			pstmt.setInt(3, notice.getNotice_code());
			
			result = pstmt.executeUpdate();
			
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
	}
	
	/* [관리자] 게시글 삭제 메소드 */
	public int delete(int notice_code) throws SQLException {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		String sql  = "DELETE FROM notice WHERE notice_code=?";
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, notice_code);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn !=null)   conn.close();
		}
		return result;
	}

	// 총 갯수 반환 메소드
	public int getTotalCnt() throws SQLException {
		Connection conn = null;	
		Statement stmt= null; 
		ResultSet rs = null;    
		int tot = 0;
		String sql = "SELECT count(*) FROM notice";
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) tot = rs.getInt(1);
		} catch(Exception e) {	
			System.out.println(e.getMessage()); 
		} finally {
			if (rs !=null) rs.close();
			if (stmt != null) stmt.close();
			if (conn !=null) conn.close();
		}
		return tot;
	}
	
}