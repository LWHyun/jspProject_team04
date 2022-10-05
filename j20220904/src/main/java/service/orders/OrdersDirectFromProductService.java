package service.orders;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.OrdersInfoDAO;
import dto.BasketProDTO;
import dto.OrdersInfoDTO;

public class OrdersDirectFromProductService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("OrdersDirectFromProductService Start...");
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
				
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String[] size_num = request.getParameterValues("size_num");
		String[] cnt = request.getParameterValues("number");
		List<OrdersInfoDTO> pdDirectArr = new ArrayList<>();	 // 웹에서 가져온 상품배열
		
		OrdersInfoDAO ordersDAO = OrdersInfoDAO.getInstance();
		request.setAttribute("members", ordersDAO.selectMemInfo(mem_id));
		
		for(int i=0; i<size_num.length; i++)	{
			
			
			OrdersInfoDTO ordersInfoDTO = new OrdersInfoDTO();
			
			ordersInfoDTO.setProduct_id(product_id);
			ordersInfoDTO.setSize_num(Integer.parseInt(size_num[i]));
			ordersInfoDTO.setCnt(Integer.parseInt(cnt[i]));
			
			ordersDAO.selectProductInfo(ordersInfoDTO);
			pdDirectArr.add(ordersInfoDTO);
		}
		
		// member정보 불러오기
		
		
		request.setAttribute("pdDirectArr", pdDirectArr);
		
		return "/orders/ordersInfoDirectFromProduct.jsp";
	}

}
