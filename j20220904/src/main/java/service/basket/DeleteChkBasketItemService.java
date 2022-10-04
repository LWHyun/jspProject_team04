package service.basket;

import java.io.IOException;
import java.sql.Array;
import java.util.ArrayList;
import java.util.List;

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
		
		String[] checks = request.getParameterValues("rowCheck1");
		String[] product_id = request.getParameterValues("item_product_id");
		String[] size_num = request.getParameterValues("item_size_num");
		
		BasketDAO basketDAO = BasketDAO.getInstance();
		BasketDTO basketDTO = new BasketDTO();
		
		for(int i = 0; i < checks.length ; i++) {
			
			basketDTO.setMem_id(mem_id);
			basketDTO.setProduct_id(Integer.parseInt(product_id[i]));
			basketDTO.setSize_num(Integer.parseInt(size_num[i]));
		}
		
		basketDAO.delChkItem(basketDTO);
		
		return "basket.jsp";
	}

}
