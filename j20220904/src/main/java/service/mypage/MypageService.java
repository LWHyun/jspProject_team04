package service.mypage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bean.PageHandler;
import control.CommandProcess;
import dao.BasketDAO;
import dao.LikeProDAO;
import dto.LikeProDTO;

public class MypageService implements CommandProcess {

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
		
		// 찜 상품 가져오기 (마이페이지에서는 4개만 가져옴)
		int startRow = 1;
		int endRow = startRow+3;
		PageHandler ph = new PageHandler(likeProCnt); // jsp에서 찜한 갯수 처리 통일하기 위해 그냥 가져가는 것
		
		List<LikeProDTO> likeProList = likeProDAO.selectLikeProList(mem_id, startRow, endRow);
		System.out.println(likeProList);
		
		request.setAttribute("likeProList", likeProList);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("ph", ph);
		request.setAttribute("active", "my"); // 현재 페이지 활성화
		return "/mypage/myPage.jsp";
	}

}
