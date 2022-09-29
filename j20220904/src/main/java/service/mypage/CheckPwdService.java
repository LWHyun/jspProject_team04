package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class CheckPwdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}

		// 데이터 받기
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_id = (String)session.getAttribute("mem_id");
		
		// 비교
		int result = 0;
		
		if(mem_id != null) {
			MemberDAO memberDAO = MemberDAO.getInstance();
			MemberDTO memberDTO = memberDAO.selectMember(mem_id);
			
			if(mem_pwd.equals(memberDTO.getMem_pwd())) {
				result = 1;
			}
		} else {
			result = -1; // 로그인이 끊겻을 경우
		}
		
		// 응답
		request.setAttribute("result", result);
		
		return "/mypage/result.jsp";

	}

}
