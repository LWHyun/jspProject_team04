package service.manage;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control.CommandProcess;
import dao.ProductDAO;
import dto.Product_ImgSrcDTO;

public class ManProductRegisterProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManProductRegisterProService 시작~~");
		
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		
		// 파일 업로드 위해 cos.jar 추가 및 객체 생성
		MultipartRequest multi = null;
		
		// 업로드 될 파일의 최대 사이즈 (10메가)
		int maxSize = 10 * 1024 * 1024;
		
		// 실제 파일 저장 경로
		String savePath = request.getSession().getServletContext().getRealPath("../img/product_images");
		System.out.println("savePath -> " + savePath);

		try {
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration en = multi.getFileNames();
			
			// 서버에 저장된 파일 이름
			String serverSaveFileName = "";
			
			while(en.hasMoreElements()) {
				// input 태그의 속성이 file인 태그의 name 속성값 : 파라미터명
				String paraName = (String)en.nextElement();
				
				// 서버에 저장된 파일명
				serverSaveFileName = multi.getFilesystemName(paraName);	
				
				//전송 전 원래의 파일명
				String original = multi.getOriginalFileName(paraName);
				
				// 전송된 파일의 내용 타입
				String type = multi.getContentType(paraName);
				
				// 전송된 파일 속성이 file인 태그의 name 속성값을 이용해 파일 객체 생성
				File file = multi.getFile(paraName);
				 
				System.out.println("savePath > " + savePath);
				System.out.println("실제 파일명 : paraName > " + paraName);
				System.out.println("저장된 파일명 : serverSaveFileName > " + serverSaveFileName);
				System.out.println("파일타입 : " + type);
			
				// 서버에 저장된 파일명
				String filename = multi.getFilesystemName("filename");
				
				// 파라미터 받는 값들, request -> multi로 대체
				// 제품코드 | 브랜드 | 영어이름 | 한글이름 | 성별 | 가격 | 색상 | 카테고리 코드
				// 상품 대표 이미지 등록 | 상품 상세 이미지 등록
				Product_ImgSrcDTO productImgSrcDTO = new Product_ImgSrcDTO();
				
				productImgSrcDTO.setProduct_id(Integer.parseInt(multi.getParameter("product_id")));
				productImgSrcDTO.setBrand(multi.getParameter("brand"));
				productImgSrcDTO.setEng_name(multi.getParameter("eng_name"));
				productImgSrcDTO.setKor_name(multi.getParameter("kor_name"));
				productImgSrcDTO.setGender(Integer.parseInt(multi.getParameter("gender")));
				productImgSrcDTO.setPrice(Long.parseLong(multi.getParameter("price")));
				productImgSrcDTO.setColor(multi.getParameter("color"));
				productImgSrcDTO.setCa_code(Integer.parseInt(multi.getParameter("ca_code")));
				
				productImgSrcDTO.setPro_image_id(Integer.parseInt(multi.getParameter("pro_image_id")));
				productImgSrcDTO.setL_file_path(multi.getParameter("l_file_path"));
				productImgSrcDTO.setS_file_path(multi.getParameter("s_file_path"));
				
				
				ProductDAO pd = ProductDAO.getInstance();
				int result = pd.registerProduct(productImgSrcDTO);
			
				
				request.setAttribute("product_id", productImgSrcDTO.getProduct_id());
				request.setAttribute("pro_image_id", productImgSrcDTO.getPro_image_id());
				request.setAttribute("result", result);
				request.setAttribute("pageNum", pageNum);
			}
		} catch (Exception e) {
				System.out.println("ManProductRegisterProService e.getMessage() -> " + e.getMessage());
		}
		
		return "manProductRegisterPro.jsp";
	}
}
