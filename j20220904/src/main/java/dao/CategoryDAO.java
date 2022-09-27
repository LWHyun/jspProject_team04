package dao;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class CategoryDAO {
	private static CategoryDAO instance;
	private CategoryDAO() {
		//기본생성자
	}
	//싱글톤
	public static CategoryDAO getInstance() {
		if(instance ==null) {
			instance = new CategoryDAO();
		}
		return instance;
	}
	//연결
	private Connection getConnection() {
		Connection conn =null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println(e.getMessage()); 
		}
		return conn;
	}
}
