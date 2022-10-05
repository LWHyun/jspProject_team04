package service.product;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import control.CommandProcess;
import dao.OrdersInfoDAO;
import dto.OrdersInfoDTO;

public class InsertOrdListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		
		HttpSession session = request.getSession();
		//String mem_id = (String)session.getAttribute("mem_id");
		String imp_uid = request.getParameter("imp_uid"); //상점 거래ID
		String amount = request.getParameter("amount");   //상품 가격
		
		
		String mem_id = (String)session.getAttribute("mem_id"); //아이디
		String order_name = request.getParameter("order_name"); //주문고객 이름
		String order_phone = request.getParameter("order_phone"); // 주문고객 핸드폰번호
		String order_email = request.getParameter("order_email"); //주문고객 이메일
		String take_name = request.getParameter("take_name"); //배송받을 고객이름
		String take_phone = request.getParameter("take_phone"); //배송받을 번호
		String take_add = request.getParameter("take_add");    //배송받을주소
		String order_msg = request.getParameter("order_msg");  //배송시 요청사항
		String order_state = request.getParameter("order_state");	//주문상태	
//		String size_num [] = request.getParameterValues("size_num");
//		String product_id [] = request.getParameterValues("product_id");
//		String cnt [] = request.getParameterValues("cnt");
//		String order_price [] = request.getParameterValues("order_price");
		
		OrdersInfoDTO ordersDTO = new OrdersInfoDTO();
			
			ordersDTO.setMem_id(mem_id);
			ordersDTO.setOrder_name(order_name);
			ordersDTO.setOrder_phone(order_phone);
			ordersDTO.setTake_name(take_name);
			ordersDTO.setTake_phone(take_phone);
			ordersDTO.setTake_add(take_add);
			ordersDTO.setOrder_msg(order_msg);
			ordersDTO.setOrder_status(order_state);
		
//			int[] arr = new int[cnt.length];
//			int[] arr2 = new int[cnt.length];
//			int[] arr3 = new int[cnt.length];
//			int[] arr4 = new int[cnt.length];
//		for(int i=0; i< cnt.length; i++) {
//			arr[i] = Integer.parseInt(size_num[i]);
//			arr2[i] = Integer.parseInt(product_id[i]);
//			arr3[i] = Integer.parseInt(cnt[i]);
//			arr4[i] = Integer.parseInt(order_price[i]);
//		}
		//ordersDTO.setSize_num(arr);
		//ordersDTO.setProduct_id(arr2);
		//ordersDTO.setCnt(arr3);
		//ordersDTO.setPrice(arr4);
		
		
		
		
		
		
		System.out.println(mem_id);
		System.out.println(imp_uid);
		System.out.println(amount);
		
		OrdersInfoDAO orderInfoDAO = OrdersInfoDAO.getInstance();
		int result =0;
		
		result = orderInfoDAO.insertOrdList(ordersDTO);
		
		request.setAttribute("result", result);
		request.setAttribute("ordersDTO", ordersDTO);
		request.setAttribute("imp_uid", imp_uid);
		request.setAttribute("amount", amount);
		
		return "/contents/resultOrder.jsp";
	}

}
