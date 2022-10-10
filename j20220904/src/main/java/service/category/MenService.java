package service.category;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.CategoryDAO;
import dao.LikeProDAO;
import dto.LikeProDTO;
import dto.ProductDTO;
import dto.Product_ImgSrcDTO;

public class MenService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int gender = Integer.parseInt(request.getParameter("gender"));
		String result = null;
		if(gender == 0) {
			result = "남성용";
		}else {
			result ="여성용";
		}
		HttpSession session = request.getSession();
		String mem_id = (String) session.getAttribute("mem_id");
		System.out.println(mem_id);
		
		CategoryDAO cd = CategoryDAO.getInstance();
		
		try {
			List<Product_ImgSrcDTO> list = cd.selectSearch(gender,mem_id);
			
			//List<LikeProDTO> likeList = cd.selectLikeList(mem_id);
			//request.setAttribute("likeList", likeList);
			//System.out.println("likeList-->"+likeList);
			
			
			request.setAttribute("result", result);
			request.setAttribute("list", list);
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "men3.jsp";
	}

}
