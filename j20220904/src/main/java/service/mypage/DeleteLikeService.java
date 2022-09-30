package service.mypage;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.LikeProDAO;
import dto.LikeProDTO;

public class DeleteLikeService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		
		// 데이터 받기
		String[] prodChecked = request.getParameterValues("prodChecked");
		String mem_id = (String)session.getAttribute("mem_id");
		
		List<LikeProDTO> list = new ArrayList<>();
		for(int i = 0; i < prodChecked.length; i++) {
			LikeProDTO dto = new LikeProDTO();
			dto.setMem_id(mem_id);
			dto.setProduct_id(prodChecked[i]);
			
			list.add(dto);
		}
		//System.out.println(list);
		
		// DB
		LikeProDAO dao = LikeProDAO.getInstance();
		int result = dao.deleteLike(list);
		
		// 응답
		request.setAttribute("result", result);
		
		return "/mypage/result.jsp";
	}

}
