package service.brandList;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.BrandListDaO;
import dto.Product_ImgSrcDTO;

public class AllBrandListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("--------AllBrandListService-------");
		BrandListDaO bld = BrandListDaO.getInstance();
		
		try {
			HttpSession session = request.getSession();
			
			String mem_id = (String) session.getAttribute("mem_id");
			System.out.println("mem_id는? -> " + mem_id);

			int totCnt = bld.getTotalCount(mem_id);
			String pageNum = request.getParameter("pageNum");
			if (pageNum == null || pageNum.equals("")) {pageNum = "1";}
			int currentPage = Integer.parseInt(pageNum);
			int pageSize = 12, blockSize = 10;
			int startRow = (currentPage - 1) * pageSize + 1;
			int endRow = startRow + pageSize - 1;
			int startNum = totCnt - startRow + 1;
			String toURI = request.getRequestURI();
			
			List<Product_ImgSrcDTO> list = bld.brandList(mem_id, startRow, endRow);
			System.out.println("list" + list);
			
			int pageCnt = (int)Math.ceil((double)totCnt/pageSize);
			int startPage = (int)(currentPage - 1)/blockSize * blockSize + 1;
			int endPage = startPage + blockSize - 1;
			if (endPage > pageCnt) endPage = pageCnt;

			request.setAttribute("list", list);
			request.setAttribute("totCnt", totCnt);
			System.out.println("totCnt는? " + totCnt);
			request.setAttribute("pageNum", pageNum);
			System.out.println("pageNum는? " + pageNum);
			request.setAttribute("currentPage", currentPage);
			System.out.println("currentPage는? " + currentPage);
			request.setAttribute("startNum", startNum);
			System.out.println("startNum는? " + startNum);
			request.setAttribute("blockSize", blockSize);
			System.out.println("blockSize는? " + blockSize);
			request.setAttribute("pageCnt", pageCnt);
			System.out.println("pageCnt는? " + pageCnt);
			request.setAttribute("startPage", startPage);
			System.out.println("startPage는? " + startPage);
			request.setAttribute("endPage", endPage);
			System.out.println("endPage는? " + endPage);
			request.setAttribute("toURI", toURI);
			System.out.println("toURI는?" + toURI);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return "AllBrand.jsp";
	}

}
