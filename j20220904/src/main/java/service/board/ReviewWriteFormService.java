package service.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;

public class ReviewWriteFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("ReviewWriteFormService Start..."); 
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		
		//로그인 여부 확인
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
	
		//로그인이 안되어있으면 로그인 페이지로 이동
		if ( mem_id == null ) {
			return "/member/memLoginForm.jsp";
			
		}
		try {
			// 신규글 
			int num = 0;
			String pageNum = request.getParameter("pageNum");
			
			if (pageNum == null) pageNum = "1";
			
			request.setAttribute("num", num);
			request.setAttribute("pageNum", pageNum);	
			request.setAttribute("product_id",product_id);
			request.setAttribute("gender",gender);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return "/board/reviewWriteForm.jsp";
	}

}
