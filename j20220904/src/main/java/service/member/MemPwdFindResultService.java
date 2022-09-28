package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;

public class MemPwdFindResultService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemFindEmailCheckService start...");
		
		// 데이터 받기
		String mem_id = request.getParameter("mem_id");
		
		
		// 응답
		request.setAttribute("mem_id", mem_id);
		
		return "/member/memPwdFindResult.jsp";
	}

}
