package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.ProductDTO;

public class ManProductDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("~~ManProductDeleteService Start~~");
		
		try {
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			String pageNum = request.getParameter("pageNum");
			
			ProductDAO pd = ProductDAO.getInstance();
			ProductDTO product = pd.select(product_id);
			
			request.setAttribute("product_id", product_id);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("product", product);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "manProductDelete.jsp";
	}
}