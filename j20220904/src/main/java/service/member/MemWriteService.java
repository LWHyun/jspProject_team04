package service.member;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class MemWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 데이터 받기
		String mem_name = request.getParameter("mem_name");
		String mem_id = request.getParameter("mem_id");
		String mem_pwd = request.getParameter("mem_pwd");
		String email = request.getParameter("mem_email1"); // 풀 이메일
		String mem_tel = request.getParameter("mem_tel");
		String mem_zipcode = request.getParameter("mem_zipcode");
		String mem_addr1 = request.getParameter("mem_addr1");
		String mem_addr2 = request.getParameter("mem_addr2");
		
		int index = email.indexOf('@');
		String email1 = email.substring(0,index);
		String email2 = email.substring(index+1);
		
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setMem_name(mem_name);
		memberDTO.setMem_id(mem_id);
		memberDTO.setMem_pwd(mem_pwd);
		memberDTO.setMem_email1(email1);
		memberDTO.setMem_email2(email2);
		memberDTO.setMem_tel(mem_tel);
		memberDTO.setMem_zipcode(mem_zipcode);
		memberDTO.setMem_addr1(mem_addr1);
		memberDTO.setMem_addr2(mem_addr2);
		
		System.out.println(memberDTO);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		int result = memberDAO.insertMember(memberDTO);
		
		
		// 응답
		
		// 회원가입 성공 시 로그인 화면 이동
		if(result == 1) {
			request.setAttribute("writeResult", "success");
			
			return "/member/memLoginForm.jsp";
		} 
		// 회원가입 실패 시 회원가입 폼으로 이동
		else {
			request.setAttribute("writeResult", "fail");
			
			return "/member/memWriteForm.jsp";
		}
	}

}
