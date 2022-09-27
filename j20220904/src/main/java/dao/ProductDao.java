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
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.ProductDTO;

public class ProductDao {
	private static ProductDao instance;
	
	 
	//외부에서 접근 못하게 private로 기본생성자 생성
	private ProductDao() {
		
	}
	
	public static ProductDao getInstance()	{
		if(instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}
	
	
	private Connection getConnection() throws SQLException	{
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
		}catch(NamingException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
		
	
	//close하는 메서드
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
	
	
}
