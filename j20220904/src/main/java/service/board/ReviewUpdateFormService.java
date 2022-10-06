package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class ReviewUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReviewUpdateFormService Start..."); 
		
		try {
			int rb_id = Integer.parseInt(request.getParameter("rb_id"));
			String pageNum = request.getParameter("pageNum");
			
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			ReviewBoardDTO reviewBoard = rbd.select(rb_id);
			
			request.setAttribute("pageNum", pageNum);			
			request.setAttribute("reviewBoard", reviewBoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return "reviewUpdateForm.jsp";
	}

}
