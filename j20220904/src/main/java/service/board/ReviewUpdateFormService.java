package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class ReviewUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReviewUpdateFormService Start..."); 
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		String show = request.getParameter("show");
		//로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		
		try {
			int rb_id = Integer.parseInt(request.getParameter("rb_id"));
			
			/* String pageNum = request.getParameter("pageNum"); */
			
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			
			ReviewBoardDTO reviewBoard = rbd.select(rb_id);
			
			/* request.setAttribute("pageNum", pageNum); */		
			request.setAttribute("reviewBoard", reviewBoard);
			request.setAttribute("product_id",product_id);
			request.setAttribute("gender",gender);
			request.setAttribute("show",show);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return "reviewUpdateForm.jsp";
	}

}
