package service.orders;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import control.CommandProcess;

public class InsertOrderDetailService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int product_id = Integer.parseInt(request.getParameter("product_id"));
		int size_num = Integer.parseInt(request.getParameter("size_num"));
		int cnt = Integer.parseInt(request.getParameter("cnt"));
		
		
		
		return null;
	}

}
