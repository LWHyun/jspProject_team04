package service.board;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.QABoardDAO;
import dto.QABoardDTO;

public class QAUpdateProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QAUpdateProService Start ... ");
		
		request.setCharacterEncoding("utf-8"); 
		/* String pageNum2 = request.getParameter("pageNum2"); */
		
		try {
			QABoardDTO qABoard = new QABoardDTO();
			
			qABoard.setQ_id(Integer.parseInt(request.getParameter("q_id")));
			qABoard.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
			qABoard.setQ_title(request.getParameter("q_title"));
			qABoard.setQ_content(request.getParameter("q_content"));
			
			System.out.println("QAUpdateProService q_id > " + request.getParameter("q_id"));
			System.out.println("QAUpdateProService product_id > " + request.getParameter("product_id"));
			System.out.println("QAUpdateProService q_title ... " + request.getParameter("q_title"));
			System.out.println("QAUpdateProService q_content ... " + request.getParameter("q_content"));
			
			QABoardDAO qbd = QABoardDAO.getInstance();
			int result = qbd.update(qABoard);
			
			request.setAttribute("result", result);
			request.setAttribute("q_id", qABoard.getQ_id());
			/* request.setAttribute("pageNum2", pageNum2); */
			
		} catch (Exception e) {
			System.out.println("QAUpdateProService >" +e.getMessage());
		}
		
		return "qnaUpdatePro.jsp";
	}

}
