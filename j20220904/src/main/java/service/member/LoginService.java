package service.member;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 데이터 받기
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String rememberId = request.getParameter("rememberId");
		String toURI = request.getParameter("toURI");
		System.out.println(mem_id+","+mem_pwd+","+rememberId);
		
		// DB 
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.selectMember(mem_id);
		System.out.println(memberDTO);
		
		int result = 0;
		
		// ID / PWD 확인 / 존재하는 회원 확인
		if(checkPwd(memberDTO, mem_pwd)) {
			HttpSession session = request.getSession();
			session.setAttribute("mem_id", mem_id);
			session.setAttribute("mem_name", memberDTO.getMem_name());
			
			// 아이디 저장
			if("on".equals(rememberId)) {
				Cookie cookie = new Cookie("id", mem_id);
				response.addCookie(cookie);
			} else {
				Cookie cookie = new Cookie("id", mem_id);
				cookie.setMaxAge(0);
				response.addCookie(cookie);
			}
			
			result = 1;
		}
		
		if(toURI != null) {
			request.setAttribute("toURI", toURI);
		}
		request.setAttribute("result", result);
		
		return "/member/memLoginResult.jsp";
	}
	
	// 비밀번호 확인 및 존재하는 회원 확인
	public boolean checkPwd(MemberDTO memberDTO, String mem_pwd) {
		if(memberDTO.getMem_pwd() != null ) {
			return memberDTO.getMem_pwd().equals(mem_pwd);
		} else {
			return false;
		}
	}

}
