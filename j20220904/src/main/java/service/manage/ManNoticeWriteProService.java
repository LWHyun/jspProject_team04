package service.manage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.NoticeDAO;
import dto.NoticeDTO;

public class ManNoticeWriteProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("~~ManNoticeWriteProService  시작~~");
		
		try {
	        request.setCharacterEncoding("utf-8"); 
	        String pageNum = request.getParameter("pageNum");
	        System.out.println(pageNum);
	        
	        NoticeDTO notice = new NoticeDTO();
	        
	        notice.setNotice_code(Integer.parseInt(request.getParameter("notice_code")));
	        notice.setNotice_title(request.getParameter("notice_title"));
	        notice.setNotice_content(request.getParameter("notice_content"));
	        
	        NoticeDAO nd = NoticeDAO.getInstance();
	        int result = nd.insert(notice);
	        
	        request.setAttribute("notice_code", notice.getNotice_code());
	        request.setAttribute("result", result);
	        request.setAttribute("pageNum", pageNum);
		
		} catch (Exception e) {
			e.printStackTrace();
		}

        return "manNoticeWritePro.jsp";
	}
}