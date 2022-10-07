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
import dto.Recent_SearchClickDTO;
import dto.SearchClickDTO;

public class SearchService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			//인기검색어 조회해서 뿌려주기
			CategoryDAO cd = CategoryDAO.getInstance();
			try {
				
				List<SearchClickDTO> list = cd.selectMostClick();
				request.setAttribute("list", list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		
		
		
		return "goSearch.jsp";
	}

}