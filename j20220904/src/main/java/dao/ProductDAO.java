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
import javax.naming.NamingException;
import javax.sql.DataSource;

import dto.BasketDTO;
import dto.BasketProDTO;
import dto.NoticeDTO;
import dto.ProductDTO;

import dto.ProductDTO;
import dto.Product_ImgDTO;
import dto.Product_ImgSrcDTO;
import dto.Product_Like_ProDTO;


public class ProductDAO {
   private static ProductDAO instance;
   
    
   //외부에서 접근 못하게 private로 기본생성자 생성
   private ProductDAO() {
      
   }
   
   public static ProductDAO getInstance()   {
      if(instance == null) {
         instance = new ProductDAO();
      }
      return instance;
   }
   
   
   private Connection getConnection() throws SQLException   {
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
   
   //상품테이블,상품이미지테이블 상세 정보,상품 재고 다 가져오는 메서드 
   public List<Product_ImgSrcDTO> selectImg(int product_id,int gender) throws SQLException {
      String sql = "select p.product_id, p.brand,p.eng_name,p.kor_name,p.gender,p.price,p.color,p.regdate,p.ca_code,\r\n"
            + "i.s_file_path,i.l_file_path,ps.size_num,ps.pd_size,ps.stock from product p\r\n"
            + "join product_image i on p.product_id = i.product_id\r\n"
            + "join product_size ps on ps.product_id = i.product_id\r\n"
            + "where p.product_id=? and p.gender=?";
      
      
      
      
      PreparedStatement pstmt = null;
      Connection conn = this.getConnection();
      ResultSet rs = null;
      
      
      List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
            
      
         try {   
            
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,product_id);
            pstmt.setInt(2,gender);
            
            rs = pstmt.executeQuery();
            System.out.println("오냐?");
            while(rs.next()) {
               
               /*
                * Product_ImgDTO p = new Product_ImgDTO(); ProductDTO productDTO = new
                * ProductDTO();
                */
               /*
                * p.setPro_image(rs.getInt("pro_image_id"));
                * p.setProduct_id(rs.getInt("product_id"));
                */
               
               
               
               Product_ImgSrcDTO pro = new Product_ImgSrcDTO();
            
               
               
               
               
               pro.setS_file_path(rs.getString("s_file_path"));
               pro.setL_file_path(rs.getString("l_file_path"));
               
               pro.setProduct_id(rs.getInt("product_id"));
               pro.setBrand(rs.getString("brand"));
               pro.setEng_name(rs.getString("eng_name"));
               pro.setKor_name(rs.getString("kor_name"));
               pro.setGender(rs.getInt("gender"));
               pro.setPrice(rs.getLong("price"));
               pro.setColor(rs.getString("color"));
               pro.setRegdate(rs.getDate("regdate"));
               pro.setCa_code(rs.getLong("ca_code"));
               
               pro.setSize_num(rs.getInt("size_num"));
               pro.setPd_size(rs.getInt("pd_size"));
               pro.setStock(rs.getInt("stock"));
               
            
               
               list.add(pro); 
               
               //System.out.println("list=>"+ list);
             
            }
      }catch(SQLException e) {
         e.printStackTrace();
      }
      
      
         return list;
      
   }
   
   
   //찜한제품 insert 하는 메서드
   public int insertLike(int product_id,String mem_id) throws SQLException {
      PreparedStatement pstmt = null;
      Connection conn = this.getConnection();
      String sql = "insert into like_pro(product_id,mem_id,like_pro_date) values(?,?,sysdate)";
      
      int result = 0;
      
      
      try {
         
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,product_id);
         pstmt.setString(2,mem_id);
      
         
         result =pstmt.executeUpdate();
         
         
      }catch(Exception e) {
         e.printStackTrace();   
      }finally {
         close(pstmt,conn);
      }
      return result;
   }
      
   
      //찜한제품 delete 하는 메서드
   public int deleteLike(int product_id, String mem_id) throws SQLException {
      PreparedStatement pstmt = null;
      Connection conn = this.getConnection();
      String sql = "delete from like_pro where product_id=? and mem_id=?";
      
      int result = 0;
      
      try {
         
         
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1,product_id);
         pstmt.setString(2,mem_id);
      
         
         result =pstmt.executeUpdate();
         
         
      }catch(Exception e) {
         e.printStackTrace();   
      }finally {
         close(pstmt,conn);
      }
      return result;
   
   }
   
   //찜한제품에 대한 상품select 하는 메서드
   public List<ProductDTO> selectLike(int product_id,String mem_id) throws SQLException{
      
      String sql = "select * from product p, like_pro l where p.product_id = l.product_id";
      
      PreparedStatement pstmt = null;
      Connection conn = this.getConnection();
      ResultSet rs = null;
      List<ProductDTO> list = new ArrayList<ProductDTO>();
      
      try {
         pstmt= conn.prepareStatement(sql);
         
         rs = pstmt.executeQuery();
         
         
         while(rs.next()) {
            ProductDTO productDTO = new ProductDTO();
            
            productDTO.setProduct_id(rs.getInt("product_id"));
            productDTO.setBrand(rs.getString("brand"));
            productDTO.setEng_name(rs.getString("eng_name"));
            productDTO.setKor_name(rs.getString("kor_name"));
            productDTO.setGender(rs.getInt("gender"));
            productDTO.setPrice(rs.getLong("price"));
            productDTO.setColor(rs.getString("color"));
            productDTO.setRegdate(rs.getDate("regdate"));
            productDTO.setCa_code(rs.getLong("ca_code"));
            
            list.add(productDTO);
         }
      }catch(Exception e) {
         e.printStackTrace();
      }finally {
         close(rs,pstmt,conn);
      }
      
      return list;
      
   }
   
   //찜한제품 총갯수 구하는 메서드
   public int selectCountLike(int product_id,String mem_id) throws SQLException {
      
      String sql = "select count(*) from like_pro where product_id=? and mem_id=?";
      PreparedStatement pstmt = null;
      Connection conn = this.getConnection();
      ResultSet rs = null;
      int result = 0;
      
      try {
         pstmt= conn.prepareStatement(sql);
         
         pstmt.setInt(1, product_id);
         pstmt.setString(2, mem_id);
         
         rs = pstmt.executeQuery();
         
         if(rs.next()) {
            result=rs.getInt(1);
         }
         
      }catch(Exception e) {
         
      }finally {
         close(rs,pstmt,conn);
      }
      return result;
      
   }
   
   //상세페이지에서 장바구니에 상품 insert 메서드
   public int insertBasket(List<BasketProDTO> basketDTOArray) throws SQLException {
      
      PreparedStatement pstmt = null;
      Connection conn = this.getConnection();
      
      String sql = "insert into basket values(?,?,?,?)";
      
      int result = 0;
      int i= 0;
      try {
         
         
      
         
         for(i=0; i<basketDTOArray.size(); i++)   {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,basketDTOArray.get(i).getSize_num());
            pstmt.setInt(2,basketDTOArray.get(i).getProduct_id());
            pstmt.setString(3,basketDTOArray.get(i).getMem_id());
            pstmt.setInt(4,basketDTOArray.get(i).getCnt());
            
            result =pstmt.executeUpdate();
         
            System.out.println("result"+result);
         }
         
      
      
         
      }catch(Exception e) {
         e.printStackTrace();   
      }finally {
         close(pstmt,conn);
      }
      return result;
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

   
   public List<ProductDAO> insertProduct() throws SQLException {
      List<ProductDAO> list =  new ArrayList<ProductDAO>();
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      String sql = "SELECT p.product_id, p.brand, p.eng_name, p.kor_name, p.gender, p.price, p.color, pi.s_file_path, pi.l_file_path\r\n"
            + "FROM product p, product_image pi\r\n"
            + "WHERE p.product_id = pi.product_id\r\n"
            + "AND p.brand = 'NIKE'";
      try {
         conn = getConnection();
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         if (rs.next()) {
            
            rs.getInt(1);
            rs.getString(2);
            rs.getString(3);
            rs.getString(4);
            rs.getInt(5);
            rs.getLong(6);
            rs.getString(7);
            rs.getString(8);
            rs.getString(8);
         }
      } catch (Exception e) {
         System.out.println(e.getMessage());
      } finally {
         if(rs !=null) rs.close();
         if(stmt != null) stmt.close();
         if(conn != null) conn.close();
      }
      
      return list;
         
   }
   
   public List<Product_ImgSrcDTO> selectCa_code(int ca_code) throws SQLException {
      ArrayList<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
      Connection conn = null;
      PreparedStatement pstmt = null;
      String sql = "select p.* from product p where p.brand=(select ca_name from category where ca_code=?)";
      ResultSet rs = null;
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, ca_code);
         
         rs = pstmt.executeQuery();
         while (rs.next()) {
            Product_ImgSrcDTO product_ImgSrcDTO = new Product_ImgSrcDTO();
            product_ImgSrcDTO.setProduct_id(rs.getInt(1));
            product_ImgSrcDTO.setBrand(rs.getString(2));
            product_ImgSrcDTO.setEng_name(rs.getString(3));
            product_ImgSrcDTO.setKor_name(rs.getString(4));
            product_ImgSrcDTO.setGender(rs.getInt(5));
            product_ImgSrcDTO.setPrice(rs.getLong(6));
            product_ImgSrcDTO.setColor(rs.getString(7));
            product_ImgSrcDTO.setRegdate(rs.getDate(8));
            product_ImgSrcDTO.setCa_code(rs.getInt(9));;
            list.add(product_ImgSrcDTO);
         }
         
      } catch (SQLException e) {
         e.printStackTrace();
      } finally {
         if(rs !=null) rs.close();
         if(pstmt != null) pstmt.close();
         if(conn != null) conn.close();
      }
      return list;
      
      
      
      
   }
   
   // 페이징 처리 위한 총 갯수 반환 메소드
   public int getTotalCnt() throws SQLException {
      Connection conn = null;   
      Statement stmt= null; 
      ResultSet rs = null;    
      int tot = 0;
      String sql = "SELECT count(*) FROM product";
      try {
         conn = getConnection();
         stmt = conn.createStatement();
         rs = stmt.executeQuery(sql);
         if (rs.next()) tot = rs.getInt(1);
      } catch(Exception e) {   
         System.out.println(e.getMessage()); 
      } finally {
         if (rs !=null) rs.close();
         if (stmt != null) stmt.close();
         if (conn !=null) conn.close();
      }
      return tot;
   }
   
   
   
   // [관리자] 상품목록 한 페이지 데이터 가져오기
   public List<ProductDTO> productList(int startRow, int endRow) throws SQLException {
      
      List<ProductDTO> list = new ArrayList<ProductDTO>();
      
      Connection conn = null;   
      PreparedStatement pstmt= null;
      ResultSet rs = null;

      // 가져올 정보 : 제품코드 | 브랜드 | 한글이름 | 가격 | 색상 | 카테고리 코드
      // SELECT UNIQUE(product_id), brand, kor_name, price, ca_code FROM product
      String sql = "SELECT * FROM (SELECT rownum rn, a.* "
            + "                FROM(select UNIQUE(product_id), brand, kor_name, gender, price, color, ca_code from product order by brand) a)"
            + "     WHERE rn BETWEEN ? AND ?";
            
         try {   
            conn = getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, startRow);
            pstmt.setInt(2, endRow);
            
            rs = pstmt.executeQuery();
            
            while(rs.next()) {
               
               ProductDTO pro = new ProductDTO();
            
               pro.setProduct_id(rs.getInt("product_id"));
               pro.setBrand(rs.getString("brand"));
               pro.setKor_name(rs.getString("kor_name"));
               pro.setGender(rs.getInt("gender"));
               pro.setPrice(rs.getLong("price"));
               pro.setColor(rs.getString("color"));
               pro.setCa_code(rs.getLong("ca_code"));
                              
               list.add(pro); 
            }
      } catch(SQLException e) {
         e.printStackTrace();
      } finally {
         if (rs !=null) rs.close();
         if (pstmt != null) pstmt.close();
         if (conn !=null) conn.close();
      } 
         return list;
   }

   
   // [관리자] PRODUCT 테이블에서 상품 선택하기
   public ProductDTO select(int product_id) throws SQLException {
      Connection conn = null;
      Statement stmt = null;
      ResultSet rs = null;
      
      String sql = "SELECT * FROM product WHERE product_id=" + product_id;
      
      ProductDTO product = new ProductDTO();
      
      try {
         conn = getConnection();
         stmt = conn.createStatement();
         rs   = stmt.executeQuery(sql);
         
         if(rs.next()) {
            product.setProduct_id(rs.getInt("product_id"));
            product.setBrand(rs.getString("brand"));
            product.setEng_name(rs.getString("eng_name"));
            product.setKor_name(rs.getString("kor_name"));
            product.setGender(rs.getInt("gender"));
            product.setPrice(rs.getInt("price"));
            product.setColor(rs.getString("color"));
            product.setRegdate(rs.getDate("regdate"));
            product.setCa_code(rs.getInt("ca_code"));
         }
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         if (rs !=null)    rs.close();
         if (stmt != null) stmt.close();
         if (conn !=null)  conn.close();
      }
      return product;
   }

   // [관리자] 상품 삭제 메소드
   public int delete(int product_id) throws SQLException {
      Connection conn = null;
      PreparedStatement pstmt = null;
      int result = 0;
      
      String sql = "DELETE FROM product WHERE product_id=?";
      
      try {
         conn = getConnection();
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, product_id);
         result = pstmt.executeUpdate();
         
      } catch (Exception e) {
         e.printStackTrace();
      } finally {
         if (pstmt != null) pstmt.close();
         if (conn !=null)   conn.close();
      }
      return result;
   }
   

   
}