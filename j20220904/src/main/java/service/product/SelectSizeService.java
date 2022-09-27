package service.product;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.SizeDAO;
import dto.Product_SizeDTO;

public class SelectSizeService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("SelectSizeService Start...");

		try {
			SizeDAO sizeDAO = SizeDAO.getInstance();
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			int size = Integer.parseInt(request.getParameter("size"));
			int stock = Integer.parseInt(request.getParameter("stock"));
			int sizeStock = sizeDAO.showSize(product_id, size, stock);
			request.setAttribute("sizeStock", sizeStock);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "sizeStock";
	}

}
