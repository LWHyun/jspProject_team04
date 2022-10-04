package service.brandList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.Product_ImgSrcDTO;

public class BrandListContentsService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		ProductDAO bd = ProductDAO.getInstance();
		
		int ca_code = Integer.parseInt(request.getParameter("ca_code"));
		
		try {
			List<Product_ImgSrcDTO> list = bd.selectCa_code(ca_code);
			request.setAttribute("Alex", list);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		return "brandPdList.jsp";
	}

}
