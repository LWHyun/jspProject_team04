package service.product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dto.ProductDTO;
import dto.Product_ImgDTO;
import dto.Product_ImgSrcDTO;
import dto.QABoardDTO;
import dao.LikeProDAO;
import dao.ProductDAO;
import dao.QABoardDAO;

public class ImageListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int gender = Integer.parseInt(request.getParameter("gender"));
		
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		String toURI = request.getRequestURI();
		toURI = toURI+"?product_id="+product_id+"&gender="+gender;
		
		// Dao랑 Service 연결
		QABoardDAO qbd = QABoardDAO.getInstance();
		
		try {
			ProductDAO productDAO = ProductDAO.getInstance();
			LikeProDAO likeProDAO = LikeProDAO.getInstance();
			
			int qATotCnt = qbd.getQATotalCnt();	// Q&A 총 개수
			int rbTotCnt = qbd.getTotalRBCnt(); // 리뷰게시판 총 개수
			
			
			String pageNum2 = request.getParameter("pageNum");
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
			List<QABoardDTO> qAList = qbd.qABoardList(startRow2, endRow2);
			int likeCnt = likeProDAO.proLikeProCnt(mem_id,product_id);
			
			int pageCnt = (int)Math.ceil((double)qATotCnt/pageSize2);
			
			int startPage = (int)(currentPage2 - 1) / blockSize2 * blockSize2 + 1;
			int endPage = startPage + blockSize2 - 1;
			// 공갈 Page 방지
			if (endPage > pageCnt) endPage = pageCnt;
			
			request.setAttribute("product_id",product_id);
			request.setAttribute("gender",gender);
			request.setAttribute("mem_id",mem_id);
			request.setAttribute("list",list);
			request.setAttribute("toURI",toURI);
			request.setAttribute("likeCnt",likeCnt);
			
			request.setAttribute("qATotCnt", qATotCnt);
			request.setAttribute("rbTotCnt", rbTotCnt);
			request.setAttribute("pageNum", pageNum2);
			request.setAttribute("currentPage", currentPage2);
			request.setAttribute("startNum", startNum2);
			request.setAttribute("qAList", qAList);	// ***
			request.setAttribute("blockSize", blockSize2);
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		//View
		return "/contents/contents_men.jsp";
	}

}
