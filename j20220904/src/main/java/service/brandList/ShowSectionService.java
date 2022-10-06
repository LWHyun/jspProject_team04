package service.brandList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BrandListDAO;
import dto.Product_ImgSrcDTO;

public class ShowSectionService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
BrandListDAO bld = BrandListDAO.getInstance();
		
		int ca_code = Integer.parseInt(request.getParameter("ca_code"));
		
		
		try {
			String ca_name = bld.selectBrandName(ca_code);
			List<Product_ImgSrcDTO> list = bld.productList(ca_code);
			System.out.println("탔음?");
			System.out.println("list" + list);
			System.out.println(ca_name);

			request.setAttribute("ca_name", ca_name);
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "section.jsp";
	}

}
