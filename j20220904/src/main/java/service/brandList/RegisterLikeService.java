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
		HttpSession session = request.getSession();
		BrandListDAO bld = BrandListDAO.getInstance();
		String product_id = request.getParameter("product_id");
		String mem_id = (String) session.getAttribute("mem_id");

		int result = 0;
		if (mem_id == null) {
			result = -1;
			System.out.println("로그인 안됨" + result);
			request.setAttribute("result", result);
			return "ajaxajax.jsp";
		} 
		System.out.println("mem_id + " + mem_id);
		System.out.println(product_id + "asdasd1234");
		
			try {
				result = bld.registerLike(Integer.parseInt(product_id), mem_id);
				request.setAttribute("product_id", product_id);
				request.setAttribute("mem_id", mem_id);
				request.setAttribute("result", result);
				System.out.println("ajax service = " + result);
			} catch (Exception e) {
				System.out.println(e.getMessage());
			}
		System.out.println("ajax return = " + result);
		return "ajaxajax.jsp";
	}

}
