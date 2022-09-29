package service.product;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BasketDAO;
import dao.ProductDAO;
import dto.BasketProDTO;

public class InsertBasketService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		String [] size_num = request.getParameterValues("size_num");
		String[] cnt = request.getParameterValues("number");
		List<BasketProDTO> webBkArray = new ArrayList<>();	 // 웹에서 가져온 상품배열
	
		List<BasketProDTO> insertBkArray =	new ArrayList<>(); // 진짜 넣어줄 상품 들어있는 배열
		
		System.out.println("product_id="+product_id);
		System.out.println("size_num"+size_num);
		System.out.println("cnt"+cnt);
		
		
//////////////////////////////////////////////////////////////////
/////////////////////상세페이지 상품이 장바구니에 있나 비교/////////////////////////////////////////
		
		
		for(int i=0; i<size_num.length; i++)	{
			BasketProDTO basketProDTO = new BasketProDTO();
			
			
			basketProDTO.setProduct_id(product_id);
			basketProDTO.setMem_id(mem_id);
			basketProDTO.setSize_num(Integer.parseInt(size_num[i]));
			
		
				
			webBkArray.add(basketProDTO);
			
			
		}
		//System.out.println(Arrays.toString(webBkArray));
		
		// 장바구니에 있는 상품 가져온 것 담는 배열
		List<BasketProDTO> list = null;
		try {
			BasketDAO basKetDAO = BasketDAO.getInstance();
			
		
			list = basKetDAO.compareBasketList(mem_id);
				
		  //System.out.println("list="+list);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		// 장바구니와 웹에서 가져온 것 비교 메서드 (1 : 담기가능 / 2,3 : 담기불가능 )
		int result = compareBK(webBkArray, list);
		
////////////////////////////////////////////////////////////////
/////////////////////insert////////////////////////////////////
		
		// 장바구니에 담겨있지 않은 애들 insert 하는 로직
		if(result == 1) {
			
			for(int i = 0; i < webBkArray.size(); i++) {
				if(!list.contains(webBkArray.get(i))) {
					BasketProDTO basketProDTO = new BasketProDTO();
					
					basketProDTO.setProduct_id(product_id);
					basketProDTO.setMem_id(mem_id);
					basketProDTO.setSize_num(Integer.parseInt(size_num[i]));
					basketProDTO.setCnt(Integer.parseInt(cnt[i]));
					insertBkArray.add(basketProDTO);
				}
			}
			
			System.out.println("insertBkArray="+insertBkArray);
			
			ProductDAO productDAO = ProductDAO.getInstance();
			try {
				
				productDAO.insertBasket(insertBkArray);
				
				request.setAttribute("basketDTOArray",insertBkArray);
				request.setAttribute("result", result);
				
			
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		request.setAttribute("result", result);
		
		return "/contents/resultBasket.jsp";

	}
	
	private int compareBK(List<BasketProDTO> webBkArray, List<BasketProDTO> list) {
		
		// 다 담겨 있는 경우
		if(list.containsAll(webBkArray)) {
			return 2;
		}
		
		// 담겨 있지 않은 상품이 포함된 경우  
		for(int i = 0; i < webBkArray.size(); i++) {
			if(!list.contains(webBkArray.get(i))) {
				return 1;
			}
		}
		
		// 아무것도 안 담고 장바구니 버튼을 눌렀을 경우
		return 0;
	}
}
