package service.manage;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.NoticeDAO;
import dto.NoticeDTO;

public class ManNoticeUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("~~ManNoticeUpdateFormService Start~~");
		

		try {
			int notice_code = Integer.parseInt(request.getParameter("notice_code"));
			String pageNum = request.getParameter("pageNum");
			
			NoticeDAO nd = NoticeDAO.getInstance();
			NoticeDTO notice = nd.select(notice_code);
			
	        request.setAttribute("pageNum", pageNum);
	        request.setAttribute("notice", notice);
		
		} catch (SQLException e) {
			e.printStackTrace();
		}

        return "manNoticeUpdateForm.jsp";
	}
}