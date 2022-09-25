package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.BasketDTO;

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
	
	
	public List<BasketDTO> selectBasketList(String mem_id) {
		
		List<BasketDTO> list = new ArrayList<BasketDTO>();
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT b.mem_id , p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, b.cnt\r\n"
					+ "FROM basket b \r\n"
					+ "JOIN product p\r\n"
					+ "ON b.product_id = p.product_id where mem_id=?";
		
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
				
				list.add(basketDTO);
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
