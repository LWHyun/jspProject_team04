package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.NoticeDAO;
import dao.ProductDAO;

public class ManProductDeleteProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("~~ManProductDeleteProService 시작~~");
		
		try {
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			int pd_size = Integer.parseInt(request.getParameter("pd_size"));
			String pageNum = request.getParameter("pageNum");
			
			ProductDAO pd = ProductDAO.getInstance();
			int result = pd.delete(product_id, pd_size);
			
			request.setAttribute("product_id", product_id);
			request.setAttribute("pd_size", pd_size);
			request.setAttribute("result", result);
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "manProductDeletePro.jsp";
	}
}