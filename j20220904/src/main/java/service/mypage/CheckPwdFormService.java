package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.PageHandler;
import control.CommandProcess;
import dao.BasketDAO;
import dao.LikeProDAO;

public class CheckPwdFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		
		//DB
		BasketDAO basketDAO = BasketDAO.getInstance();
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		
		// 장바구니 , 찜 갯수
		int basketCnt = basketDAO.memBasketCnt((String)session.getAttribute("mem_id"));
		int likeProCnt = likeProDAO.memLikeProCnt((String)session.getAttribute("mem_id"));
		
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("active", "updatePwd");
		request.setAttribute("display", "myPageCngInfo.jsp");
		
		return "/mypage/myPage.jsp";
	}
	
}
