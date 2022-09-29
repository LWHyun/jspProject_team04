package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dto.CategoryDTO;
import dto.ProductDTO;
import dto.SearchClickDTO;

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
	
	
	
	//검색하기
	public List<ProductDTO> selectSearch(String searchBar) throws SQLException {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product where brand like '%"+searchBar+"%' or ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%'";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		
			try {
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					ProductDTO productDTO = new ProductDTO();
					productDTO.setProduct_id(rs.getInt("product_id"));
					productDTO.setBrand(rs.getString("brand"));
					productDTO.setEng_name(rs.getString("eng_name"));
					productDTO.setKor_name(rs.getString("kor_name"));
					productDTO.setGender(rs.getInt("gender"));
					productDTO.setPrice(rs.getInt("price"));
					productDTO.setColor(rs.getString("color"));
					productDTO.setRegdate(rs.getDate("regdate"));
					productDTO.setCa_code(rs.getInt("ca_code"));
					list.add(productDTO);
			} 
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(stmt != null)stmt.close();
			if(conn != null)conn.close();
		}
			
		
		
		return list;
	}
	//성별탭으로 검색 ->뿌려주기
	public List<ProductDTO> selectSearch(int gender) throws SQLException {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product where gender=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gender);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					ProductDTO productDTO = new ProductDTO();
					productDTO.setProduct_id(rs.getInt("product_id"));
					productDTO.setBrand(rs.getString("brand"));
					productDTO.setEng_name(rs.getString("eng_name"));
					productDTO.setKor_name(rs.getString("kor_name"));
					productDTO.setGender(rs.getInt("gender"));
					productDTO.setPrice(rs.getInt("price"));
					productDTO.setColor(rs.getString("color"));
					productDTO.setRegdate(rs.getDate("regdate"));
					productDTO.setCa_code(rs.getInt("ca_code"));
					list.add(productDTO);
			} 
			
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
			
		return list;
	}
	//필터기능 -->아직 안됨
	public List<ProductDTO> selectSearch(String[] brandArray, String[] sizeArray) throws SQLException {
		List<ProductDTO> list = new ArrayList<ProductDTO>();
		String sql = "select * from product where brand='";
		String sql1 = "select * from product p, product_size ps where p.product_id = ps.product_id and \"size\"=";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		for(int i=0; i<brandArray.length;i++) {
			sql+=brandArray[i]+"'";
			System.out.println(sql);
			if(i<brandArray.length-1) {
				sql+=" or brand='";
			}
		}
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				ProductDTO productDTO = new ProductDTO();
				productDTO.setProduct_id(rs.getInt("product_id"));
				productDTO.setBrand(rs.getString("brand"));
				productDTO.setEng_name(rs.getString("eng_name"));
				productDTO.setKor_name(rs.getString("kor_name"));
				productDTO.setGender(rs.getInt("gender"));
				productDTO.setPrice(rs.getInt("price"));
				productDTO.setColor(rs.getString("color"));
				productDTO.setRegdate(rs.getDate("regdate"));
				productDTO.setCa_code(rs.getInt("ca_code"));
				list.add(productDTO);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(stmt != null)stmt.close();
			if(conn != null)conn.close();
		}
		
		
		
		
		System.out.println("result1->"+sql);
		/*
		 * if(sizeArray.length >0) { sql+=" and "; for(int i=0; i<sizeArray.length;i++)
		 * { sql1 } }
		 */
		System.out.println("result2->"+sql);
		
		
		return list;
		

	}
	//인기검색어테이블에 검색어가 있는지 확인
	public int select(String searchWord) throws SQLException {
		String sql = "select sc_word from searchclick where sc_word=?";
		int result = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = 1;
			}else {
				result = 0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return result;
	}
	//인기검색어 테이블에 검색어가 있으면 count+1하는 부분
	public int update(String searchWord) throws SQLException {
		String sql = "update searchclick set sc_count = sc_count+1 where sc_word=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int updateResult = 0;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			updateResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		
		return updateResult;
	}
	//인기검색어 테이블에 검색어가 없으면 insert해주는 부분
	public int insert(String searchWord) throws SQLException {
		int insertResult = 0;
		String sql = "insert into searchclick values(?,0,sysdate)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchWord);
			insertResult = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return insertResult;
	}
	//인기검색어 출력해서 뿌려주는 부분
	public List<SearchClickDTO> select() throws SQLException {
		String sql = "select sc_word, sc_count from searchclick order by sc_count desc";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		List<SearchClickDTO> list = new ArrayList<SearchClickDTO>();
		
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				SearchClickDTO dto = new SearchClickDTO();
				dto.setSc_word(rs.getString(1));
				dto.setSc_count(rs.getInt(2));
				list.add(dto);
				if(list.size()==10) break;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(conn != null)conn.close();
		}
		
		
		return list;
	}
	//카테고리탭에 마우스 올렸을때 카테고리 메뉴 찾는 부분
	public List<CategoryDTO> selectCategory(String result) {
		String sql= "SELECT LPAD(\' \',(LEVEL-1)*2) || ca_name\r\n"
				+ "FROM category\r\n"
				+ "START WITH ca_name = \'"+result+"\' CONNECT BY PRIOR ca_code=ca_code_ref";
		List<CategoryDTO> list = new ArrayList<CategoryDTO>();
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println("sql문1-->"+sql);
		System.out.println("result->"+result);
		try {
			conn = getConnection();
			stmt=conn.createStatement();
			rs = stmt.executeQuery(sql);
			while(rs.next()) {
				CategoryDTO cd = new CategoryDTO();
				cd.setCa_name(rs.getString(1));
				list.add(cd);
				System.out.println("rs.getString(1)->"+rs.getString(1));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return list;
	}
	
	
	
}
