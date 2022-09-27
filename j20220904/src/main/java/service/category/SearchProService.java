package service.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;

public class SearchProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String word = (String)session.getAttribute("word");
		if(word == null){
			word = "";
		}
		String searchWord = request.getParameter("searchWord");
		session.setAttribute("word", searchWord);
		
		
		return "goSearchPro.jsp";
	}

}
