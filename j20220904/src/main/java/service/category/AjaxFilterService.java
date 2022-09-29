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

public class AjaxFilterService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] brandArray = request.getParameterValues("brandArray");
		String[] sizeArray = request.getParameterValues("sizeArray");
		
			CategoryDAO cd = CategoryDAO.getInstance();
			List<ProductDTO> filterList = null;
			try {
				filterList = cd.selectSearch(brandArray,sizeArray);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			request.setAttribute("filterList", filterList);
			
			
			
		
		return "ajax";
	}

}
