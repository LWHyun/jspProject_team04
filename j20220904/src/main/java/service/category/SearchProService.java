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
		System.out.println("searchWord --->"+searchWord);
		session.setAttribute("searchWord", searchWord);
		String id = (String) session.getAttribute("mem_id");
		System.out.println("session.mem_id-->"+id);
		CategoryDAO cd = CategoryDAO.getInstance();
		int result1 = 0;
		int updateResult = 0;
		int insertResult = 0;
		
		if(id != null) {
			try {
				//최근검색에 검색하고 있으면 insert 하는문
				result1 = cd.insertRecentWord(searchWord, id);
				System.out.println("searchProService result1-->"+result1);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
		
		
		
		int result;
		try {
			result = cd.select(searchWord);
			System.out.println("searchWord result ->"+result);
			//인기검색어탭에 검색어가 있으면 업데이트문으로 카운트+1
			if(result == 1) {
				 updateResult= cd.update(searchWord);
				 System.out.println(updateResult);
			}else {
				//인기검색어탭에 검색어가 없으면 insert문으로 추가
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
