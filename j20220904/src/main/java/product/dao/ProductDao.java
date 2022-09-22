package product.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class ProductDao {
	private static ProductDao instance;
	
	 
	//외부에서 접근 못하게 private로 기본생성자 생성
	private ProductDao() {
		
	}
	
	public static ProductDao getInstance()	{
		if(instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}
	
	
	private Connection getConnection() throws SQLException	{
		Connection conn = null;
		
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
			
		}catch(NamingException e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
		
	
	//close하는 메서드
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
