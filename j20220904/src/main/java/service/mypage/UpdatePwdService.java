package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.MemberDAO;
import dto.MemberDTO;

public class UpdatePwdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 체크
		HttpSession session = request.getSession();

		// 데이터 받기
		String mem_pwd = request.getParameter("mem_pwd");
		String mem_id = (String)session.getAttribute("mem_id");
		System.out.println("mem_id="+mem_id+", mem_pwd="+mem_pwd);
		int result = 0;
		
		// 로그인 여부
		if(mem_id == null) {
			result = -1;
			return "/mypage/result.jsp";
		}
		
		// 이미 있는지 비교
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.selectMember(mem_id);
		
		// 같으면 0 / 다르면 1
		if(memberDTO != null) {
			result = memberDTO.getMem_pwd().equals(mem_pwd) ? result : 1;
		}
		
		// 다르면 수정
		if(result == 1) {
			memberDAO.updatePwd(mem_id, mem_pwd);
		}
		
		request.setAttribute("result", result);
		
		return "/mypage/result.jsp";
	}

}
