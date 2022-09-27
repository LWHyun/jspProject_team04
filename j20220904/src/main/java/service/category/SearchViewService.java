package service.category;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.ProductDao;
import dto.ProductDTO;

public class SearchViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchBar = request.getParameter("searchBar");
		HttpSession session = request.getSession();
		session.removeAttribute("word");
		ProductDao pd = ProductDao.getInstance();
		
		try {
			List<ProductDTO> list = pd.selectSearch(searchBar);
			request.setAttribute("searchBar", searchBar);
			request.setAttribute("list", list);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return "searchView.jsp";
	}

}