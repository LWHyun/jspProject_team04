package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.LikeProDTO;

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
	
	// 회원의 찜한 상품 가져오는 메서드
	public List<LikeProDTO> selectLikeProList(String mem_id, int startRow, int endRow) {
		Connection conn = getConnection();
		
		String sql = "select * from (select rownum rn, t.* from "
				+ "            (select l.product_id, l.mem_id, l.like_pro_date, p.brand, p.kor_name, p.price, p.gender, ps.s_file_path "
				+ "            from like_pro l "
				+ "            join product p on l.product_id = p.product_id "
				+ "            join product_image ps on l.product_id = ps.product_id "
				+ "            where l.mem_id = ? "
				+ "            order by 3 desc)t) "
				+ "where rn >= ? and rn <= ?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		List<LikeProDTO> list = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, startRow);			
			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				do {
					LikeProDTO dto = new LikeProDTO();
					dto.setProduct_id(rs.getString("product_id"));
					dto.setMem_id(rs.getString("mem_id"));
					dto.setLike_pro_date(new Date(rs.getDate("like_pro_date").getTime()));
					dto.setBrand(rs.getString("brand"));
					dto.setKor_name(rs.getString("kor_name"));
					dto.setPrice(rs.getInt("price"));
					dto.setGender(rs.getInt("gender"));
					dto.setS_file_path(rs.getString("s_file_path"));
					
					list.add(dto);
				}while(rs.next());
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return list;
	}
	
	// 선택한 찜 상품(들) 삭제하는 메서드
	public int deleteLike(List<LikeProDTO> list) {
		Connection conn = getConnection();
		
		String product_id = "";
		String mem_id = "";
		
		for(int i = 0; i < list.size(); i++) {
			product_id += i==0 ? "'"+list.get(i).getProduct_id()+"'" : ","+"'"+list.get(i).getProduct_id()+"'";
			mem_id += i==0 ? "'"+list.get(i).getMem_id()+"'" : ","+"'"+list.get(i).getMem_id()+"'";
		}
		System.out.println(product_id);
		System.out.println(mem_id);
		
		String sql = String.format("delete from like_pro where product_id in (%s) and mem_id in(%s)", product_id , mem_id);
		System.out.println(sql);
		Statement stmt = null;
		int result = 0;
		try {
			stmt = conn.createStatement();
			
			result = stmt.executeUpdate(sql);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(stmt, conn);
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
