package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class ReviewContentService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("ReviewContentService Start ...");
	
		HttpSession session = request.getSession();
		
		// 1. rb_id, pageNum
		int rb_id = Integer.parseInt(request.getParameter("rb_id"));
		String pageNum = request.getParameter("pageNum");
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		String mem_id = (String) session.getAttribute("mem_id");
		
		System.out.println("ReviewContentService rb_id => "+rb_id);
		System.out.println("ReviewContentService pageNum => "+pageNum);
		
		try {
			// 2. ReviewBoardDAO rbd Instance
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			
			// 3. p_id의 q_views 증가 (조회수 증가)
	         if(session.getAttribute("memHit") != null) {
	         rbd.readCount(rb_id);
	         session.removeAttribute("memHit");
	         }
			
			// 4. ReviewBoardDTO reviewBoard = rbd.select(rb_id);
			ReviewBoardDTO reviewBoard = rbd.select(rb_id);
			
			// 5. request 객체에 rb_id, pageNum, reviewBoard
			request.setAttribute("rb_id", rb_id);			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("reviewBoard", reviewBoard);
			request.setAttribute("product_id", product_id);
			request.setAttribute("gender", gender);
			
			// 본인 글인지 확인용
			request.setAttribute("mem_id", reviewBoard.getMem_id());
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "reviewContent.jsp";
	}

}
