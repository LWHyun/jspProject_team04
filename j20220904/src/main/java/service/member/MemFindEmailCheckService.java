package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class MemFindEmailCheckService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemFindEmailCheckService start...");
		// 데이터 받기		
		String email = request.getParameter("mem_email");			// 받아온 이메일
		String mem_name = request.getParameter("mem_name");			// 받아온 이름
		
		int index = email.indexOf('@');
		String email1 = email.substring(0,index);
		String email2 = email.substring(index+1);
		
		// DB 
		MemberDAO memberDAO = MemberDAO.getInstance();
		List<MemberDTO> list = memberDAO.findIdMember(mem_name, email1, email2);
		
		// 비교
		int result = 0;
		if(list.size() != 0) {
			result = 1;
		}
				
		// 응답
		request.setAttribute("result", result);
		
		return "/member/memFindEmailCheck.jsp";
	}
	
}
