package product.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dto.ProductDTO;
import dto.Product_ImgDTO;
import dto.Product_ImgSrcDTO;
import dao.ProductDao;

public class ImageListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		try {
			ProductDao productDao = ProductDao.getInstance();
			
			List<Product_ImgSrcDTO> list =  productDao.selectImg(product_id);
			
			
			request.setAttribute("product_id",product_id);
			request.setAttribute("list",list);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		//View
		return "/contents/contents_men.jsp";
	}

}
