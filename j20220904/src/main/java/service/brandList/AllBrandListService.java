package service.brandList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BrandListDaO;
import dto.Product_ImgSrcDTO;

public class AllBrandListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("--------AllBrandListService-------");
		BrandListDaO bld = BrandListDaO.getInstance();
		
		try {
			HttpSession session = request.getSession();
			
			int ca_code = Integer.parseInt(request.getParameter("ca_code"));
			String mem_id = (String) session.getAttribute("mem_id");

			System.out.println("mem_id는? -> " + mem_id);
			
			List<Product_ImgSrcDTO> list = bld.brandList(ca_code, mem_id);
			System.out.println("list" + list);			
			request.setAttribute("list", list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "AllBrand.jsp";
	}

}
