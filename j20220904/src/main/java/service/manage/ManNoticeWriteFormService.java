package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;

public class ManNoticeWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("~~ManNoticeWriteForm 시작~~");
		
		try {
			// 신규글 
			int notice_code = 0;
			String pageNum = request.getParameter("pageNum");
			
			if (pageNum == null) pageNum = "1";
			
			request.setAttribute("notice_code", notice_code);
			request.setAttribute("pageNum", pageNum);		
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "manNoticeWriteForm.jsp";
	}
}