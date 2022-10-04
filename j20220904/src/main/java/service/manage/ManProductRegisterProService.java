package service.manage;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import control.CommandProcess;
import dao.ProductDAO;
import dto.ProductDTO;
import dto.Product_ImgSrcDTO;

public class ManProductRegisterProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManProductRegisterProService 시작~~");
		request.setCharacterEncoding("UTF-8");
		
		// 파일 업로드 위해 cos.jar 추가 및 객체 생성
		MultipartRequest multi = null;
		
		// 업로드 될 파일의 최대 사이즈 (10메가)
		int maxSize = 10 * 1024 * 1024;
		
		// 파일이 업로드될 실제 tomcat 폴더 경로 (WebContent 기준)
		String realPath = request.getRealPath("../upload");
		System.out.println("realPath -> " + realPath);

		try {
			multi = new MultipartRequest(request, realPath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			
			} catch (Exception e) {
				e.printStackTrace();
			}
		
			// 서버에 저장된 파일 이름
			String filename = multi.getFilesystemName("filename");
			
			// 파라미터 받는 값들, request -> multi로 대체
			
			int cnt = 0;
			
			Product_ImgSrcDTO product = new Product_ImgSrcDTO();
			product.setProduct_id(Integer.parseInt(multi.getParameter("product_id")));
			product.setBrand(multi.getParameter("brand"));
			product.setEng_name(multi.getParameter("eng_name"));
			product.setKor_name(multi.getParameter("kor_name"));
			product.setGender(Integer.parseInt(multi.getParameter("gender")));
			product.setPrice(Integer.parseInt(multi.getParameter("price")));
			product.setColor(multi.getParameter("color"));
			product.setCa_code(Integer.parseInt(multi.getParameter("ca_code")));
			
			ProductDAO pd = ProductDAO.getInstance();
			
			//int result = pd.insert(product);
		
			return "manProductRegisterPro.jsp";
	}

}
