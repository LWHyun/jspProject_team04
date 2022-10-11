package service.brandList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BrandListDaO;
import dto.Product_ImgSrcDTO;

public class ShowSectionService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BrandListDaO bld = BrandListDaO.getInstance();
		System.out.println("ShowSectionService start..");
		
		try {
			List<Product_ImgSrcDTO> list = bld.sectionList();
			System.out.println("탔음 list" + list);

			request.setAttribute("list", list);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "/contents/sectionAjax.jsp";
	}

}
