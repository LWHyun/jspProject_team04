package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.QABoardDAO;
import dto.QABoardDTO;

public class QAContentService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("QAContentService Start ... ");
		
		// 1. q_id, pageNum
		int q_id = Integer.parseInt(request.getParameter("p_id"));
		String pageNum = request.getParameter("pageNum");
		
		System.out.println("QAContentService q_id => "+q_id);
		System.out.println("QAContentService pageNum => "+pageNum);
		try {
			// 2. QABoardDAO qbd Instance
			QABoardDAO qbd = QABoardDAO.getInstance();
			
			// 3. p_id의 q_views 증가 (조회수 증가)
			qbd.readCount(q_id);
			
			// 4. QABoardDTO qABoard = qbd.select(q_id);
			QABoardDTO qABoard = qbd.select(q_id);
			
			// 5. request 객체에 q_id, pageNum, qABoard
			request.setAttribute("q_id", q_id);			
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("qABoard", qABoard);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "qnaContent.jsp";
	}

}
