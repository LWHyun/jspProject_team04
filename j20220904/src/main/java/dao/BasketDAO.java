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

import dto.BasketDTO;
import dto.BasketProDTO;

public class BasketDAO {

	private static BasketDAO instance;
	
	private BasketDAO() {}
	
	public static BasketDAO getInstance() {
		if(instance == null) {
			instance = new BasketDAO();
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
	
	// 장바구니 리스트 가져오기
	public List<BasketDTO> selectBasketList(String mem_id) {
		
		List<BasketDTO> list = new ArrayList<BasketDTO>();
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "SELECT b.mem_id, b.cnt, ps.size_num, ps.product_id, ps.stock, p.gender, ps.pd_size, p.brand, p.eng_name, p.kor_name, p.price, p.color, pi.s_file_path\r\n"
				+ "FROM basket b \r\n"
				+ "JOIN product_size ps\r\n"
				+ "ON  b.product_id = ps.product_id\r\n"
				+ "AND b.size_num = ps.size_num\r\n"
				+ "JOIN product p\r\n"
				+ "ON ps.product_id = p.product_id\r\n"
				+ "JOIN product_image pi\r\n"
				+ "ON p.product_id = pi.product_id\r\n"
				+ "WHERE b.mem_id = ?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BasketDTO basketDTO = new BasketDTO();
				basketDTO.setMem_id(rs.getString("mem_id"));
				basketDTO.setProduct_id(rs.getInt("product_id"));
				basketDTO.setStock(rs.getInt("stock"));
				basketDTO.setCnt(rs.getInt("cnt"));
				basketDTO.setBrand(rs.getString("brand"));
				basketDTO.setEng_name(rs.getString("eng_name"));
				basketDTO.setKor_name(rs.getString("kor_name"));
				basketDTO.setGender(rs.getInt("gender"));
				basketDTO.setPrice(rs.getInt("price"));
				basketDTO.setColor(rs.getString("color"));
				basketDTO.setS_file_path(rs.getString("s_file_path"));
				basketDTO.setPd_size(rs.getInt("pd_size"));
				basketDTO.setSize_num(rs.getInt("size_num"));
				
				list.add(basketDTO);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());	
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
		
	}
	
	// 장바구니 수량 수정
	public int updateCnt (BasketDTO basketDTO) {
		
			
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE basket SET cnt = ? "
				+ "WHERE mem_id= ?"
				+ "AND product_id= ?"
				+ "AND size_num= ?";
	
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basketDTO.getCnt());
			pstmt.setString(2, basketDTO.getMem_id());
			pstmt.setInt(3, basketDTO.getProduct_id());
			pstmt.setInt(4, basketDTO.getSize_num());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(conn, pstmt);
		}
			
		return result;
		
	}
	
	
	//장바구니 상품 단일 삭제
	public int deleteItem (BasketDTO basketDTO) {
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM basket WHERE mem_id=? AND product_id=? AND size_num=?";
		int result = 0;
		
		
		try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, basketDTO.getMem_id());
				pstmt.setInt(2, basketDTO.getProduct_id());
				pstmt.setInt(3, basketDTO.getSize_num());
				result = pstmt.executeUpdate();
				
				
				
		} catch( Exception e ) {
			System.out.println(e.getMessage());
		}
		finally {
			close(conn, pstmt);
		}
			
		return result;
		
		
	}
	
	// 장바구니에 찜한 목록 불러오는 메소드
	public List<BasketDTO> selectLikeProList(String mem_id) {
		
		List<BasketDTO> list = new ArrayList<BasketDTO>();
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT l.product_id, l.mem_id, l.like_pro_date, p.gender, p.brand, p.kor_name, p.price, pi.s_file_path\r\n"
				+ "FROM like_pro l\r\n"
				+ "JOIN product p\r\n"
				+ "ON l.product_id = p.product_id\r\n"
				+ "JOIN product_image pi\r\n"
				+ "ON p.product_id = pi.product_id\r\n"
				+ "WHERE l.mem_id = ?\r\n"
				+ "ORDER BY l.like_pro_date DESC";
		
		try {
			
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_id);
			
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					
					BasketDTO basketDTO = new BasketDTO();
					
					basketDTO.setProduct_id(rs.getInt("product_id"));
					basketDTO.setMem_id(rs.getString("mem_id"));
					basketDTO.setLike_pro_date(rs.getString("like_pro_date"));
					basketDTO.setGender(rs.getInt("gender"));
					basketDTO.setBrand(rs.getString("brand"));
					basketDTO.setKor_name(rs.getString("kor_name"));
					basketDTO.setPrice(rs.getInt("price"));
					basketDTO.setS_file_path(rs.getString("s_file_path"));
					
					list.add(basketDTO);
				}
			
		} catch (Exception e) {
			System.out.println("basketDAO selectLikeProList error"+ e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}
		
		
		return list;
	}
	
	//상세페이지에서 장바구니수량 있나 없나 비교하는 메서드
	public List<BasketProDTO> compareBasketList(String mem_id) {
		
		List<BasketProDTO> list = new ArrayList<>();
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		String sql = "select * from basket where mem_id=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BasketProDTO basketProDTO = new BasketProDTO();
				basketProDTO.setMem_id(rs.getString("mem_id"));
				basketProDTO.setProduct_id(rs.getInt("product_id"));
				basketProDTO.setSize_num(rs.getInt("size_num"));
				
				
				list.add(basketProDTO);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());	
		} finally {
			close(rs, pstmt, conn);
		}
		return list;
		
		
	}
	
	// 회원의 바스켓 갯수 가져오는 메서드
	public int memBasketCnt(String mem_id) {
		Connection conn = getConnection();
		
		String sql = "select count(*) from basket where mem_id=?";
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int basketCnt = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) basketCnt = rs.getInt(1);
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			close(rs, pstmt, conn);
		}
		
		return basketCnt;
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
