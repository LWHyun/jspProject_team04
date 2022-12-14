package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.NoticeDAO;
import dto.NoticeDTO;

public class ManNoticeDeleteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManNoticeDeleteFormService Start~~");
		
		try {
			int notice_code = Integer.parseInt(request.getParameter("notice_code"));
			String pageNum = request.getParameter("pageNum");
			
			NoticeDAO nd = NoticeDAO.getInstance();
			NoticeDTO notice = nd.select(notice_code);
			
			request.setAttribute("notice_code", notice_code);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("notice", notice);
		
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "manNoticeDeleteForm.jsp";
	}
}