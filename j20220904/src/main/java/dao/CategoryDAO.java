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
import dto.Product_ImgSrcDTO;
import dto.Recent_SearchClickDTO;
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
	public List<Product_ImgSrcDTO> selectSearch(String searchBar) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "select * from product p, product_image pi where p.product_id=pi.product_id and pi.product_id in"
				+ "(select product_id from product where brand like Upper('%"+searchBar+"%') or "
						+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println("sql문-->"+sql);
		
			try {
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while(rs.next()) {
					Product_ImgSrcDTO pis = new Product_ImgSrcDTO();
					pis.setProduct_id(rs.getInt("product_id"));
					pis.setBrand(rs.getString("brand"));
					pis.setEng_name(rs.getString("eng_name"));
					pis.setKor_name(rs.getString("kor_name"));
					pis.setGender(rs.getInt("gender"));
					pis.setPrice(rs.getInt("price"));
					pis.setColor(rs.getString("color"));
					pis.setRegdate(rs.getDate("regdate"));
					pis.setCa_code(rs.getInt("ca_code"));
					pis.setS_file_path(rs.getString("s_file_path"));
					pis.setL_file_path(rs.getString("l_file_path"));
					list.add(pis);
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
	public List<Product_ImgSrcDTO> selectSearch(int gender) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "select * from product p, product_image pi where p.product_id=pi.product_id and p.gender=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, gender);
				rs=pstmt.executeQuery();
				while(rs.next()) {
					Product_ImgSrcDTO pis = new Product_ImgSrcDTO();
					pis.setProduct_id(rs.getInt("product_id"));
					pis.setBrand(rs.getString("brand"));
					pis.setEng_name(rs.getString("eng_name"));
					pis.setKor_name(rs.getString("kor_name"));
					pis.setGender(rs.getInt("gender"));
					pis.setPrice(rs.getInt("price"));
					pis.setColor(rs.getString("color"));
					pis.setRegdate(rs.getDate("regdate"));
					pis.setCa_code(rs.getInt("ca_code"));
					pis.setS_file_path(rs.getString("s_file_path"));
					pis.setL_file_path(rs.getString("l_file_path"));
					list.add(pis);
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
	public List<Product_ImgSrcDTO> selectSearch(String[] brandArray, String size) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
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
				Product_ImgSrcDTO productDTO = new Product_ImgSrcDTO();
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
		String sql = "select sc_word from searchclick where sc_word=Upper(?)";
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
	public List<CategoryDTO> selectCategory(String result) throws SQLException {
		String sql= "SELECT ca_code,LPAD(\' \',(LEVEL-1)*2) || ca_name\r\n"
				+ "FROM category\r\n"
				+ "START WITH ca_name = \'"+result+"\' CONNECT BY PRIOR ca_code=ca_code_ref order by ca_code asc";
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
				cd.setCa_code(rs.getInt(1));
				cd.setCa_name(rs.getString(2));
				list.add(cd);
				System.out.println("rs.getString(1)->"+rs.getString(1));
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
	//카테고리 코드별 정렬
	public List<Product_ImgSrcDTO> selectCodeSearch(String ca_code) throws SQLException {
		String sql = "select * from product p, product_image pi where p.product_id=pi.product_id and ca_code=?";
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, ca_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product_ImgSrcDTO pd = new Product_ImgSrcDTO();
				pd.setProduct_id(rs.getInt(1));
				pd.setBrand(rs.getString(2));
				pd.setEng_name(rs.getString("eng_name"));
				pd.setKor_name(rs.getString("kor_name"));
				pd.setGender(rs.getInt("gender"));
				pd.setPrice(rs.getInt("price"));
				pd.setColor(rs.getString("color"));
				pd.setRegdate(rs.getDate("regdate"));
				pd.setCa_code(rs.getInt("ca_code"));
				pd.setS_file_path(rs.getString("s_file_path"));
				pd.setL_file_path(rs.getString("l_file_path"));
				list.add(pd);
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return list;
	}
	
	//카테고리 이름찾는 부분
	public String selectCateName(String ca_code) throws SQLException {
		String sql = "select ca_name from category where ca_code=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String result = "";
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ca_code);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getString(1);
			}
			System.out.println("SelectCateName result -->"+result);
			
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
	public List<Recent_SearchClickDTO> selectRecentWord(String id) throws SQLException {
		List<Recent_SearchClickDTO>rsc_list = new ArrayList<Recent_SearchClickDTO>();
		String sql = "select * from recent_searchclick where mem_id=? order by rsc_num desc";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Recent_SearchClickDTO rsc = new Recent_SearchClickDTO();
				rsc.setRsc_num(rs.getInt(2));
				rsc.setRsc_word(rs.getString(3));
				rsc_list.add(rsc);
				if(rsc_list.size()==10) break;

			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		
		
		return rsc_list;
	}
	//최근검색어 저장하는 부분
	public int insertRecentWord(String searchWord, String id) throws SQLException {
		String sql = "insert into recent_searchclick values (?,(select NVL(max(rsc_num),0)+1 from recent_searchclick where mem_id=?),?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(sql);
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, id);
			pstmt.setString(3, searchWord);
			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return result;
	}
	//최근검색어 지우는 부분
	public int deleteRecentWord(String word, String id) throws SQLException {
		String sql = "delete from recent_searchclick where rsc_num=? and mem_id=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		int result = 0;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, word);
			pstmt.setString(2, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		return result;
	}
	
	
	
}
