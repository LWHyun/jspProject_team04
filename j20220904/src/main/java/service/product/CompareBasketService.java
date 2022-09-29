package service.product;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BasketDAO;
import dao.ProductDAO;
import dto.BasketDTO;
import dto.BasketProDTO;

public class CompareBasketService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		String [] size_num = request.getParameterValues("size_num");
		BasketProDTO [] basketDTOArray = new BasketProDTO[size_num.length];
		
		System.out.println("product_id="+product_id);
		System.out.println("size_num"+size_num);
		
		
		//BasketDAO basketDAO = BasketDAO.getInstance();
		
		
		
		for(int i=0; i<size_num.length; i++)	{
			BasketProDTO basketProDTO = new BasketProDTO();
			basketProDTO.setProduct_id(product_id);
			basketProDTO.setMem_id(mem_id);
			basketProDTO.setSize_num(Integer.parseInt(size_num[i]));
			
		
			
			basketDTOArray[i] = basketProDTO;
			
			
		}
		System.out.println(Arrays.toString(basketDTOArray));
		
		
		try {
			BasketDAO basKetDAO = BasketDAO.getInstance();
			
		
		  List<BasketProDTO> list= basKetDAO.compareBasketList(mem_id);
				
		  System.out.println("list="+list);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return "";	
		
		
		
	
	}

}
