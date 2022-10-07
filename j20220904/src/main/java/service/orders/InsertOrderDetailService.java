package service.orders;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.OrdersDAO;
import dto.OrdersDTO;
import dto.OrdersDetailDTO;
import dto.OrdersInfoDTO;

public class InsertOrderDetailService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 오류 체크 기점 확인용
		System.out.println("InsertOrderDetailService start...");
		
		// 로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		
		System.out.println("InsertOrderDetailService product_id Before ...");
		String[] product_id= request.getParameterValues("product_id");
		System.out.println("InsertOrderDetailService product_id.length->"+product_id.length);
     	System.out.println("InsertOrderDetailService product_id[0]->"+product_id[0]);
		String[] size_num = request.getParameterValues("size_num");
		String[] cnt = request.getParameterValues("cnt");
		String[] order_price = request.getParameterValues("order_price");
		System.out.println("product_id="+Arrays.toString(product_id));
		System.out.println("size_num="+Arrays.toString(size_num));
		System.out.println("cnt="+Arrays.toString(cnt));
		System.out.println("order_price="+Arrays.toString(order_price));
		List<OrdersDetailDTO> toOrdersArr = new ArrayList<>();
//		
		String order_name = request.getParameter("buyername");
		String order_phone = request.getParameter("buyerphone");
		String order_email = request.getParameter("buyermail");
		String take_name = request.getParameter("receiver_name");
		String take_phone = request.getParameter("receiver_phone");
//		String take_add = request.getParameter("take_add");
//		String order_msg = request.getParameter("msgList");
		
		OrdersDAO ordersDAO = OrdersDAO.getInstance();
		OrdersDTO ordersDTO = new OrdersDTO();
		
		
		ordersDTO.setMem_id(mem_id);
		ordersDTO.setOrder_name(order_name);
		ordersDTO.setOrder_phone(order_phone);
		ordersDTO.setOrder_email(order_email);
		ordersDTO.setTake_name(take_name);
		ordersDTO.setTake_phone(take_phone);
//		ordersDTO.setTake_add(take_add);
//		ordersDTO.setOrder_msg(order_msg);
//		
		for(int i = 0; i < size_num.length; i++) {
		
			OrdersDetailDTO odDTO = new OrdersDetailDTO();
			
			odDTO.setProduct_id(Integer.parseInt(product_id[i]));
			odDTO.setSize_num(Integer.parseInt(size_num[i]));
			odDTO.setCnt(Integer.parseInt(cnt[i]));
			odDTO.setOrder_price(Integer.parseInt(order_price[i]));
			
			toOrdersArr.add(odDTO);
		 
		}
		
		ordersDTO.setList(toOrdersArr);
		System.out.println(toOrdersArr);
		ordersDAO.insertOrderDetail(ordersDTO);
		
		
		return "/orders/orderComplete.jsp";
	}

}
