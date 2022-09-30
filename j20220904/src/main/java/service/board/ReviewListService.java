package service.board;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ReviewBoardDAO;
import dto.ReviewBoardDTO;

public class ReviewListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("ReviewListService Start...");
		
		// Dao랑 Service 연결
		ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
		
		
		try {
			int totCnt = rbd.getTotalCnt();	// 총 개수
			System.out.println("ReviewListService totCnt->"+totCnt);
			
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {
				pageNum = "1";
			}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 10, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			
			// Board 조회
			List<ReviewBoardDTO> reviewList = rbd.reviewBoardList(startRow, endRow);
			
				System.out.println("QAListService reviewList reviewList.size()=>"+reviewList.size());
			for (ReviewBoardDTO reviewBoardDTO : reviewList) {
				System.out.println("ReviewListService reviewList reviewBoardDTO.getQ_title() => " + reviewBoardDTO.getRb_title());
			}
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			
			int startPage = (int)(currentPage - 1) / blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			// 공갈 Page 방지
			if (endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("reviewList", reviewList);	// ***
			request.setAttribute("blockSize", blockSize);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			// 어디서 에러났는지 잘 찾기 위해
			System.out.println("ListAction e.getMessage() => " + e.getMessage());
		} 
		
		
		return "reviewBoard.jsp";
	}

}
