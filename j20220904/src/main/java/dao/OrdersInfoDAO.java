package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.MyPage_OrdersDTO;
import dto.OrdersDTO;
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
		
		String sql = "SELECT mem_name, mem_tel, mem_email1, mem_email2, mem_zipcode, mem_addr1, mem_addr2 FROM member WHERE mem_id=?";

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
					ordersInfoDTO.setMem_zipcode(rs.getString("mem_zipcode"));
					ordersInfoDTO.setMem_addr1(rs.getString("mem_addr1"));
					ordersInfoDTO.setMem_addr2(rs.getString("mem_addr2"));
					
				}
			
			
		} catch (Exception e) {
			System.out.println("DAO selectMemInfo e.getMessage()->"+e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}
		
		return ordersInfoDTO;
		
		
	}
	
	
	// product 정보 가져오는 메소드
	public OrdersInfoDTO selectProductInfo(OrdersInfoDTO ordersInfoDTO) {
		
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
			pstmt.setInt(1, ordersInfoDTO.getProduct_id());
			pstmt.setInt(2, ordersInfoDTO.getSize_num());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				ordersInfoDTO.setProduct_id(rs.getInt("product_id"));
				ordersInfoDTO.setBrand(rs.getString("brand"));
				ordersInfoDTO.setEng_name(rs.getString("eng_name"));
				ordersInfoDTO.setKor_name(rs.getString("kor_name"));
				ordersInfoDTO.setGender(rs.getInt("gender"));
				ordersInfoDTO.setPrice(rs.getInt("price"));
				ordersInfoDTO.setColor(rs.getString("color"));
				ordersInfoDTO.setS_file_path(rs.getString("s_file_path"));
				ordersInfoDTO.setSize_num(rs.getInt("size_num"));
				ordersInfoDTO.setPd_size(rs.getInt("pd_size"));
				
			}
			
		} catch (Exception e) {
			System.out.println("DAO selectProductInfo e.getMessage()->"+e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}

		return ordersInfoDTO;
	}
	
	public List<OrdersDTO> insertOrdersList( ) {
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		String sql1 = "INSERT INTO orders (order_id, mem_id, order_name, order_phone, order_email, take_name, take_phone, take_add, order_msg, sysdate)"
				+ "VALUES(?,?,?,?,?,?,?,?,?)";
		
		
		return null;
		
		
		
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

	
