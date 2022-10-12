package service.brandList;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BrandListDaO;
import dto.Product_ImgSrcDTO;

public class BuyProductNowService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		System.out.println("product_id는 " + product_id);

		try {
			BrandListDaO bld = BrandListDaO.getInstance();
			List<Product_ImgSrcDTO> bist = bld.selectBuy(product_id);
			request.setAttribute("bist", bist);
			System.out.println("bist -> " + bist);
			System.out.println("bist length ->"+bist.size());
			System.out.println("이미지 + " + bist.get(0).getS_file_path());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return "buyNowModal.jsp";
	}

}
