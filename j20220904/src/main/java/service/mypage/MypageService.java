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
import dto.LikeProDTO;
import dto.MyPage_Order_statusDTO;

public class MypageService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			System.out.println("uri="+request.getRequestURI());
			request.setAttribute("toURI", request.getRequestURI());
			return "/member/loginCheck.jsp";
		}
		String mem_id = (String)session.getAttribute("mem_id");
		
		//DB
		BasketDAO basketDAO = BasketDAO.getInstance();
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		// 장바구니 , 찜 갯수
		int basketCnt = basketDAO.memBasketCnt(mem_id);
		int likeProCnt = likeProDAO.memLikeProCnt(mem_id);
		
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
		
		// 찜 상품 가져오기 (마이페이지에서는 4개만 가져옴)
		int startRow = 1;
		int endRow = startRow+3;
		PageHandler ph = new PageHandler(likeProCnt); // jsp에서 찜한 갯수 처리 통일하기 위해 그냥 가져가는 것
		
		List<LikeProDTO> likeProList = likeProDAO.selectLikeProList(mem_id, startRow, endRow);
		System.out.println(likeProList);
		
		request.setAttribute("orderStatusList", orderStatusList);
		request.setAttribute("likeProList", likeProList);
		request.setAttribute("basketCnt", basketCnt);
		request.setAttribute("likeProCnt", likeProCnt);
		request.setAttribute("ph", ph);
		request.setAttribute("active", "my"); // 현재 페이지 활성화
		return "/mypage/myPage.jsp";
	}

}
