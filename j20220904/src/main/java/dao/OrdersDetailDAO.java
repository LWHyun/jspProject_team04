package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class OrdersDetailDAO {

	
private static OrdersDetailDAO instance;
	
	private OrdersDetailDAO() {}
	
	public static OrdersDetailDAO getInstance() {
		if(instance == null) {
			instance = new OrdersDetailDAO();
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
}
