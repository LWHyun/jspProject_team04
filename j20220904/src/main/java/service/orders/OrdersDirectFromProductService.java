package service.orders;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.OrdersInfoDAO;
import dto.BasketProDTO;
import dto.OrdersInfoDTO;

public class OrdersDirectFromProductService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		String[] size_num = request.getParameterValues("size_num");
		String[] cnt = request.getParameterValues("number");
		List<OrdersInfoDTO> pdDirectArr = new ArrayList<>();	 // 웹에서 가져온 상품배열
		
		// member정보 불러오기
		OrdersInfoDAO ordersDAO = OrdersInfoDAO.getInstance();
		request.setAttribute("members", ordersDAO.selectMemInfo(mem_id));
		
		OrdersInfoDTO ordersDTO = new OrdersInfoDTO();
		ordersDTO.setProduct_id(product_id);
		
		
		
		
		return null;
	}

}
