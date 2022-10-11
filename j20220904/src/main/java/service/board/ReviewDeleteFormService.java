package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ReviewBoardDAO;

public class ReviewDeleteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReviewDeleteFormService Start ... ");
		
		try {
			int rb_id = Integer.parseInt(request.getParameter("rb_id"));
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			int gender = Integer.parseInt(request.getParameter("gender"));
			System.out.println("product아이디 오냐?"+product_id);
			String show = request.getParameter("show");
			// pageNum2로 해야하나?
			String pageNum = request.getParameter("pageNum");
			
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			
			//int result = rbd.delete(rb_id);
			
			request.setAttribute("rb_id", rb_id);
			//request.setAttribute("result", result);
			request.setAttribute("product_id", product_id);
			request.setAttribute("gender", gender);
			request.setAttribute("show", show);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "reviewDeleteForm.jsp";
	}

}
