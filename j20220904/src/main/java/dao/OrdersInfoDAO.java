package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.OrdersInfoDTO;

public class OrdersInfoDAO {

private static OrdersInfoDAO instance;
	
	private OrdersInfoDAO() {}
	
	public static OrdersInfoDAO getInstance() {
		if(instance == null) {
			instance = new OrdersInfoDAO();
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
	
	
	//member 정보 가져가는 메소드
	public OrdersInfoDTO selectMemInfo(String mem_id) {
		
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "SELECT mem_name, mem_tel, mem_email1, mem_email2 FROM member WHERE mem_id=?";

		System.out.println("DAO selectMemInfo sql->"+sql);
		System.out.println("DAO selectMemInfo mem_id->"+mem_id);

		
		OrdersInfoDTO ordersInfoDTO = new OrdersInfoDTO();
		
		try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					System.out.println("DAO selectMemInfo mem_name->"+rs.getString("mem_name"));
				
					ordersInfoDTO.setMem_id(mem_id);
					ordersInfoDTO.setMem_name(rs.getString("mem_name"));
					ordersInfoDTO.setMem_tel(rs.getString("mem_tel"));
					ordersInfoDTO.setMem_email1(rs.getString("mem_email1"));
					ordersInfoDTO.setMem_email2(rs.getString("mem_email2"));
					
				}
			
			
		} catch (Exception e) {
			System.out.println("DAO selectMemInfo e.getMessage()->"+e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}
		
		return ordersInfoDTO;
		
		
	}
	
	
	// product 정보 가져오는 메소드
	public OrdersInfoDTO selectProductInfo(OrdersInfoDTO ordersDTO) {
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		String sql = "SELECT p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, pi.s_file_path, ps.size_num, ps.pd_size\r\n"
				+ "FROM product p\r\n"
				+ "JOIN product_image pi\r\n"
				+ "ON p.product_id = pi.product_id\r\n"
				+ "JOIN product_size ps\r\n"
				+ "ON pi.product_id = ps.product_id\r\n"
				+ "WHERE p.product_id = ?\r\n"
				+ "AND ps.size_num = ?";
		
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, ordersDTO.getProduct_id());
			pstmt.setInt(2, ordersDTO.getSize_num());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				ordersDTO.setProduct_id(rs.getInt("product_id"));
				ordersDTO.setBrand(rs.getString("brand"));
				ordersDTO.setEng_name(rs.getString("eng_name"));
				ordersDTO.setKor_name(rs.getString("kor_name"));
				ordersDTO.setGender(rs.getInt("gender"));
				ordersDTO.setPrice(rs.getInt("price"));
				ordersDTO.setColor(rs.getString("color"));
				ordersDTO.setS_file_path(rs.getString("s_file_path"));
				ordersDTO.setSize_num(rs.getInt("size_num"));
				ordersDTO.setPd_size(rs.getInt("pd_size"));
				
			}
			
		} catch (Exception e) {
			System.out.println("DAO selectProductInfo e.getMessage()->"+e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}

		return ordersDTO;
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

	
