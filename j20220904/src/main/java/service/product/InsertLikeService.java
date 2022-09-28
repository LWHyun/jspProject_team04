package service.product;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;

public class InsertLikeService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		try {
			
			int result = productDAO.insertLike(product_id, mem_id);
			
			request.setAttribute("mem_id", mem_id);
			request.setAttribute("product_id", product_id);
			request.setAttribute("result", result);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return "/contents/contents_men.jsp";
	}

}
