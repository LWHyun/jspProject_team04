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
import dao.MemberDAO;
import dto.MyPage_QABoardDTO;

public class QAListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			System.out.println("uri="+request.getRequestURI());
			request.setAttribute("toURI", request.getRequestURI());
			return "/member/loginCheck.jsp";
		}
		
		// 데이터 받기
		String mem_id = (String)session.getAttribute("mem_id");
		int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
		
		BasketDAO basketDAO = BasketDAO.getInstance();
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		
		// 장바구니 , 찜 갯수
		int basketCnt = basketDAO.memBasketCnt((String)session.getAttribute("mem_id"));
		int likeProCnt = likeProDAO.memLikeProCnt((String)session.getAttribute("mem_id"));
		
		// QA 총 개수
		MemberDAO memberDAO = MemberDAO.getInstance();
		int totalCnt = memberDAO.QAListCnt(mem_id);
		System.out.println("QACnt="+totalCnt);
		// paging
		//PageHandler ph = new PageHandler(curPage, 5, 2, totalCnt);

		// QA 리스트 받기
		//int startNum = (curPage-1) * ph.getPageSize() + 1;
		//int endNum = startNum + ph.getPageSize() -1;
		
		//List<MyPage_QABoardDTO> list = memberDAO.QAList(mem_id, startNum, endNum);
		//System.out.println(list);
		
		// 응답
		request.setAttribute("active", "myQA");
		request.setAttribute("curPage", curPage);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("QACnt", totalCnt);
		//request.setAttribute("ph", ph);
		//request.setAttribute("list", list);
		request.setAttribute("display", "myPageQAList.jsp");
		
		return "/mypage/myPage.jsp";
	}

}
