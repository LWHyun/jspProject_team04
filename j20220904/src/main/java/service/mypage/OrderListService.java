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
import dto.MyPage_Order_statusDTO;
import dto.MyPage_OrdersDTO;

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
		//System.out.println("ordersCnt="+ordersCnt);
		
		// orders status 갯수
		List<MyPage_Order_statusDTO> orderStatusList = memberDAO.orderStatusCnt(mem_id);
		// order_status 가 0 또는 1만 있을 경우의 처리 (jsp 에서 입금 대기 / 결제 완료가 모두 뜨게하기 위함)
		int status0 = 0;
		int status1 = 0;
		if(orderStatusList != null) {
			for(MyPage_Order_statusDTO dto : orderStatusList) {
				if(dto.getOrder_status() == 0) {
					status0++;
				} else {
					status1++;
				}
			}
			if(status0 == 0) {
				MyPage_Order_statusDTO tmp = new MyPage_Order_statusDTO();
				tmp.setCnt(0);
				tmp.setOrder_status(0);
				
				orderStatusList.add(0, tmp);
			}
			if(status1 == 0) {
				MyPage_Order_statusDTO tmp = new MyPage_Order_statusDTO();
				tmp.setCnt(0);
				tmp.setOrder_status(0);
				
				orderStatusList.add(tmp);
			}
		}
		
		// 페이징
		int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
		//System.out.println("curPage="+curPage);
		PageHandler ph = new PageHandler(curPage, 2, 5, ordersCnt);
		
		int startNum = (curPage-1)*ph.getPageSize()+1;
		int endNum = startNum+ph.getPageSize()-1;
		
		// 주문 정보 및 상세 정보
		List<MyPage_OrdersDTO> ordersDTOlist = memberDAO.selectOrdersList(mem_id, startNum, endNum);
		
		System.out.println("list="+ordersDTOlist);
		
		request.setAttribute("active", "myOrder");
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("ordersCnt", ordersCnt);
		request.setAttribute("orderStatusList", orderStatusList);
		request.setAttribute("ordersDTOlist", ordersDTOlist);
		request.setAttribute("curPage", curPage);
		request.setAttribute("ph", ph);
		request.setAttribute("display", "/mypage/myPageOrdersList.jsp");
		
		return "/mypage/myPage.jsp";
	}

}
