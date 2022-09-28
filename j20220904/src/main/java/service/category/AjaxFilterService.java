package service.category;

import java.io.IOException;
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
			List<ProductDTO> filterList = cd.selectSearch(brandArray,sizeArray);
			request.setAttribute("filterList", filterList);
			
			
			
		
		return "ajax";
	}

}
