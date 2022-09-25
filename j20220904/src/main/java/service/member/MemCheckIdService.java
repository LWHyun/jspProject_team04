package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class MemCheckIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 데이터 받기
		String mem_id = request.getParameter("mem_id");
		System.out.println("mem_id="+mem_id);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.selectMember(mem_id);
		System.out.println(memberDTO);
		
		// 이미 DB 에 있는지 검사
		if(memberDTO.getMem_id() == null) {
			request.setAttribute("duplicate", "non-exist");
		} else {
			request.setAttribute("duplicate", "exist");
		}
		
		return "/member/checkId.jsp";
	}

}
