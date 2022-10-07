package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.QABoardDAO;

public class QADeleteProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QADeleteProService Start ... ");
		
		try {
			int q_id = Integer.parseInt(request.getParameter("q_id"));
			// pageNum2로 해야하나?
			String pageNum = request.getParameter("pageNum");
			
			QABoardDAO qbd = QABoardDAO.getInstance();
			
			int result = qbd.delete(q_id);
			
			request.setAttribute("q_id", q_id);
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "qnaDeletePro.jsp";
	}

}
