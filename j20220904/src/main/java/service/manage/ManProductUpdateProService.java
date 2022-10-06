package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;

public class ManProductUpdateProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManProductUpdateProService~~");
		
		request.setCharacterEncoding("UTF-8");
		
		try {
			int price = Integer.parseInt(request.getParameter("price"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			String pageNum = request.getParameter("pageNum");
			
			ProductDAO pd = ProductDAO.getInstance();
			int result = pd.update(price, stock);
			
			request.setAttribute("price", price);
			request.setAttribute("stock", stock);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	
		// View
		return "manProductUpdatePro.jsp";
	}

}
