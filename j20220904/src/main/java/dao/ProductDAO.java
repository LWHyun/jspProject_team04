package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;


import dto.ProductDTO;
import dto.Product_ImgDTO;
import dto.Product_ImgSrcDTO;
import dto.Product_Like_ProDTO;

public class ProductDAO {
	private static ProductDAO instance;
	
	 
	//외부에서 접근 못하게 private로 기본생성자 생성
	private ProductDAO() {
		
	}
	
	public static ProductDAO getInstance()	{
		if(instance == null) {
			instance = new ProductDAO();
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
	
	//상품테이블,상품이미지테이블 상세 정보 다 가져오는 메서드 
	public List<Product_ImgSrcDTO> selectImg(int product_id) throws SQLException {
		String sql = "select * from product p , product_image i where p.product_id = i.product_id";
		PreparedStatement pstmt = null;
		Connection conn = this.getConnection();
		ResultSet rs = null;
		
		
		List<Product_ImgSrcDTO> list = new ArrayList<>();
		//Product_ImgSrcDTO pro = new Product_ImgSrcDTO();
		
		try {	
				
				pstmt = conn.prepareStatement(sql);
				
				
				rs = pstmt.executeQuery();
				System.out.println("오냐?");
				while(rs.next()) {
					
					/*
					 * Product_ImgDTO p = new Product_ImgDTO(); ProductDTO productDTO = new
					 * ProductDTO();
					 */
					
					Product_ImgSrcDTO pro = new Product_ImgSrcDTO();
				
					
					/*
					 * p.setPro_image(rs.getInt("pro_image_id"));
					 * p.setProduct_id(rs.getInt("product_id"));
					 */
					pro.setS_file_path(rs.getString("s_file_path"));
					pro.setL_file_path(rs.getString("l_file_path"));
					
					pro.setProduct_id(rs.getInt("product_id"));
					pro.setBrand(rs.getString("brand"));
					pro.setEng_name(rs.getString("eng_name"));
					pro.setKor_name(rs.getString("kor_name"));
					pro.setGender(rs.getInt("gender"));
					pro.setPrice(rs.getLong("price"));
					pro.setColor(rs.getString("color"));
					pro.setRegdate(rs.getDate("regdate"));
					pro.setCa_code(rs.getLong("ca_code"));
					
				
					
					list.add(pro); 
					
					System.out.println("list=>"+ list);
					
				}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	
	//찜한제품 insert 하는 메서드
	public int insertLike(int product_id,String mem_id) throws SQLException {
		PreparedStatement pstmt = null;
		Connection conn = this.getConnection();
		String sql = "insert into like_pro values(?,?,sysdate)";
		
		int result = 0;
		
		
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,product_id);
			pstmt.setString(2,mem_id);
		
			
			result =pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();	
		}finally {
			close(pstmt,conn);
		}
		return result;
	}
	
	
	
	//찜한제품 delete 하는 메서드
	public int deleteLike(int product_id,String mem_id) throws SQLException {
		PreparedStatement pstmt = null;
		Connection conn = this.getConnection();
		String sql = "delete from like_pro where product_id=? and mem_id=?";
		
		int result = 0;
		
		
		try {
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,product_id);
			pstmt.setString(2,mem_id);
		
			
			result =pstmt.executeUpdate();
			
			
		}catch(Exception e) {
			e.printStackTrace();	
		}finally {
			close(pstmt,conn);
		}
		return result;
	}
	
	
	//찜한제품에 대한 상품select 하는 메서드
	public List<ProductDTO> selectLike(int product_id,String mem_id) throws SQLException{
		
		String sql = "select * from product p, like_pro l where p.product_id = l.product_id";
		
		PreparedStatement pstmt = null;
		Connection conn = this.getConnection();
		ResultSet rs = null;
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				
				productDTO.setProduct_id(rs.getInt("product_id"));
				productDTO.setBrand(rs.getString("brand"));
				productDTO.setEng_name(rs.getString("eng_name"));
				productDTO.setKor_name(rs.getString("kor_name"));
				productDTO.setGender(rs.getInt("gender"));
				productDTO.setPrice(rs.getLong("price"));
				productDTO.setColor(rs.getString("color"));
				productDTO.setRegdate(rs.getDate("regdate"));
				productDTO.setCa_code(rs.getLong("ca_code"));
				
				list.add(productDTO);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(rs,pstmt,conn);
		}
		
		return list;
		
	}
	
	//찜한제품 총갯수 구하는 메서드
	public int selectCountLike(int product_id,String mem_id) throws SQLException {
		
		String sql = "select count(*) from like_pro where product_id=? and mem_id=?";
		PreparedStatement pstmt = null;
		Connection conn = this.getConnection();
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			pstmt.setInt(1, product_id);
			pstmt.setString(2, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result=rs.getInt(1);
			}
			
		}catch(Exception e) {
			
		}finally {
			close(rs,pstmt,conn);
		}
		return result;
		
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
	
}
