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

public class OrdersPageService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 오류 체크 기점 확인용
		System.out.println("OrderPageService start...");
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		

		//DB연결
		BasketDAO basketDAO = BasketDAO.getInstance();
		OrdersInfoDAO ordersDAO = OrdersInfoDAO.getInstance();
		OrdersInfoDTO ordersDTO = new OrdersInfoDTO();
		
		ordersDTO = ordersDAO.selectMemInfo(mem_id);

		/*
		 * System.out.println("DAO selectMemInfo mem_id->"+ordersDTO.getMem_id());
		 * System.out.println("DAO selectMemInfo mem_name->"+ordersDTO.getMem_name());
		 * System.out.println("DAO selectMemInfo mem_tel->"+ordersDTO.getMem_tel());
		 * System.out.println("DAO selectMemInfo mem_email1->"+ordersDTO.getMem_email1());
		 * System.out.println("DAO selectMemInfo mem_email2->"+ordersDTO.getMem_email2());
		 */
		
		request.setAttribute("ordersDTO", ordersDTO);	
		
		//***

		//버튼을 눌렀을 때, 장바구니에 담긴 값을 가지고 이동해야함
		request.setAttribute("basketList", basketDAO.selectBasketList(mem_id));
		
		
		return "ordersInfo.jsp";
		
	}

}
