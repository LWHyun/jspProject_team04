package service.category;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.CategoryDAO;
import dto.ProductDTO;

public class WomenService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int gender = Integer.parseInt(request.getParameter("gender"));
		String result = null;
		if(gender == 0) {
			result = "남성용";
		}else {
			result ="여성용";
		}
		
		CategoryDAO cd = CategoryDAO.getInstance();
		
		try {
			List<ProductDTO> list = cd.selectSearch(gender);
			request.setAttribute("result", result);
			request.setAttribute("list", list);
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "women.jsp";
	}

}
