package service.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Redirect;

import control.CommandProcess;
import dao.BasketDAO;

public class BasketService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		System.out.println("BasketService start...");
		//로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		//로그인이 되어있으면
		
		// DB에서 장바구니 확인
		BasketDAO basketDAO = BasketDAO.getInstance();
		
		
		// 세션에 장바구니 값을 저장
		session.setAttribute("basketList", basketDAO.selectBasketList(mem_id));
		// 장바구니 페이지 이동
		
		
		return "/basket/basket.jsp";
	}
	
}
