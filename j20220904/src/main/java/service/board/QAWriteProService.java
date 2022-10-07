package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.QABoardDAO;
import dto.QABoardDTO;

public class QAWriteProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QAWriteProService Start...");
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		
		try {
			request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        System.out.println(pageNum);
	        
	        QABoardDTO qABoard = new QABoardDTO();
	        qABoard.setQ_id(Integer.parseInt(request.getParameter("q_id")));
	        qABoard.setMem_id(mem_id);
	        qABoard.setProduct_id(Integer.parseInt(request.getParameter("product_id")));	        
	        qABoard.setQ_title(request.getParameter("q_title"));
	        qABoard.setQ_content(request.getParameter("q_content"));
	        
	        QABoardDAO qbd = QABoardDAO.getInstance();
	        int result = qbd.insert(qABoard);
	        
	        request.setAttribute("q_id", qABoard.getQ_id());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
	        
	         
		} catch (Exception e) {
			
		}
		return "qnaWritePro.jsp";
	}

}
