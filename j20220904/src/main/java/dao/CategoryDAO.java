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
import dto.LikeProDTO;
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
	public List<Product_ImgSrcDTO> selectWordSearch(String searchBar, String mem_id) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "select p.*,pi.*,NVL(l.product_id,0) from product p, product_image pi,(SELECT * FROM like_pro WHERE mem_id =\'"+mem_id+"\')l where p.product_id = l.product_id(+) and"
				+ " p.product_id=pi.product_id and pi.product_id in"
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
					pis.setLike_product_id(rs.getInt("NVL(L.PRODUCT_ID,0)"));
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
	public List<Product_ImgSrcDTO> selectSearch(int gender, String mem_id) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		String sql = "";
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
			sql = "select p.*, pi.*, NVL(l.product_id,0) from product p, product_image pi ,(SELECT * FROM like_pro WHERE mem_id =?) l where p.product_id=pi.product_id and  p.gender=? and  p.product_id = l.product_id(+)";
			System.out.println("memID SQL->"+sql);
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setInt(2, gender);
			rs=pstmt.executeQuery();
		
		
		
			try {
				
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
					pis.setLike_product_id(rs.getInt("NVL(L.PRODUCT_ID,0)"));
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
	//필터기능
	public List<Product_ImgSrcDTO> selectSearch(String[] brandArray, String size, String gender, String ca_code, String searchBar, String mem_id) throws SQLException {
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		//브랜드만 있을때 --하위 카테고리용
		String sql = "select p.*,i.*,NVL(l.product_id,0) from product p LEFT OUTER JOIN (SELECT * FROM like_pro WHERE mem_id =\'";
		sql += mem_id+"\') l ON p.product_id = l.product_id join product_image i on p.product_id = i.product_id where p.brand=\'";
		//size만 있을때 --하위카테고리용
		String sql1 = "select p.*,i.*,ps.*,NVL(l.product_id,0) from product p,product_image i, product_size ps, (SELECT * FROM like_pro WHERE mem_id =\'";
		sql1 += mem_id+"\') l  where p.product_id = i.product_id and ps.product_id = i.product_id and  p.product_id = l.product_id(+) and ps.pd_size=";
		//size랑 브랜드 모두 있을때
		String sql2 = "select p.*,i.*,ps.*,NVL(l.product_id,0) from product p LEFT OUTER JOIN (SELECT * FROM like_pro WHERE mem_id ='";
		sql2 += mem_id+"\') l ON p.product_id = l.product_id join product_image i on p.product_id = i.product_id join product_size ps on ps.product_id = i.product_id where p.brand=\'";
		//사이즈가 있는 거 ->상위카테고리용
		String sql3 = "select p.*,i.*,ps.*,NVL(l.product_id,0) from product p left outer join (SELECT * FROM like_pro WHERE mem_id ='";
		sql3 += mem_id+"\') l on p.product_id = l.product_id join product_image i on p.product_id = i.product_id join product_size ps on ps.product_id = i.product_id join (SELECT * FROM category WHERE  ca_code_ref=";
		//사이즈가 없는거 아래 ->상위카테고리용
		String sql4 = "select p.*,i.*,NVL(l.product_id,0) from product p left outer join (SELECT * FROM like_pro WHERE mem_id =\'";
		sql4 += mem_id+"\') l on p.product_id = l.product_id join product_image i on p.product_id = i.product_id join (SELECT * FROM category WHERE ca_code_ref=";
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		System.out.println("CategoryDAO searchBar-->"+searchBar);
		System.out.println("CategoryDAO ca_code-->"+ca_code);
		
		
		
		
		
		
		String sqlResult="";
		try {
			//필터시 브랜드만 검색했을때
			if(size == null||size.equals("")) {
				//필터시 브랜드만 검색했는데 하위카테고리에서 필터 작동시
				if(ca_code !=null) {
					//필터시 브랜드만 검색했는데 하위카테고리에서 필터 작동시, 하위카테고리가 2번째 상위카테고리일시 작동
					if(ca_code.equals("20100")||ca_code.equals("20200")||ca_code.equals("30100")||ca_code.equals("30200")) {
						sql = sql4+ca_code+") c on c.ca_code=p.ca_code where p.brand=\'";
						for(int i=0; i<brandArray.length;i++) {
							sql+=brandArray[i]+"\'";
							System.out.println("CategoryDAO sql전 ->"+sql);
							if(gender !=null) {
								sql+=" and p.gender = "+gender;
							}else if (searchBar != null) {
								sql+=" and i.product_id in(select product_id from product where brand like Upper(\'%"+searchBar+"%\') or "
										+ "ENG_NAME like \'%"+searchBar+"%\' or KOR_NAME like \'%"+searchBar+"%\')";
							}
							if(i<brandArray.length-1) {
								sql+=" or p.brand='";
							}
							
						}
					}else {
						//필터시 브랜드만 검색했는데 하위카테고리에서 필터 작동시
						for(int i=0; i<brandArray.length;i++) {
							sql+=brandArray[i]+"\'";
							System.out.println("sql 전"+sql);
							if(gender !=null) {
								sql+=" and p.gender = "+gender;
							}else if (ca_code !=null) {
								sql+=" and p.ca_code = \'"+ca_code+"\'";
							}else if (searchBar != null) {
								sql+=" and i.product_id in(select product_id from product where brand like Upper(\'%"+searchBar+"%\') or "
										+ "ENG_NAME like \'%"+searchBar+"%\' or KOR_NAME like \'%"+searchBar+"%\')";
							}
							if(i<brandArray.length-1) {
								sql+=" or p.brand='";
							}
							
						}
					}
				}else {
					//필터시 브랜드만 검색했는데 상위카테고리에서 작동했을시
					for(int i=0; i<brandArray.length;i++) {
						sql+=brandArray[i]+"\'";
						System.out.println("sql 전"+sql);
						if(gender !=null) {
							sql+=" and p.gender = "+gender;
						}else if (ca_code !=null) {
							sql+=" and p.ca_code = \'"+ca_code+"\'";
						}else if (searchBar != null) {
							sql+=" and i.product_id in(select product_id from product where brand like Upper(\'%"+searchBar+"%\') or "
									+ "ENG_NAME like \'%"+searchBar+"%\' or KOR_NAME like \'%"+searchBar+"%\')";
						}
						if(i<brandArray.length-1) {
							sql+=" or p.brand='";
						}
						
					}
				}
				System.out.println("CategoryDAO sql후 ->"+sql);
				System.out.println("sql 후"+sql);
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while(rs.next()) {
					Product_ImgSrcDTO product = new Product_ImgSrcDTO();
					product.setProduct_id(rs.getInt("product_id"));
					product.setBrand(rs.getString("brand"));
					product.setEng_name(rs.getString("eng_name"));
					product.setKor_name(rs.getString("kor_name"));
					product.setGender(rs.getInt("gender"));
					product.setPrice(rs.getInt("price"));
					product.setColor(rs.getString("color"));
					product.setRegdate(rs.getDate("regdate"));
					product.setCa_code(rs.getInt("ca_code"));
					product.setS_file_path(rs.getString("s_file_path"));
					product.setL_file_path(rs.getString("l_file_path"));
					product.setLike_product_id(rs.getInt("NVL(L.PRODUCT_ID,0)"));
					list.add(product);
				}
				sqlResult = sql;
			}else if(brandArray==null) {
				//필터시 브랜드가 없고 사이즈만 있을때
				System.out.println("여기냐?");
				if(ca_code !=null) {
					if(ca_code.equals("20100")||ca_code.equals("20200")||ca_code.equals("30100")||ca_code.equals("30200")) {
						System.out.println("여기냐1?");
						sql1 = sql3+ca_code+") c on c.ca_code=p.ca_code where ps.pd_size="+size;
						System.out.println("CategoryDAO sql1전 ->"+sql1);
						if(gender !=null) {
							sql1+=" and p.gender = "+gender;
						}else if (searchBar != null) {
							sql1+=" and i.product_id in(select product_id from product where brand like Upper('%"+searchBar+"%') or "
									+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
						}
						System.out.println("오긴하냐?");
					}
					else{
						System.out.println("여기냐?2");
						sql1 += size+ " and p.ca_code="+ca_code;
						if(gender !=null) {
							sql1+=" and p.gender = "+gender;
						}else if (searchBar != null) {
							sql1+=" and i.product_id in(select product_id from product where brand like Upper('%"+searchBar+"%') or "
									+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
						}
						System.out.println("오냐?");
					}
				}else{
					System.out.println("여기냐?2");
					sql1 += size;
					if(gender !=null) {
						sql1+=" and p.gender = "+gender;
					}else if (searchBar != null) {
						sql1+=" and i.product_id in(select product_id from product where brand like Upper('%"+searchBar+"%') or "
								+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
					}
					System.out.println("오냐?");
				}

				System.out.println("여기냐?3");
				System.out.println("CategoryDAO sql1후 ->"+sql1);
				conn=getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql1);

				while(rs.next()) {
					Product_ImgSrcDTO product = new Product_ImgSrcDTO();
					product.setProduct_id(rs.getInt("product_id"));
					product.setBrand(rs.getString("brand"));
					product.setEng_name(rs.getString("eng_name"));
					product.setKor_name(rs.getString("kor_name"));
					product.setGender(rs.getInt("gender"));
					product.setPrice(rs.getInt("price"));
					product.setColor(rs.getString("color"));
					product.setRegdate(rs.getDate("regdate"));
					product.setCa_code(rs.getInt("ca_code"));
					product.setS_file_path(rs.getString("s_file_path"));
					product.setL_file_path(rs.getString("l_file_path"));
					product.setSize_num(rs.getInt("size_num"));
					product.setPd_size(rs.getInt("pd_size"));
					product.setStock(rs.getInt("stock"));
					product.setLike_product_id(rs.getInt("NVL(L.PRODUCT_ID,0)"));
					list.add(product);
				}
				sqlResult = sql1;
				
			}else {
				if(ca_code !=null) {
					if(ca_code.equals("20100")||ca_code.equals("20200")||ca_code.equals("30100")||ca_code.equals("30200")) {
						sql2 = sql3+ca_code+") c on c.ca_code=p.ca_code where p.brand=\'";
						for(int i=0; i<brandArray.length;i++) {
							sql2+=brandArray[i]+"\'";
							System.out.println("sql2"+sql2);
							if(gender !=null) {
								sql2+=" and p.gender = "+gender;
							}else if (searchBar != null) {
								sql2+=" and i.product_id in(select product_id from product where brand like Upper('%"+searchBar+"%') or "
										+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
							}
							sql2+=" and ps.pd_size="+size;
							if(i<brandArray.length-1) {
								sql2+=" or p.brand='";
							}
							
						}
					}
					else {
				 		for(int i=0; i<brandArray.length;i++) {
						sql2+=brandArray[i]+"\'";
						System.out.println("CategoryDAO sql2전 ->"+sql2);
						if(gender !=null) {
							sql2+=" and p.gender = "+gender;
						}else if (ca_code != null) {
							sql2+=" and p.ca_code = \'"+ca_code+"\'";
						}else if (searchBar != null) {
							sql2+=" and i.product_id in(select product_id from product where brand like Upper('%"+searchBar+"%') or "
									+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
						}
						sql2+=" and ps.pd_size="+size;
						if(i<brandArray.length-1) {
							sql2+=" or p.brand='";
							}
				 		}
					}
				}else {
				 		for(int i=0; i<brandArray.length;i++) {
						sql2+=brandArray[i]+"\'";
						System.out.println("CategoryDAO sql2전 ->"+sql2);
						if(gender !=null) {
							sql2+=" and p.gender = "+gender;
						}else if (ca_code != null) {
							sql2+=" and p.ca_code = \'"+ca_code+"\'";
						}else if (searchBar != null) {
							sql2+=" and i.product_id in(select product_id from product where brand like Upper('%"+searchBar+"%') or "
									+ "ENG_NAME like '%"+searchBar+"%' or KOR_NAME like '%"+searchBar+"%')";
						}
						sql2+=" and ps.pd_size="+size;
						if(i<brandArray.length-1) {
							sql2+=" or p.brand='";
							}
				 		}
					}
				System.out.println("CategoryDAO sql2후 ->"+sql2);
				conn = getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql2);
				while(rs.next()) {
					Product_ImgSrcDTO product = new Product_ImgSrcDTO();
					product.setProduct_id(rs.getInt("product_id"));
					product.setBrand(rs.getString("brand"));
					product.setEng_name(rs.getString("eng_name"));
					product.setKor_name(rs.getString("kor_name"));
					product.setGender(rs.getInt("gender"));
					product.setPrice(rs.getInt("price"));
					product.setColor(rs.getString("color"));
					product.setRegdate(rs.getDate("regdate"));
					product.setCa_code(rs.getInt("ca_code"));
					product.setS_file_path(rs.getString("s_file_path"));
					product.setL_file_path(rs.getString("l_file_path"));
					product.setLike_product_id(rs.getInt("NVL(L.PRODUCT_ID,0)"));
					list.add(product);
				}
				sqlResult = sql2;
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러는:"+e.getMessage());
		}finally {
			if(rs != null)rs.close();
			if(stmt != null)stmt.close();
			if(conn != null)conn.close();
		}
		System.out.println("CategoryDAO Filter sql-->"+sqlResult);
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
			System.out.println(e.getMessage());
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
	public List<SearchClickDTO> selectMostClick() throws SQLException {
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
		String sql= "SELECT ca_code,ca_name FROM category START WITH ca_name = \'"+result+"\' CONNECT BY PRIOR ca_code=ca_code_ref order by ca_code asc";
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
	public List<Product_ImgSrcDTO> selectCodeSearch(String ca_code, String mem_id) throws SQLException {
		String sql = "select p.*,pi.*,NVL(l.product_id,0) from product p, product_image pi, (SELECT * FROM like_pro WHERE mem_id =?) l where p.product_id=pi.product_id and p.product_id = l.product_id(+) and ca_code=?";
		if(ca_code.equals("20100")||ca_code.equals("20200")||ca_code.equals("30100")||ca_code.equals("30200")) {
			sql = "select p.*,pi.*,NVL(l.product_id,0)\r\n"
					+ "from     product p,\r\n"
					+ "        product_image pi,\r\n"
					+ "        (SELECT * FROM like_pro WHERE mem_id =?) l,\r\n"
					+ "        (SELECT * FROM category WHERE ca_code_ref=?) c\r\n"
					+ "where p.ca_code = c.ca_code\r\n"
					+ "and  p.product_id=pi.product_id \r\n"
					+ "and p.product_id = l.product_id(+)\r\n";
		}
		List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		System.out.println("CategoryDAO selectCodeSearch-->"+sql);
		System.out.println("CategoryDAO ca_code-->"+ca_code);

		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			pstmt.setString(2, ca_code);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Product_ImgSrcDTO pd = new Product_ImgSrcDTO();
				pd.setProduct_id(rs.getInt(1));
				pd.setBrand(rs.getString(2));
				pd.setEng_name(rs.getString("eng_name"));
				pd.setKor_name(rs.getString("kor_name"));
				System.out.println("CategoryDAO kor_name-->"+rs.getString("kor_name"));

				pd.setGender(rs.getInt("gender"));
				pd.setPrice(rs.getInt("price"));
				pd.setColor(rs.getString("color"));
				pd.setRegdate(rs.getDate("regdate"));
				pd.setCa_code(rs.getInt("ca_code"));
				pd.setS_file_path(rs.getString("s_file_path"));
				pd.setL_file_path(rs.getString("l_file_path"));
				pd.setLike_product_id(rs.getInt("NVL(L.PRODUCT_ID,0)"));
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
	//최근검색어 출력하는 부분-->검색탭
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
	
	//찜한 상품 가져오기-->리스트 들어갔을때
	public List<LikeProDTO> selectLikeList(String mem_id) throws SQLException {
		List<LikeProDTO> likeList = new ArrayList<LikeProDTO>();
		String sql = "select product_id from like_pro where mem_id=?";
		Connection conn =null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mem_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				LikeProDTO lp = new LikeProDTO();
				lp.setProduct_id(rs.getString(1));
				likeList.add(lp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			if(rs !=null)rs.close();
			if(pstmt != null)pstmt.close();
			if(conn != null)conn.close();
		}
		
		return likeList;
	}
	
	
	
}
