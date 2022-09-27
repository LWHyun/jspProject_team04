package service.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;

public class DeleteBasketItemService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 장바구니에 들어있는 상품을 삭제해야함. 그 결과를 DB에도 반영해야한다.
		// mem_id, product_id 필요 불러와야함
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		//로그인이 되어있으면
		
		// DB에서 장바구니 확인
		BasketDAO basketDAO = BasketDAO.getInstance();
		
		
	
		
		return null;
	}

}
