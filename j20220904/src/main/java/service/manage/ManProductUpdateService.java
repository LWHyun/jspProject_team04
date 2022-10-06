package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.Product_ImgSrcDTO;

public class ManProductUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManProductUpdateService 시작~~");
		System.out.println("ManProductUpdateService product_id->"+request.getParameter("product_id"));
		System.out.println("ManProductUpdateService pd_size->"+request.getParameter("pd_size"));
		System.out.println("ManProductUpdateService price->"+request.getParameter("price"));
		System.out.println("ManProductUpdateService stock->"+request.getParameter("stock"));

		try {
			// GET price, stock
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			int pd_size = Integer.parseInt(request.getParameter("pd_size"));
			long price =  Long.parseLong(request.getParameter("price"));
			int  stock = Integer.parseInt(request.getParameter("stock"));
			System.out.println("ManProductUpdateService product_id->"+product_id);
			System.out.println("ManProductUpdateService pd_size->"+pd_size);
			System.out.println("ManProductUpdateService price->"+price);
			System.out.println("ManProductUpdateService stock->"+stock);
			String pageNum = request.getParameter("pageNum");
			
			// ProductDAO pd = ProductDAO.getInstance();
			// Product_ImgSrcDTO product = pd.select(product_id, pd_size);
			
			request.setAttribute("pageNum",    pageNum);
			request.setAttribute("product_id", product_id);
			request.setAttribute("pd_size",    pd_size);
			request.setAttribute("price",      price);
			request.setAttribute("stock",      stock);
			//request.setAttribute("product", product);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		// View
		return "manProductUpdate.jsp";
	}
}