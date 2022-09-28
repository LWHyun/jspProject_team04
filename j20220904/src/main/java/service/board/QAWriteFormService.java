package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;

public class QAWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("QAWriteFormService Start...");
		
		try {
			// 신규글 
			int num = 0;
			String pageNum = request.getParameter("pageNum");
			
			if (pageNum == null) pageNum = "1";
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);		
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "qnaWriteForm.jsp";
	}

}
