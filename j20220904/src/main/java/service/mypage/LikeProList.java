package service.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BasketDAO;
import dao.LikeProDAO;
import dto.LikeProDTO;

public class LikeProList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		String mem_id = (String)session.getAttribute("mem_id");
		
		//DB
		BasketDAO basketDAO = BasketDAO.getInstance();
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		
		// 장바구니 , 찜 갯수
		int basketCnt = basketDAO.memBasketCnt(mem_id);
		int likeProCnt = likeProDAO.memLikeProCnt(mem_id);
		
		// 찜 상품 가져오기
		List<LikeProDTO> likeProList = likeProDAO.selectLikeProList(mem_id);
		System.out.println(likeProList);
		
		request.setAttribute("likeProList", likeProList);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("active", "likePro"); // 현재 페이지 활성화
		request.setAttribute("display", "myPageLikeProList.jsp");
		return "/mypage/myPage.jsp";
	}

}
