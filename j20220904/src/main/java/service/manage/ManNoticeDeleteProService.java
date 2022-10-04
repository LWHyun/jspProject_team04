package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.NoticeDAO;

public class ManNoticeDeleteProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManNoticeDeleteProService 시작~~");
		
		try {
			int notice_code = Integer.parseInt(request.getParameter("notice_code"));
			String pageNum = request.getParameter("pageNum");
			
			NoticeDAO nd = NoticeDAO.getInstance();
			
			int result = nd.delete(notice_code);
			
			request.setAttribute("notice_code", notice_code);
			request.setAttribute("result", result);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "manNoticeDeletePro.jsp";
	}
}