package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.QABoardDAO;

public class QADeleteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QADeleteFormService Start ... ");
		
		try {
			int q_id = Integer.parseInt(request.getParameter("q_id"));
			int product_id = Integer.parseInt(request.getParameter("product_id"));
			int gender = Integer.parseInt(request.getParameter("gender"));
			String show = request.getParameter("show");
			// pageNum2로 해야하나?
			String pageNum = request.getParameter("pageNum");
			
			QABoardDAO qbd = QABoardDAO.getInstance();
			
			//int result = qbd.delete(q_id);
			
			request.setAttribute("q_id", q_id);
			//request.setAttribute("result", result);
			request.setAttribute("product_id", product_id);
			request.setAttribute("gender", gender);
			request.setAttribute("show", show);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "qnaDeleteForm.jsp";
	}

}
