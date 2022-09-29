package service.category;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;
import dao.CategoryDAO;
import dto.CategoryDTO;

public class FindCateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String result = request.getParameter("result");
		CategoryDAO cd = CategoryDAO.getInstance();
		System.out.println("FindCateService result-->"+result);
		if(result.equals("men")) {
			result = "남자";
			
			try {
				List<CategoryDTO> list = cd.selectCategory(result);
				request.setAttribute("list", list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(result.equals("women")) {
			result = "여자";
			
			try {
				List<CategoryDTO> list = cd.selectCategory(result);
				request.setAttribute("list", list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		return "result.jsp";
	}

}
