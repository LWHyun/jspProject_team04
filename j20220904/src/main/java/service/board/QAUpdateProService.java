package service.board;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.LikeProDAO;
import dao.ProductDAO;
import dao.QABoardDAO;
import dao.ReviewBoardDAO;
import dto.Product_ImgSrcDTO;
import dto.QABoardDTO;
import dto.ReviewBoardDTO;

public class QAUpdateProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("QAUpdateProService Start ... ");
		
		request.setCharacterEncoding("utf-8"); 
		/* String pageNum2 = request.getParameter("pageNum2"); */
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String toURI = request.getRequestURI();
		toURI = toURI+"?product_id="+product_id+"&gender="+gender;
		try {
			System.out.println("try시작");
			QABoardDTO qABoard = new QABoardDTO();
			
			qABoard.setQ_id(Integer.parseInt(request.getParameter("q_id")));
			qABoard.setProduct_id(Integer.parseInt(request.getParameter("product_id")));
			qABoard.setQ_title(request.getParameter("q_title"));
			qABoard.setQ_content(request.getParameter("q_content"));
			
			System.out.println("QAUpdateProService q_id > " + request.getParameter("q_id"));
			System.out.println("QAUpdateProService product_id > " + request.getParameter("product_id"));
			System.out.println("QAUpdateProService q_title ... " + request.getParameter("q_title"));
			System.out.println("QAUpdateProService q_content ... " + request.getParameter("q_content"));
			
			QABoardDAO qbd = QABoardDAO.getInstance();
			int result = qbd.update(qABoard);
			
			request.setAttribute("result", result);
			request.setAttribute("q_id", qABoard.getQ_id());
			/* request.setAttribute("pageNum2", pageNum2); */
			
			
			
			// Dao랑 Service 연결
			ReviewBoardDAO rbd = ReviewBoardDAO.getInstance();
			
			ProductDAO productDAO = ProductDAO.getInstance();
			LikeProDAO likeProDAO = LikeProDAO.getInstance();
			
			int qATotCnt = qbd.getQATotalCnt();	// Q&A 총 개수
			int rbTotCnt = qbd.getTotalRBCnt(); // 리뷰게시판 총 개수
			
			// 리뷰 페이징
			String pageNum1 = request.getParameter("pageNum1");
			if (pageNum1 == null || pageNum1.equals("")) {
				pageNum1 = "1";
			}
			int currentPage1 = Integer.parseInt(pageNum1);
			int pageSize1 = 10, blockSize1 = 10;
			int startRow1 = (currentPage1 - 1) * pageSize1 + 1;
			int endRow1 = startRow1 + pageSize1 - 1;
			int startNum1 = rbTotCnt - startRow1 + 1;
			
			// Q&A 페이징
			String pageNum2 = request.getParameter("pageNum2");
			if (pageNum2 == null || pageNum2.equals("")) {
				pageNum2 = "1";
			}
			int currentPage2 = Integer.parseInt(pageNum2);
			int pageSize2 = 10, blockSize2 = 10;
			int startRow2 = (currentPage2 - 1) * pageSize2 + 1;
			int endRow2 = startRow2 + pageSize2 - 1;
			int startNum2 = qATotCnt - startRow2 + 1;
			
			
			//System.out.println(qATotCnt);
			
			List<Product_ImgSrcDTO> list =  productDAO.selectImg(product_id, gender);
			// Board 조회
			List<ReviewBoardDTO> reviewList = rbd.reviewBoardList(startRow1, endRow1);
			List<QABoardDTO> qAList = qbd.qABoardList(startRow2, endRow2);
			int likeCnt = likeProDAO.proLikeProCnt(mem_id,product_id);
			
			int pageCnt1 = (int)Math.ceil((double)rbTotCnt/pageSize1);
			int pageCnt2 = (int)Math.ceil((double)qATotCnt/pageSize2);
			
			int startPage1 = (int)(currentPage1 - 1) / blockSize1 * blockSize1 + 1;
			int endPage1 = startPage1 + blockSize1 - 1;
			// 공갈 Page 방지
			if (endPage1 > pageCnt1) endPage1 = pageCnt1;
			
			int startPage2 = (int)(currentPage2 - 1) / blockSize2 * blockSize2 + 1;
			int endPage2 = startPage2 + blockSize2 - 1;
			// 공갈 Page 방지
			if (endPage2 > pageCnt2) endPage2 = pageCnt2;
			
			request.setAttribute("product_id",product_id);
			request.setAttribute("gender",gender);
			request.setAttribute("mem_id",mem_id);
			request.setAttribute("list",list);
			request.setAttribute("toURI",toURI);
			request.setAttribute("likeCnt",likeCnt);
			
			
			
			
			request.setAttribute("qATotCnt", qATotCnt);
			request.setAttribute("rbTotCnt", rbTotCnt);
			// 리뷰
			request.setAttribute("pageNum1", pageNum1);
			request.setAttribute("currentPage1", currentPage1);
			request.setAttribute("startNum1", startNum1);
			request.setAttribute("reviewList", reviewList);	// ***
			request.setAttribute("blockSize1", blockSize1);
			request.setAttribute("pageCnt1", pageCnt1);
			request.setAttribute("startPage1", startPage1);
			request.setAttribute("endPage1", endPage1);
			// Q&A
			request.setAttribute("pageNum2", pageNum2);
			request.setAttribute("currentPage2", currentPage2);
			request.setAttribute("startNum2", startNum2);
			request.setAttribute("qAList", qAList);	// ***
			request.setAttribute("blockSize", blockSize2);
			request.setAttribute("pageCnt2", pageCnt2);
			request.setAttribute("startPage2", startPage2);
			request.setAttribute("endPage2", endPage2);
			
			
			
			
		} catch (Exception e) {
			System.out.println("QAUpdateProService >" +e.getMessage());
		}
		
		return "/contents/contents_men.jsp";
	}

}
