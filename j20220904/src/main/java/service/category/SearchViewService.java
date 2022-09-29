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
import dto.ProductDTO;

public class SearchViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchBar = request.getParameter("searchBar");
		HttpSession session = request.getSession();
		String searchWord = (String) session.getAttribute("searchWord");
		
		
		CategoryDAO cd = CategoryDAO.getInstance();
		System.out.println("searchViewService "+searchWord);
		
		try {
			List<ProductDTO> list = cd.selectSearch(searchBar);
			request.setAttribute("searchBar", searchBar);
			request.setAttribute("list", list);
			request.setAttribute("searchWord", searchWord);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		session.removeAttribute("searchWord");
		return "searchView.jsp";
	}

}