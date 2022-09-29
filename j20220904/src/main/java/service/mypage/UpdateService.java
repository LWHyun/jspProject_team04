package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class UpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		// 데이터 받기
		String mem_id = (String)session.getAttribute("mem_id");
		String email = request.getParameter("mem_email1");
		String mem_tel = request.getParameter("mem_tel");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		
		int index = email.indexOf("@");
		String email1 = email.substring(0, index);
		String email2 = email.substring(index+1);
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMem_id(mem_id);
		memberDTO.setMem_email1(email1);
		memberDTO.setMem_email2(email2);
		memberDTO.setMem_tel(mem_tel);
		memberDTO.setMem_zipcode(mem_zipcode);
		memberDTO.setMem_addr1(mem_addr1);
		memberDTO.setMem_addr2(mem_addr2);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.update(memberDTO);
		
		// 응답
		request.setAttribute("result", result);
		
		return "/mypage/result.jsp";
	}

}
