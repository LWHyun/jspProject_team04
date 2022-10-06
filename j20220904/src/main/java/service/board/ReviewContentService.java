package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class ReviewContentService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("ReviewContentService Start ...");
		
		// 1. rb_id, pageNum
		int rb_id = Integer.parseInt(request.getParameter("rb_id"));
		String pageNum = request.getParameter("pageNum");
		
		System.out.println("ReviewContentService rb_id => "+rb_id);
		System.out.println("ReviewContentService pageNum => "+pageNum);
		
		try {
			// 2. ReviewBoardDAO rbd Instance
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			
			// 3. p_id의 q_views 증가 (조회수 증가)
			rbd.readCount(rb_id);
			
			// 4. ReviewBoardDTO reviewBoard = rbd.select(rb_id);
			ReviewBoardDTO reviewBoard = rbd.select(rb_id);
			
			// 5. request 객체에 rb_id, pageNum, reviewBoard
			request.setAttribute("rb_id", rb_id);			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("reviewBoard", reviewBoard);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "reviewContent.jsp";
	}

}
