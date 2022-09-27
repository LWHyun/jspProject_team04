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
		
		
		int result = 0;
		
		// 비밀번호 찾기 일 경우
		if(request.getParameter("mem_id") != null) {
			System.out.println(request.getParameter("mem_id"));
			MemberDTO memberDTO = memberDAO.selectMember(request.getParameter("mem_id"));
			
			if(email.equals(memberDTO.getMem_email1()+"@"+memberDTO.getMem_email2())) {
				System.out.println("비밀번호 찾기 일치!");
				result = 1;
			}
		} 
		// 아이디 찾기 일 경우
		else {
			List<MemberDTO> list = memberDAO.findIdMember(mem_name, email1, email2);
			// 비교
			
			if(list.size() != 0) {
				System.out.println("아이디 찾기 일치!");
				result = 1;
			}
		}
				
		// 응답
		request.setAttribute("result", result);
		
		return "/member/memFindEmailCheck.jsp";
	}
	
}
