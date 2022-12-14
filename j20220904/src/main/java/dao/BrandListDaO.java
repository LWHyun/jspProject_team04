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
	public List<Product_ImgSrcDTO> productList(int ca_code, String mem_id, int startRow, int endRow) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "SELECT * FROM(\r\n"
				+ "                SELECT rownum rn, a.* FROM (\r\n"
				+ "                SELECT p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, p.regdate, p.ca_code, pi.s_file_path, pi.l_file_path, NVL(l.product_id,0) e FROM product p, product_image pi ,(SELECT * FROM like_pro WHERE mem_id =?) l\r\n"
				+ "				WHERE p.product_id = pi.product_id  AND p.product_id = l.product_id(+) AND p.brand =  (SELECT ca_name FROM category WHERE ca_code=?)) a)\r\n"
				+ "                WHERE rn BETWEEN ? AND ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, ca_code);
			pstmt.setInt(3, startRow);
			pstmt.setInt(4, endRow);
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
				pdImgSrcDTO.setE(rs.getInt("e"));
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
		String sql = "SELECT NVL(product_id, 0) e FROM like_pro WHERE mem_id = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				rs.getInt(1);
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

	public List<Product_ImgSrcDTO> selectBuy(int product_id) throws SQLException {
		List<Product_ImgSrcDTO> bist = new ArrayList<Product_ImgSrcDTO>();
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT p.*, m.s_file_path, m.l_file_path, s.size_num, s.pd_size, s.stock FROM product p , product_image m , product_size s\r\n"
				+ "WHERE p.product_id = m.product_id\r\n"
				+ "AND m.product_id = s.product_id\r\n"
				+ "AND p.product_id = ?";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, product_id);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product_ImgSrcDTO dto = new Product_ImgSrcDTO();
				dto.setProduct_id(rs.getInt("product_id"));
				dto.setBrand(rs.getString("brand"));
				dto.setEng_name(rs.getString("eng_name"));
				dto.setKor_name(rs.getString("kor_name"));
				dto.setGender(rs.getInt("gender"));
				dto.setPrice(rs.getLong("price"));
				dto.setColor(rs.getString("color"));
				dto.setRegdate(rs.getDate("regdate"));
				dto.setCa_code(rs.getInt("ca_code"));
				dto.setS_file_path(rs.getString("s_file_path"));
				dto.setL_file_path(rs.getString("l_file_path"));
				dto.setSize_num(rs.getInt("size_num"));
				dto.setPd_size(rs.getInt("pd_size"));
				dto.setStock(rs.getInt("stock"));
				bist.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null) rs.close();
			if (pstmt != null) pstmt.close();
			if (conn != null) conn.close();
		}
		return bist;
	}
	
	public List<Product_ImgSrcDTO> brandList(String mem_id, int startRow, int endRow) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "SELECT * FROM (\r\n"
				+ "SELECT rownum rn, a.* FROM (\r\n"
				+ "SELECT p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, p.regdate, p.ca_code, pi.pro_image_id, pi.s_file_path, pi.l_file_path, NVL(l.product_id,0) e FROM product p, product_image pi ,(SELECT * FROM like_pro WHERE mem_id =?) l \r\n"
				+ "WHERE p.product_id = pi.product_id  AND p.product_id = l.product_id(+)) a)\r\n"
				+ "WHERE rn BETWEEN ? AND ?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
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
				pdImgSrcDTO.setE(rs.getInt("e"));
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
	
	public int getTotalCount(String mem_id) throws SQLException {
		int totCnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT count(*) FROM(\r\n"
				+ "SELECT p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, p.regdate, p.ca_code, pi.pro_image_id, pi.s_file_path, pi.l_file_path, NVL(l.product_id,0) e FROM product p, product_image pi ,(SELECT * FROM like_pro WHERE mem_id =?) l \r\n"
				+ "WHERE p.product_id = pi.product_id  AND p.product_id = l.product_id(+))";
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			System.out.println("mem_id의 값 -> " + mem_id);
			pstmt.setString(1, mem_id);
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

}
