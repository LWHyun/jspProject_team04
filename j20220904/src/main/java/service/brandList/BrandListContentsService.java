package service.brandList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.BrandListDAO;
import dao.BrandListDaO;
import dto.Product_ImgSrcDTO;

public class BrandListContentsService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		BrandListDaO bld = BrandListDaO.getInstance();
		
		int ca_code = Integer.parseInt(request.getParameter("ca_code"));
		
		
		try {
//			int totCnt = bld.getTotalCnt(ca_code); // 14개
//			
//			String pageNum = request.getParameter("pageNum");
//			if (pageNum == null || pageNum.equals("")) {pageNum = "1";}
//			int currentPage = Integer.parseInt(pageNum);
//			int pageSize = 10, blockSize = 12;
//			int startRow = (currentPage - 1) * pageSize + 1;
//			int endRow = startRow + pageSize - 1;
//			int startNum = totCnt - startRow + 1;
			String ca_name = bld.selectBrandName(ca_code);
			List<Product_ImgSrcDTO> list = bld.productList(ca_code);
			
			System.out.println("list" + list);
			System.out.println(ca_name);
//			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
//			
//			int startPage = (int)(currentPage - 1)/blockSize * blockSize + 1;
//			int endPage = startPage + blockSize - 1;
//			if (endPage > pageCnt) endPage = pageCnt;
//			
			request.setAttribute("ca_name", ca_name);
			request.setAttribute("list", list);
//			request.setAttribute("totCnt", totCnt);
//			request.setAttribute("pageNum", pageNum);
//			request.setAttribute("currentPage", currentPage);
//			request.setAttribute("startNum", startNum);
//			request.setAttribute("blockSize", blockSize);
//			request.setAttribute("pageCnt", pageCnt);
//			request.setAttribute("startPage", startPage);
//			request.setAttribute("endPage", endPage);
			
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "brandPdList.jsp";
	}

}
