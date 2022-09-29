package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class UpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.selectMember((String)session.getAttribute("mem_id"));
		
		request.setAttribute("memberDTO", memberDTO);
		request.setAttribute("active", "update");
		request.setAttribute("display", "myPagePrivateInfoUp.jsp");
		
		return "/mypage/myPage.jsp";
	}
	
}
