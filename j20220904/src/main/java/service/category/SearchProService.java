package service.category;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import control.CommandProcess;

public class SearchProService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String searchWord = request.getParameter("searchWord");
		session.setAttribute("searchWord", searchWord);
		
		System.out.println("searchProService "+searchWord);
		
		return "goSearchPro.jsp";
	}

}
