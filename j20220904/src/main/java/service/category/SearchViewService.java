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
import dto.CategoryDTO;
import dto.ProductDTO;
import dto.Product_ImgSrcDTO;

public class SearchViewService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		//검색어로 검색하거나, 하위카테고리 탭 누를때 동작
		
		String searchBar = request.getParameter("searchBar");
		String ca_code = request.getParameter("ca_code");
		HttpSession session = request.getSession();
		String searchWord = (String) session.getAttribute("searchWord");
		String mem_id = (String) session.getAttribute("mem_id");
		String toURI = request.getRequestURI();
		
		System.out.println(mem_id);
		
		CategoryDAO cd = CategoryDAO.getInstance();
		System.out.println("searchViewService "+searchWord);
		int result = 0;
		//카테고리 코드가 있으면 아래 실행
		if(ca_code != null) {
				try {
					List<Product_ImgSrcDTO> list = cd.selectCodeSearch(ca_code,mem_id);
					System.out.println("SearchViewService list.size()-->"+list.size());

					request.setAttribute("list", list);
					String codeName = cd.selectCateName(ca_code);
					request.setAttribute("ca_name", codeName);
					request.setAttribute("ca_code", ca_code);
					request.setAttribute("searchBar", searchBar);
					toURI = toURI+"?ca_code="+ca_code;
					result = 1;
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			
			
		}else {//카테고리 탭으로 누른게 아니고 검색탭에 검색어 입력시 아래실행
			try {
				List<Product_ImgSrcDTO> list = cd.selectWordSearch(searchBar,mem_id);
				request.setAttribute("searchBar", searchBar);
				request.setAttribute("list", list);
				request.setAttribute("searchWord", searchWord);
				request.setAttribute("ca_code", ca_code);
				toURI = toURI+"?searchBar="+searchBar;
				result=0;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			session.removeAttribute("searchWord");

		}
		
		request.setAttribute("result", result);
		request.setAttribute("toURI", toURI);
			
		
		return "searchView.jsp";
	}

}