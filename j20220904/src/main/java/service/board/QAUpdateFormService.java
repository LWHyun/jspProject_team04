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
		//로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		try {
			int q_id = Integer.parseInt(request.getParameter("q_id"));
			String pageNum = request.getParameter("pageNum");
			
			QABoardDAO qbd = QABoardDAO.getInstance();
			QABoardDTO qABoard = qbd.select(q_id);
			
			request.setAttribute("pageNum", pageNum);			
			request.setAttribute("qABoard", qABoard);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
		return "qnaUpdateForm.jsp";
	}

}
