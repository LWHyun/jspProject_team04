package service.category;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.Product_ImgSrcDTO;

public class BuyNowService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//바로구매버튼 누를시 동작
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		System.out.println("BuyNowService product_id =>"+product_id);
		System.out.println("BuyNowService gender =>"+gender);
		
		ProductDAO productDAO = ProductDAO.getInstance();
		
		try {
			List<Product_ImgSrcDTO> list =  productDAO.selectImg(product_id, gender);
			request.setAttribute("buyNowList",list);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return "buyNow.jsp";
	}

}
