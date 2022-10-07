package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.QABoardDAO;
import dto.QABoardDTO;

public class QAUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QAUpdateFormService Start..."); 
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		
		//로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		try {
			int q_id = Integer.parseInt(request.getParameter("q_id"));
			/* String pageNum2 = request.getParameter("pageNum2"); */
			
			System.out.println("QAUpdateFormService q_id => " + q_id);
			/* System.out.println("QAUpdateFormService pageNum => " + pageNum2); */
			
			QABoardDAO qbd = QABoardDAO.getInstance();
			
			QABoardDTO qABoard = qbd.select(q_id);
			
			/* request.setAttribute("pageNum2", pageNum2); */		
			request.setAttribute("qABoard", qABoard);
			request.setAttribute("product_id",product_id);
			request.setAttribute("gender",gender);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return "qnaUpdateForm.jsp";
	}

}
