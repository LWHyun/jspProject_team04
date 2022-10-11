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
import dto.Product_Like_ProDTO;

public class BrandListDaO {
	private static BrandListDaO instance;

	private BrandListDaO() {
	}

	public static BrandListDaO getInstance() {
		if (instance == null) {
			instance = new BrandListDaO();
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
	
	public int getTotalCnt(int ca_code) throws SQLException {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT  count(*)\r\n"
				+ "FROM product p\r\n"
				+ "FULL OUTER JOIN product_image m\r\n"
				+ "USING (product_id)\r\n"
				+ "WHERE p.brand = (SELECT ca_name FROM category WHERE ca_code=?)";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("ca_code의 값 -> " + ca_code);
			pstmt.setInt(1, ca_code);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totCnt = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		System.out.println("totCnt의 값 -> " + totCnt);
		return totCnt;
	}
	
	// 브랜드에 해당하는 상품정보만 나오는 메소드 (페이징까지)
	public List<Product_ImgSrcDTO> productList(int ca_code, int startRow, int endRow) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "SELECT * \r\n"
				+ "FROM (SELECT rownum rn, a.*\r\n"
				+ "FROM (SELECT  *\r\n"
				+ "    FROM product p\r\n"
				+ "        FULL OUTER JOIN product_image m\r\n"
				+ "        USING (product_id)\r\n"
				+ "        WHERE p.brand = (SELECT ca_name FROM category WHERE ca_code=?)) a)\r\n"
				+ "WHERE rn BETWEEN ? and ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ca_code);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
	
	// 상품 최신순으로 8개 뽑기
	public List<Product_ImgSrcDTO> sectionList() throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "SELECT rownum, a.* FROM \r\n"
				+ "(SELECT * FROM product p \r\n"
				+ "FULL OUTER JOIN product_image m \r\n"
				+ "ON p.product_id = m.product_id ORDER BY regdate desc) a \r\n"
				+ "WHERE rownum BETWEEN 1 AND 8";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
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
	
	// 브랜드 단일행 가져오기
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
	
	// 찜 조회 (RegisterLikeService)
	public int checkLike(int product_id, String mem_id) throws SQLException {
		Connection conn = null;
		String sql = "SELECT count(*) FROM like_pro WHERE product_id=? AND mem_id=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int IsLike = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			pstmt.setString(2, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) IsLike = rs.getInt(1);
			System.out.println("IsLike(찜 돼있으면 1) -> " + IsLike);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return IsLike;
	}
	
	// 찜 조회 (BrandListContentsService)
	public List<Product_Like_ProDTO> b_checkLike(String mem_id) throws SQLException {
		List<Product_Like_ProDTO> memst = new ArrayList<Product_Like_ProDTO>();
		Connection conn = null;
		String sql = "SELECT l.product_id, l.mem_id FROM like_pro l, product p WHERE p.product_id = l.product_id AND l.mem_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Product_Like_ProDTO like_ProDTO = new Product_Like_ProDTO();
				like_ProDTO.setProduct_id(rs.getInt("product_id"));
				like_ProDTO.setMem_id(rs.getString("mem_id"));
				memst.add(like_ProDTO);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return memst;
	}
	
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
