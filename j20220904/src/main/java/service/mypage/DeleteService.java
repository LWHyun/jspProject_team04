package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.MemberDAO;

public class DeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			System.out.println("uri="+request.getRequestURI());
			request.setAttribute("toURI", request.getRequestURI());
			return "/member/loginCheck.jsp";
		}
		
		// DB
		String mem_id = (String)session.getAttribute("mem_id");
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.delete(mem_id);
		
		// 탈퇴 후 세션 끊기
		if(result == 1) {
			session.removeAttribute("mem_id");
			session.removeAttribute("mem_name");
		}
		
		// 응답
		request.setAttribute("result", result);
		
		return "/mypage/result.jsp";
	}

}
