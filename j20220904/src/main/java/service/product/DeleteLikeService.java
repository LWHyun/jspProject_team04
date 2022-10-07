package service.product;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.LikeProDAO;
import dao.ProductDAO;

public class DeleteLikeService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id= Integer.parseInt(request.getParameter("product_id"));
		String mem_id = request.getParameter("mem_id");
		System.out.println("delete product_id"+product_id);
		System.out.println("delete mem_id"+mem_id);
		ProductDAO productDAO = ProductDAO.getInstance();
		int result = 0;
		
		//세션에 아이디 값이 있는지 확인
//		HttpSession session = request.getSession();
//		if(session.getAttribute("mem_id") == null) {
//			System.out.println("uri="+request.getRequestURI());
//			request.setAttribute("toURI", request.getRequestURI());
//			return "/member/loginCheck.jsp";
//		}
		//int likeCnt = likeProDAO.memLikeProCnt(mem_id);

		
		
		if(mem_id != null || !("".equals(mem_id))) {
			try {
				
				
				 result = productDAO.deleteLike(product_id, mem_id);
					
					request.setAttribute("mem_id", mem_id);
					//request.setAttribute("gender", gender);
					request.setAttribute("product_id", product_id);
					
					
					
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
		}
			request.setAttribute("result", result);
			
			
		
		return "/contents/checkFail.jsp";
		
		
		
	}

}
