package service.brandList;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BrandListDAO;

public class RegisterLikeService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("registerService");
		BrandListDAO bld = BrandListDAO.getInstance();
		String product_id = request.getParameter("product_id");
		String mem_id = request.getParameter("mem_id");
		HttpSession session = request.getSession();
		
		int result = 0;
		
		System.out.println(product_id + "asdasd1234");
		
		try {
			result = bld.registerLike(Integer.parseInt(product_id), "asdasd1234");
			request.setAttribute("product_id", product_id);
			request.setAttribute("mem_id", mem_id);
			request.setAttribute("result", result);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println("ajax" + result);
		return String.valueOf(result);
	}

}
