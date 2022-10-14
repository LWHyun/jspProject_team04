package service.manage;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
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
		
		String brandPath = request.getParameter("path_brand");		
		// 실제 파일 저장 경로
		System.out.println("path_brand : "+ brandPath);
		String savePath = request.getSession().getServletContext().getRealPath("/img/product_images/"+brandPath);
		System.out.println("savePath -> " + savePath);

		try {
			multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			Enumeration en = multi.getFileNames();
			
			// 서버에 저장된 파일 이름
			String serverSaveFileName = "";
			int count = 0;
			
			String filename = "";
			String nameSave = "";
			
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
				filename = multi.getFilesystemName(paraName);
				nameSave += filename+',';
			}
			
			System.out.println("파일명 두개다 잘 들어왔나 확인 ->"+nameSave);
			String[] imageName = nameSave.split(",");
			System.out.println("0번째에 s_file_path 잘 들어왔니? ->"+imageName[0]);
			System.out.println("1번째 -> " +imageName[1]);
				
				
//				int product_id = Integer.parseInt(request.getParameter("product_id"));
//				String s_file_path = imageName[0];
//				String l_file_path = imageName[1];				
				String size_num = multi.getParameter("size_check[]");
				String pd_size = multi.getParameter("pd_size");
//				String eng_name = request.getParameter("eng_name");
//				String kor_name = request.getParameter("kor_name");
//				int gender = Integer.parseInt(request.getParameter("gender"));
//				int price = Integer.parseInt(request.getParameter("price"));
//				String color = request.getParameter("color");
//				int ca_code = Integer.parseInt(request.getParameter("ca_code"));
//				int stock = Integer.parseInt(request.getParameter("stock"));
//				
//				System.out.println("size_num[]-> " + size_num);
				
				String[] size_num_arr = size_num.split(",");
				String[] pd_size_arr = pd_size.split(",");
				
				System.out.println("사이즈 넘버 배열 -> " +Arrays.toString(size_num_arr));
				System.out.println("진짜 사이즈 배열 -> " +Arrays.toString(pd_size_arr));

				int[] size_arr = Arrays.stream(size_num_arr).mapToInt(Integer::parseInt).toArray();
				int[] pdsize_arr = Arrays.stream(pd_size_arr).mapToInt(Integer::parseInt).toArray();
				
				// 파라미터 받는 값들, request -> multi로 대체
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
				
				productImgSrcDTO.setL_file_path("/j20220904/img/product_images/"+brandPath+"/"+imageName[1]);
				productImgSrcDTO.setS_file_path("/j20220904/img/product_images/"+brandPath+"/"+imageName[0]);
				
				List<Product_ImgSrcDTO> list = new ArrayList<Product_ImgSrcDTO>();
				for( int i = 0; i < size_arr.length; i++) {
					Product_ImgSrcDTO size_pd_size = new Product_ImgSrcDTO();
					size_pd_size.setSize_num(size_arr[i]);
					size_pd_size.setPd_size(pdsize_arr[i]);
					
					list.add(size_pd_size);
				}
				productImgSrcDTO.setList(list);
				productImgSrcDTO.setStock(Integer.parseInt(multi.getParameter("stock")));
				
				ProductDAO pd = ProductDAO.getInstance();
				int result = pd.registerProduct(productImgSrcDTO);
			
				
				request.setAttribute("product_id", productImgSrcDTO.getProduct_id());
				request.setAttribute("result", result);
				request.setAttribute("pageNum", pageNum);
				

//				request.setAttribute("l_file_path", productImgSrcDTO.getL_file_path());
//				request.setAttribute("s_file_path", imageName[0]);
//				request.setAttribute("size_num", productImgSrcDTO.getSize_num());
//				request.setAttribute("pd_size", productImgSrcDTO.getPd_size());
				request.setAttribute("eng_name", productImgSrcDTO.getEng_name());
				request.setAttribute("kor_name", productImgSrcDTO.getKor_name());
				request.setAttribute("gender", productImgSrcDTO.getGender());
//				request.setAttribute("price", productImgSrcDTO.getPrice());
				request.setAttribute("color", productImgSrcDTO.getColor());
				request.setAttribute("ca_code", productImgSrcDTO.getCa_code());
//				request.setAttribute("stock", productImgSrcDTO.getStock());
				
			
		} catch (Exception e) {
				System.out.println("ManProductRegisterProService e.getMessage() -> " + e.getMessage());
		}
		
		return "manProductRegisterPro.jsp";
	}
}
