package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.MemberDAO;

public class MemRePwdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 데이터 받기
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");	// 새 비밀번호
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		// 비밀번호 변경
		int result = memberDAO.updatePwd(mem_id, mem_pwd);
		
		// 응답
		request.setAttribute("result", result);
		
		return "/member/updatePwdResult.jsp";
	}
	
}
