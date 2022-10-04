package service.basket;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;
import dto.BasketDTO;

public class DeleteChkBasketItemService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		System.out.println("DeleteChkBasketItemService start...");
		
		//로그인 확인
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		
		String chkStr = request.getParameter("chkStr");
		String[] chkItem = chkStr.split(",");
		
		BasketDAO basketDAO = BasketDAO.getInstance();
		
		for ( int i = 0; i < chkItem.length/2 ; i++) {
		  BasketDTO basketDTO = new BasketDTO();
		  basketDTO.setMem_id(mem_id);
		  basketDTO.setProduct_id(Integer.parseInt(chkItem[2*i]));
		  basketDTO.setSize_num(Integer.parseInt(chkItem[2*i+1]));
		  basketDAO.deleteItem(basketDTO);
		  
		}
		 
		request.setAttribute("basketList", basketDAO.selectBasketList(mem_id));
		
		return "/basket/basket.jsp";
	}

}
