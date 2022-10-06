package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.QABoardDAO;
import dao.ReviewBoardDAO;
import dto.QABoardDTO;
import dto.ReviewBoardDTO;

public class ReviewUpdateProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReviewUpdateProService Start ... ");
		
		request.setCharacterEncoding("utf-8"); 
		String pageNum = request.getParameter("pageNum");
		
		try {
			ReviewBoardDTO reviewBoard = new ReviewBoardDTO();
			
			reviewBoard.setRb_id(Integer.parseInt(request.getParameter("rb_id")));
			reviewBoard.setRb_title(request.getParameter("rb_title"));
			reviewBoard.setRb_content(request.getParameter("rb_content"));
			
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			int result = rbd.update(reviewBoard);
			
			request.setAttribute("result", result);
			request.setAttribute("rb_id", reviewBoard.getRb_id());
			request.setAttribute("pageNum", pageNum);
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "reviewUpdatePro.jsp";
	}

}
