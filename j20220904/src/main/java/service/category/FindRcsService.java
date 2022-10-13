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

public class FindRcsService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//검색탭 눌렀을때 최근검색어 불러는 동작
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("mem_id");
		String word = request.getParameter("deleteWord");
		System.out.println(word);
		
		//로그인 안한 상태면 최근검색어 조회하지 않고 넘어가기
		if(id != null) {
			CategoryDAO cd = CategoryDAO.getInstance();
			if(word != null) {
				int result = 0;
				try {
					result = cd.deleteRecentWord(word, id);
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				System.out.println("FindRcsService result->"+result);
			}
			
			try {
				List<Recent_SearchClickDTO>rsc_list = cd.selectRecentWord(id);
				request.setAttribute("rsc_list", rsc_list);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		return "FindRcsResult.jsp";
	}

}
