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
	
		String sql = "SELECT b.mem_id , p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, b.cnt, i.s_file_path, s.pd_size\r\n"
				+ "FROM basket b \r\n"
				+ "JOIN product p ON b.product_id = p.product_id \r\n"
				+ "Join product_size s on  b.size_num = s.size_num and b.product_id = s.product_id \r\n"
				+ "Join product_image i on i.product_id = p.product_id\r\n"
				+ "where mem_id=?";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				
				BasketDTO basketDTO = new BasketDTO();
				basketDTO.setMem_id(rs.getString("mem_id"));
				basketDTO.setProduct_id(rs.getInt("product_id"));
				basketDTO.setCnt(rs.getInt("cnt"));
				basketDTO.setBrand(rs.getString("brand"));
				basketDTO.setEng_name(rs.getString("eng_name"));
				basketDTO.setKor_name(rs.getString("kor_name"));
				basketDTO.setGender(rs.getInt("gender"));
				basketDTO.setPrice(rs.getInt("price"));
				basketDTO.setColor(rs.getString("color"));
				basketDTO.setS_file_path(rs.getString("s_file_path"));
				basketDTO.setPd_size(Integer.parseInt(rs.getString("pd_size")));
				
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
		
		String sql = "UPDATE basket SET cnt = ? \r\n"
				+ "WHERE mem_id= ?\r\n"
				+ "AND product_id= ?";
	
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, basketDTO.getCnt());
			pstmt.setString(2, basketDTO.getMem_id());
			pstmt.setInt(3, basketDTO.getProduct_id());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(conn, pstmt);
		}
			
		return result;
		
	}
	
	
	//장바구니 상품 삭제
	public int deleteItem (BasketDTO basketDTO) {
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "DELETE FROM basket WHERE mem_id=? AND product_id=?";
		int result = 0;
		
		
		try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, basketDTO.getMem_id());
				pstmt.setInt(2, basketDTO.getProduct_id());
				result = pstmt.executeUpdate();
				
				
				
		} catch( Exception e ) {
			
		}
		
		return result;
		
		
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
