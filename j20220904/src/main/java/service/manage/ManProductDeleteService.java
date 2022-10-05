package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.ProductDTO;
import dto.Product_ImgSrcDTO;

public class ManProductDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("~~ManProductDeleteService Start~~");
		
		try {
			// product_id, pd_size, pageNum Get
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			int pd_size = Integer.parseInt(request.getParameter("pd_size"));
			String pageNum = request.getParameter("pageNum");

			ProductDAO pd = ProductDAO.getInstance();
			Product_ImgSrcDTO product = pd.select(product_id, pd_size);
			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("product", product);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "manProductDelete.jsp";
	}
}