package service.mypage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;
import dao.LikeProDAO;
import dao.MemberDAO;

public class OrderListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		String toURI = request.getRequestURI();
		request.setAttribute("toURI", toURI);
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		// 데이터
		String mem_id = (String)session.getAttribute("mem_id");
		
		// DB
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		BasketDAO basketDAO = BasketDAO.getInstance();
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		// 찜한 갯수 / 장바구니 갯수
		int likeProCnt = likeProDAO.memLikeProCnt(mem_id);
		int basketCnt = basketDAO.memBasketCnt(mem_id);
		
		// 주문 갯수
		int ordersCnt = memberDAO.ordersCnt(mem_id); 
		
		request.setAttribute("active", "myOrder");
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("ordersCnt", ordersCnt);
		request.setAttribute("display", "/mypage/myPageOrdersList.jsp");
		
		return "/mypage/myPage.jsp";
	}

}
