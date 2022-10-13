package service.manage;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.ProductDAO;
import dto.ProductDTO;
import dto.Product_ImgSrcDTO;

public class ManProductListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		System.out.println("~~ManProductListService 시작~~");
		
		ProductDAO pd = ProductDAO.getInstance();
		
		try {
			int totCnt = pd.getTotalCnt();

			String pageNum = request.getParameter("pageNum");	
			if (pageNum==null || pageNum.equals("")) {	pageNum = "1";	}
			int currentPage = Integer.parseInt(pageNum);   
			int pageSize  = 10, blockSize = 5;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow   = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			
			/* 가져올 정보 : 선택 | 제품코드 | 브랜드 | 한글이름 | 가격 | 색상 | 카테고리 코드 */
			List<Product_ImgSrcDTO> productList = pd.productList(startRow, endRow); 
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage-1)/blockSize*blockSize + 1;    
			int endPage = startPage + blockSize -1;	                       
			if (endPage > pageCnt) endPage = pageCnt;
			request.setAttribute("productList", productList);   // ***
			request.setAttribute("totCnt", totCnt);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("startNum", startNum);
			request.setAttribute("blockSize", blockSize);		// 페이징 블록
			request.setAttribute("pageCnt", pageCnt);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
		} catch (Exception e) {
			System.out.println("[ManProductListService] e.getMessage()->"+e.getMessage());
		}

		return "manProductList.jsp";
	}
}
