package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class ReviewWriteProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		
		System.out.println("ReviewWriteProService Start...");
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		try {
			request.setCharacterEncoding("utf-8");
			String pageNum = request.getParameter("pageNum");
	        System.out.println(pageNum);
	        
	        ReviewBoardDTO reviewBoard = new ReviewBoardDTO();
	        reviewBoard.setRb_id(Integer.parseInt(request.getParameter("rb_id")));
	        reviewBoard.setMem_id(mem_id);
	        reviewBoard.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
	        reviewBoard.setRb_title(request.getParameter("rb_title"));
	        reviewBoard.setRb_content(request.getParameter("rb_content"));
	        
	        ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
	        int result = rbd.insert(reviewBoard);
	        
	        request.setAttribute("rb_id", reviewBoard.getRb_id());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return null;
	}

}
