package service.member;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class MemIdFindResultService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("MemIdFindResultService start...");
		// 데이터 받기
		String mem_name = request.getParameter("mem_name");
		String email = request.getParameter("mem_email");
		System.out.println(mem_name+","+email);
		
		int index = email.indexOf('@');
		String email1 = email.substring(0,index);
		String email2 = email.substring(index+1);
		
		// DB 
		MemberDAO memberDAO = MemberDAO.getInstance();
		List<MemberDTO> list = memberDAO.findIdMember(mem_name, email1, email2);
		
		request.setAttribute("list", list);
		
		return "/member/memIdFindResult.jsp";
	}

}
