package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.Product_ImgSrcDTO;

public class ManProductUpdateProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManProductUpdateProService~~");
		
		request.setCharacterEncoding("UTF-8");
		String pageNum = request.getParameter("pageNum");
		
		try {
			Product_ImgSrcDTO productImgDTO = new Product_ImgSrcDTO();

			productImgDTO.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
			productImgDTO.setPd_size(Integer.parseInt(request.getParameter("pd_size")));
			productImgDTO.setPrice(Long.parseLong(request.getParameter("price")));
			productImgDTO.setStock(Integer.parseInt(request.getParameter("stock")));
			
			ProductDAO pd = ProductDAO.getInstance();
			int result = pd.update(productImgDTO);

			System.out.println("ManProductUpdateProService result->"+result);

			request.setAttribute("result", result);
			request.setAttribute("product_id", productImgDTO.getProduct_id());
			request.setAttribute("pd_size", productImgDTO.getPd_size());
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		// View
		return "manProductUpdatePro.jsp";
	}

}
