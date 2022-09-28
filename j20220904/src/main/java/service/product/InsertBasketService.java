package service.product;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BasketDAO;
import dao.ProductDAO;
import dto.BasketDTO;

public class InsertBasketService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		String [] size_num = request.getParameterValues("size_num");
		String[] cnt = request.getParameterValues("number");
		BasketDTO [] basketDTOArray = new BasketDTO[cnt.length];
		
		System.out.println("product_id="+product_id);
		System.out.println("size_num"+size_num);
		System.out.println("cnt"+cnt);
		
		
		for(int i=0; i<cnt.length; i++)	{
			BasketDTO basketDTO = new BasketDTO();
			basketDTO.setProduct_id(product_id);
			basketDTO.setMem_id(mem_id);
			basketDTO.setSize_num(Integer.parseInt(size_num[i]));
			basketDTO.setCnt(Integer.parseInt(cnt[i]));
			
			basketDTO.setBrand(request.getParameter("brand"));
			basketDTO.setEng_name(request.getParameter("eng_name"));
			basketDTO.setKor_name(request.getParameter("kor_name"));
			basketDTO.setGender(Integer.parseInt(request.getParameter("gender")));
			basketDTO.setPrice(Integer.parseInt(request.getParameter("price")));
			
			basketDTOArray[i] = basketDTO;
		}
		
		System.out.println(Arrays.toString(basketDTOArray));
		
		BasketDAO basketDAO = BasketDAO.getInstance();
		ProductDAO productDAO = ProductDAO.getInstance();
		
		
		
		try {
			
			int result = productDAO.insertBasket(basketDTOArray);
			
			request.setAttribute("basketDTOArray",basketDTOArray);
			request.setAttribute("result", result);
			
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "/contents/resultBasket.jsp";
	}

}
