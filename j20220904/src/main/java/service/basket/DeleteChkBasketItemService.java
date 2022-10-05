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
		
		//.jsp에서 받아온 값
		String chkStr = request.getParameter("chkStr");
		String[] chkItem = chkStr.split(",");
		// ,마다 구분해서 chkItem 배열에 값을 담음		 
		//					0		,			1			,				2		,			3			...
		//[ 첫번째 체크박스의 product_id, 첫번째 체크박스의 size_num, 두번째 체크박스의 product_id, 두번째 체크박스의 size_num ...]
		
		BasketDAO basketDAO = BasketDAO.getInstance();
		
		for ( int i = 0; i < chkItem.length/2 ; i++) {		// 두 개씩 묶어서 값을 가져가 반복문이 돌아야 하므로 length는 2로 나누어야함
		  BasketDTO basketDTO = new BasketDTO();
		  basketDTO.setMem_id(mem_id);
		  basketDTO.setProduct_id(Integer.parseInt(chkItem[2*i]));	// product_id는 0,2,4...번째 값에 담기므로 2*i
		  basketDTO.setSize_num(Integer.parseInt(chkItem[2*i+1]));	// size_num은 1,3,5..번째 값에 담기므로 2*i+1
		  basketDAO.deleteItem(basketDTO);	// 해당하는 product_id, size_num을 가지고 단건 삭제 반복문을 돌면 삭제됨
		  
		}
		 
		// 선택 삭제 진행하고 남은 장바구니 그대로 가져가야함
		request.setAttribute("basketList", basketDAO.selectBasketList(mem_id));
		
		return "/basket/basket.jsp";
	}

}
