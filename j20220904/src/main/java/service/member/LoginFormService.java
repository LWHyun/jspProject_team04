package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;

public class LoginFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String mem_id = request.getParameter("mem_id");
		String toURI = request.getParameter("toURI");
		System.out.println("toURI="+toURI);
		
		// 아이디 찾기 후 입력한 아이디 전달
		if(mem_id != null) {
			request.setAttribute("mem_id", mem_id);
		}
		
		if(toURI != null) {
			request.setAttribute("toURI", toURI);
		}
		return "/member/memLoginForm.jsp";
	}

}
