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
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mem_id");
		//로그인 안한 상태면 최근검색어 조회하지 않고 넘어가기
		if(id == null) {
			CategoryDAO cd = CategoryDAO.getInstance();
			try {
				List<SearchClickDTO> list = cd.select();
				request.setAttribute("list", list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			CategoryDAO cd = CategoryDAO.getInstance();
			try {
				List<Recent_SearchClickDTO>rsc_list = cd.selectRecentWord(id);
				request.setAttribute("rsc_list", rsc_list);
				List<SearchClickDTO> list = cd.select();
				request.setAttribute("list", list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		
		
		
		return "goSearch.jsp";
	}

}