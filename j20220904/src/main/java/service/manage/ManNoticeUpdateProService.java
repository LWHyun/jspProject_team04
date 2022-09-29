package service.manage;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.NoticeDAO;
import dto.NoticeDTO;

public class ManNoticeUpdateProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		try {
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        
	        NoticeDTO notice = new NoticeDTO();
	        notice.setNotice_code(Integer.parseInt(request.getParameter("notice_code")));
	        notice.setNotice_title(request.getParameter("notice_title"));
	        notice.setNotice_content(request.getParameter("notice_content"));
	        notice.setNotice_type(Integer.parseInt(request.getParameter("notice_type")));
	        
	        NoticeDAO nd = NoticeDAO.getInstance();
	        int result = nd.update(notice);
	        
	        request.setAttribute("num", notice.getNotice_code());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		
		} catch (Exception e) {
			System.out.println(e.getMessage()); 
		}

        return "manNoticeUpdatePro.jsp";
	}
}