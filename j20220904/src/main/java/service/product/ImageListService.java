package service.product;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;

import dto.Product_ImgSrcDTO;
import dao.LikeProDAO;
import dao.ProductDAO;

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
		
		
		try {
			ProductDAO productDAO = ProductDAO.getInstance();
			LikeProDAO likeProDAO = LikeProDAO.getInstance();
			
			
			List<Product_ImgSrcDTO> list =  productDAO.selectImg(product_id, gender);
			int likeCnt = likeProDAO.proLikeProCnt(mem_id,product_id);
			
			request.setAttribute("product_id",product_id);
			request.setAttribute("gender",gender);
			request.setAttribute("mem_id",mem_id);
			request.setAttribute("list",list);
			request.setAttribute("toURI",toURI);
			request.setAttribute("likeCnt",likeCnt);
			
			System.out.println("likeCnt="+likeCnt);
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		//View
		return "/contents/contents_men.jsp";
	}

}
