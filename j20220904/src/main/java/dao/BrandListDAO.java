package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	

//	public int getTotalCnt(int ca_code, String brand, int product_id) throws SQLException {
//		int totCnt = 0;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		String sql = "SELECT count(*)\r\n"
//				+ "FROM category c, product_image m, product p \r\n"
//				+ "WHERE c.ca_code=? \r\n"
//				+ "AND m.s_file_path LIKE '%?%'\r\n"
//				+ "AND p.product_id=?";
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, ca_code);
//			pstmt.setString(2, brand);
//			pstmt.setInt(3, product_id);
//			rs = pstmt.executeQuery();
//			if (rs.next()) {
//				totCnt = rs.getInt(1);
//			}
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//		} finally {
//			if (rs != null) rs.close();
//			if (pstmt != null) pstmt.close();
//			if (conn != null) conn.close();
//		}
//		return totCnt;
//	}

//	public List<Product_ImgSrcDTO> selectCa_code(int ca_code) throws SQLException {
//		ArrayList<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		String sql = "select p.* from product p where p.brand=(select ca_name from category where ca_code=?)";
//		ResultSet rs = null;
//		
//		try {
//			conn = getConnection();
//			pstmt = conn.prepareStatement(sql);
//			pstmt.setInt(1, ca_code);
//			
//			rs = pstmt.executeQuery();
//			while (rs.next()) {
//				Product_ImgSrcDTO product_ImgSrcDTO = new Product_ImgSrcDTO();
//				product_ImgSrcDTO.setProduct_id(rs.getInt(1));
//				product_ImgSrcDTO.setBrand(rs.getString(2));
//				product_ImgSrcDTO.setEng_name(rs.getString(3));
//				product_ImgSrcDTO.setKor_name(rs.getString(4));
//				product_ImgSrcDTO.setGender(rs.getInt(5));
//				product_ImgSrcDTO.setPrice(rs.getLong(6));
//				product_ImgSrcDTO.setColor(rs.getString(7));
//				product_ImgSrcDTO.setRegdate(rs.getDate(8));
//				product_ImgSrcDTO.setCa_code(rs.getInt(9));;
//				list.add(product_ImgSrcDTO);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			if(rs !=null) rs.close();
//			if(pstmt != null) pstmt.close();
//			if(conn != null) conn.close();
//		}
//		return list;
//	}
	
	// 브랜드에 해당하는 상품정보만 나오는 메소드
	public List<Product_ImgSrcDTO> productList(int ca_code) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
//		String sql = "SELECT * \r\n"
//				+ "FROM (SELECT rownum rn, a.*\r\n"
//				+ "FROM (SELECT  *\r\n"
//				+ "    FROM product p\r\n"
//				+ "        FULL OUTER JOIN product_image m\r\n"
//				+ "        USING (product_id)\r\n"
//				+ "        WHERE p.brand = (SELECT ca_name FROM category WHERE ca_code=?)) a)\r\n"
//				+ "WHERE rn BETWEEN ? and ?";
		String sql = "SELECT  *\r\n"
				+ "FROM product p\r\n"
				+ "FULL OUTER JOIN product_image m\r\n"
				+ "USING (product_id)\r\n"
				+ "WHERE p.brand = (SELECT ca_name FROM category WHERE ca_code=?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ca_code);
//			pstmt.setInt(2, startRow);
//			pstmt.setInt(3, endRow);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product_ImgSrcDTO pdImgSrcDTO = new Product_ImgSrcDTO();
				pdImgSrcDTO.setProduct_id(rs.getInt("product_id"));
				pdImgSrcDTO.setEng_name(rs.getString("Eng_name"));
				pdImgSrcDTO.setKor_name(rs.getString("kor_name"));
				pdImgSrcDTO.setGender(rs.getInt("gender"));
				pdImgSrcDTO.setPrice(rs.getLong("price"));
				pdImgSrcDTO.setColor(rs.getString("color"));
				pdImgSrcDTO.setRegdate(rs.getDate("regdate"));
				pdImgSrcDTO.setCa_code(rs.getLong("ca_code"));
				pdImgSrcDTO.setS_file_path(rs.getString("s_file_path"));
				pdImgSrcDTO.setL_file_path(rs.getString("l_file_path"));
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

	public String selectBrandName(int ca_code) throws SQLException {
		Connection conn = null;
		String sql = "SELECT ca_name FROM category WHERE ca_code=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String ca_name = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ca_code);
			rs = pstmt.executeQuery();
			if (rs.next()) ca_name = rs.getString(1);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return ca_name;
	}
	
	// 찜 조회
	
	
	// 찜 등록
	public int registerLike(int product_id, String mem_id) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "INSERT INTO like_pro VALUES(?, ?, sysdate)";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setString(2, mem_id);
			result = pstmt.executeUpdate();
			System.out.println("result -> " + result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	// 찜 삭제
	public int removeLike(int product_id, String mem_id) throws SQLException {
		int result = 0;
		Connection conn = null;
		String sql = "DELETE FROM like_pro WHERE product_id=? AND mem_id=?";
		PreparedStatement pstmt = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setString(2, mem_id);
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return result;
	}
	
	
	
}
