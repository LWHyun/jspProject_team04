package service.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;
import dto.BasketDTO;

public class DeleteBasketItemService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		// 장바구니에 들어있는 상품을 삭제해야함. 그 결과를 DB에도 반영해야한다.
		// mem_id, product_id size_num 필요 불러와야함
		
		//로그인 확인
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int size_num   = Integer.parseInt(request.getParameter("size_num"));
		
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		//로그인이 되어있으면
		
		// DB에서 장바구니 확인
		
		BasketDAO basketDAO = BasketDAO.getInstance();
		BasketDTO basketDTO = new BasketDTO();
		
		basketDTO.setMem_id(mem_id);
		basketDTO.setProduct_id(product_id);
		basketDTO.setSize_num(size_num);
		
		basketDAO.deleteItem(basketDTO);
		
		
		session.setAttribute("basketList", basketDAO.selectBasketList(mem_id));
		/*
		 * for( int i = 0; i < chklist.length; i++) basketDAO.deleteItem(basketDTO);
		 */
		
		return "basket.jsp";
	}

}
