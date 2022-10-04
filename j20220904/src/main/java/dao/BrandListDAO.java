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

import dto.Product_ImgSrcDTO;

public class BrandListDAO {
	private static BrandListDAO instance;

	private BrandListDAO() {
	}

	public static BrandListDAO getInstance() {
		if (instance == null) {
			instance = new BrandListDAO();
		}
		return instance;
	}
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext(); // context쓰면 DBCP
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch(Exception e) { 
			System.out.println(e.getMessage());	
		}
		return conn;
	}
	
	// 상품 사이즈에 맞는 재고를 가져옴
	public int showSize(int product_id, int pd_size) throws SQLException {
		int sizeStock  = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(product_id);
		System.out.println(pd_size);
		String sql = "SELECT stock FROM product_size WHERE product_id = ? AND pd_size = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setInt(2, pd_size);
			rs = pstmt.executeQuery();
			if (rs.next()) sizeStock = rs.getInt(1);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return sizeStock;
	}
	
	public List<Product_ImgSrcDTO> selectCa_code(int ca_code) throws SQLException {
		ArrayList<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "select p.* from product p where p.brand=(select ca_name from category where ca_code=?)";
		ResultSet rs = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ca_code);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product_ImgSrcDTO product_ImgSrcDTO = new Product_ImgSrcDTO();
				product_ImgSrcDTO.setProduct_id(rs.getInt(1));
				product_ImgSrcDTO.setBrand(rs.getString(2));
				product_ImgSrcDTO.setEng_name(rs.getString(3));
				product_ImgSrcDTO.setKor_name(rs.getString(4));
				product_ImgSrcDTO.setGender(rs.getInt(5));
				product_ImgSrcDTO.setPrice(rs.getLong(6));
				product_ImgSrcDTO.setColor(rs.getString(7));
				product_ImgSrcDTO.setRegdate(rs.getDate(8));
				product_ImgSrcDTO.setCa_code(rs.getInt(9));;
				list.add(product_ImgSrcDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if(rs !=null) rs.close();
			if(pstmt != null) pstmt.close();
			if(conn != null) conn.close();
		}
		return list;
	}

	public int getTotalCnt() throws SQLException {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) FROM product";
		int totCnt = 0;
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (stmt != null) stmt.close();
			if (conn != null) conn.close();
		}
		return totCnt;
	}

	public List<Product_ImgSrcDTO> productList(int startRow, int endRow) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "SELECT * \r\n"
				+ "FROM (SELECT rownum rn, a.*\r\n"
				+ "    FROM (select * FROM product) a)\r\n"
				+ "WHERE rn BETWEEN ? and ?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product_ImgSrcDTO pdImgSrcDTO = new Product_ImgSrcDTO();
				pdImgSrcDTO.setProduct_id(rs.getInt("product_id"));
				pdImgSrcDTO.setBrand(rs.getString("brand"));
				pdImgSrcDTO.setEng_name(rs.getString("Eng_name"));
				pdImgSrcDTO.setKor_name(rs.getString("kor_name"));
				pdImgSrcDTO.setGender(rs.getInt("gender"));
				pdImgSrcDTO.setPrice(rs.getLong("price"));
				pdImgSrcDTO.setColor(rs.getString("color"));
				pdImgSrcDTO.setRegdate(rs.getDate("regdate"));
				pdImgSrcDTO.setCa_code(rs.getLong("ca_code"));
				list.add(pdImgSrcDTO);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return list;
	}
	
}
