package service.orders;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;
import dao.OrdersInfoDAO;
import dto.OrdersInfoDTO;

public class OrdersPageDirectService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 오류 체크 기점 확인용
		System.out.println("OrdersPageDirectService start...");
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		
		int product_id	= Integer.parseInt(request.getParameter("product_id"));
		int size_num	= Integer.parseInt(request.getParameter("size_num"));
		int cnt 		= Integer.parseInt(request.getParameter("cnt"));
		
		
		//DB연결
		BasketDAO basketDAO = BasketDAO.getInstance();
		OrdersInfoDAO ordersDAO = OrdersInfoDAO.getInstance();
		request.setAttribute("ordersDTO", ordersDAO.selectMemInfo(mem_id));
		
		//product_id값을 통해 상품에 해당하는 정보를 불러와야함
		OrdersInfoDTO ordersDTO = new OrdersInfoDTO();
		ordersDTO = ordersDAO.selectProductInfo(product_id);
		
		
		return "ordersInfoDirect.jsp";
	}

}
