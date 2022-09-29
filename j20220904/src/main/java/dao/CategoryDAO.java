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

import dto.ProductDTO;

public class CategoryDAO {
	private static CategoryDAO instance;
	private CategoryDAO() {
		//기본생성자
	}
	//싱글톤
	public static CategoryDAO getInstance() {
		if(instance ==null) {
			instance = new CategoryDAO();
		}
		return instance;
	}
	//연결
	private Connection getConnection() {
		Connection conn =null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage()); 
		}
		return conn;
	}
	
	public List<ProductDTO> selectSearch(String searchBar) throws SQLException {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product where brand like '%"+searchBar+"%' or ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
			try {
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					ProductDTO productDTO = new ProductDTO();
					productDTO.setProduct_id(rs.getInt("product_id"));
					productDTO.setBrand(rs.getString("brand"));
					productDTO.setEng_name(rs.getString("eng_name"));
					productDTO.setKor_name(rs.getString("kor_name"));
					productDTO.setGender(rs.getInt("gender"));
					productDTO.setPrice(rs.getInt("price"));
					productDTO.setColor(rs.getString("color"));
					productDTO.setRegdate(rs.getDate("regdate"));
					productDTO.setCa_code(rs.getInt("ca_code"));
					list.add(productDTO);
			} 
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(stmt != null)stmt.close();
			if(conn != null)conn.close();
		}
			
		
		
		return list;
	}

	public List<ProductDTO> selectSearch(int gender) throws SQLException {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product where gender=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gender);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO productDTO = new ProductDTO();
					productDTO.setProduct_id(rs.getInt("product_id"));
					productDTO.setBrand(rs.getString("brand"));
					productDTO.setEng_name(rs.getString("eng_name"));
					productDTO.setKor_name(rs.getString("kor_name"));
					productDTO.setGender(rs.getInt("gender"));
					productDTO.setPrice(rs.getInt("price"));
					productDTO.setColor(rs.getString("color"));
					productDTO.setRegdate(rs.getDate("regdate"));
					productDTO.setCa_code(rs.getInt("ca_code"));
					list.add(productDTO);
			} 
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
			
		return list;
	}
	
	public List<ProductDTO> selectSearch(String[] brandArray, String[] sizeArray) throws SQLException {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product where brand='";
		String sql1 = "select * from product p, product_size ps where p.product_id = ps.product_id and \"size\"=";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		for(int i=0; i<brandArray.length;i++) {
			sql+=brandArray[i]+"'";
			System.out.println(sql);
			if(i<brandArray.length-1) {
				sql+=" or brand='";
			}
		}
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProduct_id(rs.getInt("product_id"));
				productDTO.setBrand(rs.getString("brand"));
				productDTO.setEng_name(rs.getString("eng_name"));
				productDTO.setKor_name(rs.getString("kor_name"));
				productDTO.setGender(rs.getInt("gender"));
				productDTO.setPrice(rs.getInt("price"));
				productDTO.setColor(rs.getString("color"));
				productDTO.setRegdate(rs.getDate("regdate"));
				productDTO.setCa_code(rs.getInt("ca_code"));
				list.add(productDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(stmt != null)stmt.close();
			if(conn != null)conn.close();
		}
		
		
		
		
		System.out.println("result1->"+sql);
		/*
		 * if(sizeArray.length >0) { sql+=" and "; for(int i=0; i<sizeArray.length;i++)
		 * { sql1 } }
		 */
		System.out.println("result2->"+sql);
		
		
		return list;
		

	}
	public int select(String searchWord) throws SQLException {
		String sql = "select sc_word from searchclick where sc_word=?";
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return result;
	}
	public int update(String searchWord) throws SQLException {
		String sql = "update searchclick set sc_count = sc_count+1 where sc_word=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateResult = 0;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			updateResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		
		return updateResult;
	}
	public int insert(String searchWord) throws SQLException {
		int insertResult = 0;
		String sql = "insert into searchclick values(?,0,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			insertResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return insertResult;
	}
	
	
	
}
