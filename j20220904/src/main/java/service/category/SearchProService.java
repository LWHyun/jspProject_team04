package service.category;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;
import dao.CategoryDAO;
import dto.SearchClickDTO;

public class SearchProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String searchWord = request.getParameter("searchWord");
		session.setAttribute("searchWord", searchWord);
		int updateResult = 0;
		int insertResult = 0;
		CategoryDAO cd = CategoryDAO.getInstance();
		
		int result;
		try {
			result = cd.select(searchWord);
			System.out.println("searchWord result ->"+result);
			if(result == 1) {
				 updateResult= cd.update(searchWord);
				 System.out.println(updateResult);
			}else {
				insertResult = cd.insert(searchWord);
				System.out.println(insertResult);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		System.out.println("searchProService "+searchWord);
		
		return "goSearchPro.jsp";
	}

}
