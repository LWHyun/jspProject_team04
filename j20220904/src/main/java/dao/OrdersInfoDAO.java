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
		
		String sql = "SELECT mem_name, mem_tel, mem_email1, mem_email2"
				+ "FROM member"
				+ "WHERE mem_id=?"+mem_id;
		
		OrdersInfoDTO ordersInfoDTO = new OrdersInfoDTO();
		
		try {
				
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mem_id);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					
					
					ordersInfoDTO.setMem_id(rs.getString("mem_id"));
					ordersInfoDTO.setMem_name(rs.getString("mem_name"));
					ordersInfoDTO.setMem_tel(rs.getString("mem_tel"));
					ordersInfoDTO.setMem_email1(rs.getString("mem_email1"));
					ordersInfoDTO.setMem_email2(rs.getString("mem_email2"));
					
				}
			
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(conn, pstmt, rs);
		}
		
		return ordersInfoDTO;
		
		
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

	
