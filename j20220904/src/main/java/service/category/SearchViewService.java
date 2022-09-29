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
import dto.Product_ImgSrcDTO;

public class SearchViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchBar = request.getParameter("searchBar");
		String ca_code = request.getParameter("ca_code");
		HttpSession session = request.getSession();
		String searchWord = (String) session.getAttribute("searchWord");
		CategoryDAO cd = CategoryDAO.getInstance();
		System.out.println("searchViewService "+searchWord);
		
		//카테고리 코드가 있으면 아래 실행
		if(ca_code != null) {
			
			
				try {
					List<Product_ImgSrcDTO> list = cd.selectCodeSearch(ca_code);
					request.setAttribute("list", list);
					
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
		}else {//카테고리 탭으로 누른게 아니고 검색탭에 검색어 입력시 아래실행
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

		}
		
		
		
			
		
		return "searchView.jsp";
	}

}