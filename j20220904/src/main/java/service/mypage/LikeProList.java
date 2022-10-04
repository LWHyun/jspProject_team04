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

public class LikeProList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 처리
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			return "/member/loginCheck.jsp";
		}
		String mem_id = (String)session.getAttribute("mem_id");
		String brand = request.getParameter("brand");
		
		//DB
		BasketDAO basketDAO = BasketDAO.getInstance();
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		
		// 장바구니 , 찜 갯수
		int basketCnt = basketDAO.memBasketCnt(mem_id);
		int likeProCnt = likeProDAO.memLikeProCnt(mem_id);
		
		// 찜 상품 가져오기
		int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
		PageHandler ph = new PageHandler(curPage, 4, 2, likeProCnt); // curPage, pageSize, blockSize, totalCnt 
		System.out.println("ph="+ph);
		
		int startRow = (curPage-1)*ph.getPageSize()+1; // 1, 5, 9...
		int endRow = startRow+ph.getPageSize()-1; // 4, 8, 12...
		
		List<LikeProDTO> likeProList = likeProDAO.selectLikeProList(mem_id, startRow, endRow);
		System.out.println(likeProList);
		
		request.setAttribute("curPage", curPage);
		request.setAttribute("ph", ph);
		request.setAttribute("likeProList", likeProList);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("active", "likePro"); // 현재 페이지 활성화
		request.setAttribute("display", "myPageLikeProList.jsp");
		return "/mypage/myPage.jsp";
	}

}
