package service.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.SizeDAO;

public class NoStockService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("NoStockService Start...");
		int sizeStock = 0;
		try {
			SizeDAO sizeDAO = SizeDAO.getInstance();
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			System.out.println("product_id" + product_id);
			int pd_size = Integer.parseInt(request.getParameter("pd_size"));
			System.out.println("pd_size" + pd_size);
			sizeStock = sizeDAO.showSize(product_id, pd_size);
			System.out.println("sizeStock의 값 = " + sizeStock);
			request.setAttribute("sizeStock", sizeStock);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		System.out.println(sizeStock);
		return String.valueOf(sizeStock);
	}

}
