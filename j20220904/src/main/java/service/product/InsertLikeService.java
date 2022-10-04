package service.product;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.LikeProDAO;
import dao.ProductDAO;

public class InsertLikeService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		ProductDAO productDAO = ProductDAO.getInstance();
		
		
		
		int result=0;
		//System.out.println("memid가 없을때="+mem_id);
	
			
		if(mem_id !=null || !("".equals(mem_id))) {
			try {
				
					result = productDAO.insertLike(product_id, mem_id);
					
					request.setAttribute("mem_id", mem_id);
					//request.setAttribute("gender", gender);
					request.setAttribute("product_id", product_id);
					
					
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
		
		}
		request.setAttribute("result", result);
		
			
		return "/contents/checkOk.jsp";
	}

}
