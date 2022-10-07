package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.OrdersDTO;
import dto.OrdersDetailDTO;

public class OrdersDAO {

	
private static OrdersDAO instance;
	
	private OrdersDAO() {}
	
	public static OrdersDAO getInstance() {
		if(instance == null) {
			instance = new OrdersDAO();
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
	
	
	// 가져온 상품정보와 주문받는 고객정보를 Insert하는 메소드
	public OrdersDTO insertOrderDetail(OrdersDTO ordersDTO) {
		
		
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		
		String sql1 = "INSERT INTO orders (order_id, mem_id, order_name, order_phone, take_name, take_phone, order_date, order_status) "
				+ "VALUES (seq_orders.NEXTVAL, ?, ?, ?, ?, ?, sysdate, 1)";
		
		String sql2 = "INSERT INTO orders_detail (order_id, size_num, product_id, cnt, order_price)"
				+ "VALUES (seq_orders.CURRVAL, ?, ?, ?, ?)";
		
		try {
			
				pstmt = conn.prepareStatement(sql1);
				pstmt.setString(1, ordersDTO.getMem_id());
				pstmt.setString(2, ordersDTO.getOrder_name());
				pstmt.setString(3, ordersDTO.getOrder_phone());
				pstmt.setString(4, ordersDTO.getTake_name());
				pstmt.setString(5, ordersDTO.getTake_phone());
				
				pstmt.executeUpdate();
				pstmt.close();
				
				List<OrdersDetailDTO> DetailList = ordersDTO.getList();
				pstmt = conn.prepareStatement(sql2);
				
				for(int i = 0; i < DetailList.size() ; i++) {
				
					pstmt.setInt(1, DetailList.get(i).getSize_num());
					pstmt.setInt(2, DetailList.get(i).getProduct_id());
					pstmt.setInt(3, DetailList.get(i).getCnt());
					pstmt.setInt(4, DetailList.get(i).getOrder_price());
					pstmt.executeUpdate();
				}
				
				
				pstmt.close();
				
				
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			close(pstmt, conn);
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
