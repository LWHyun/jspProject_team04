package service.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;
import dto.BasketDTO;

public class UpdateBasketCntService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		// mem_id , product_id, cnt 값 가져오기
		String mem_id = (String)session.getAttribute("mem_id");
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int size_num = Integer.parseInt(request.getParameter("size_num"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		
		// cnt값을 DB에 저장
		BasketDAO basketDAO = BasketDAO.getInstance();
		BasketDTO basketDTO = new BasketDTO();
		basketDTO.setMem_id(mem_id);
		basketDTO.setProduct_id(product_id);
		basketDTO.setSize_num(size_num);
		basketDTO.setCnt(cnt);
		basketDAO.updateCnt(basketDTO);
		
		// 저장된 값을 가져간다
		
		// 세션에 장바구니 값을 저장
		request.setAttribute("basketList", basketDAO.selectBasketList(mem_id));

		
		// basket.jsp페이지로 돌아간다
		return "/basket/basket.jsp";
		
	}
}
