package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bean.EmailCheck;
import control.CommandProcess;

public class MemEmailAutoService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 데이터 받기
		String mem_email = request.getParameter("mem_email");
		
		// 이메일 보내고 인증번호 전송
		EmailCheck ec = EmailCheck.getInstance();
		String code = ec.sendEmail(mem_email);
		
		// 인증번호 전송
		request.setAttribute("code", code);
		return "/member/emailAuth.jsp";
	}

}
