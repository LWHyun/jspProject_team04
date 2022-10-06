package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.QABoardDAO;
import dto.QABoardDTO;

public class QAUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QAUpdateFormService Start..."); 
		
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
