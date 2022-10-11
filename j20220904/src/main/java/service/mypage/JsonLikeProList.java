package service.mypage;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import bean.PageHandler;
import control.CommandProcess;
import dao.LikeProDAO;
import dto.LikeProDTO;

public class JsonLikeProList implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 처리
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			System.out.println("uri="+request.getRequestURI());
			request.setAttribute("toURI", request.getRequestURI());
			return "/member/loginCheck.jsp";
		}
		String mem_id = (String)session.getAttribute("mem_id");
		
		//DB
		LikeProDAO likeProDAO = LikeProDAO.getInstance();
		
		// 찜 갯수
		int likeProCnt = likeProDAO.memLikeProCnt(mem_id);
		
		// 찜 상품 가져오기
		int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
		PageHandler ph = new PageHandler(curPage, 4, 5, likeProCnt); // curPage, pageSize, blockSize, totalCnt 
		System.out.println("ph="+ph);
		
		int startRow = (curPage-1)*ph.getPageSize()+1; // 1, 5, 9...
		int endRow = startRow+ph.getPageSize()-1; // 4, 8, 12...
		
		List<LikeProDTO> likeProList = likeProDAO.selectLikeProList(mem_id, startRow, endRow);
		System.out.println(likeProList);
		
		// List -> JSON 변환
		JSONObject json = new JSONObject();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
		
		if(likeProList != null) {
			JSONArray array = new JSONArray();
			
			for(LikeProDTO dto : likeProList) {
				JSONObject tmp = new JSONObject();
				tmp.put("product_id", dto.getProduct_id());
				tmp.put("mem_id", dto.getMem_id());
				tmp.put("like_pro_date", sdf.format(dto.getLike_pro_date()));
				tmp.put("brand", dto.getBrand());
				tmp.put("kor_name", dto.getKor_name());
				tmp.put("price", dto.getPrice());
				tmp.put("gender", dto.getGender());
				tmp.put("s_file_path", dto.getS_file_path());
				
				array.add(tmp);
			}
			
			json.put("list", array);
		}
		
		json.put("curPage", curPage+"");
		
		
		// 페이징
		JSONObject tmp2 = new JSONObject();
		tmp2.put("curPage", ph.getCurPage());
		tmp2.put("pageSize", ph.getPageSize());
		tmp2.put("blockSize", ph.getBlockSize());
		tmp2.put("totalCnt", ph.getTotalCnt());
		tmp2.put("startPage", ph.getStartPage());
		tmp2.put("endPage", ph.getEndPage());
		tmp2.put("showNext", ph.isShowNext()+"");
		tmp2.put("showPrev", ph.isShowPrev()+"");
		
		json.put("ph", tmp2);
		
		System.out.println("json="+json);
		request.setAttribute("json", json);
		
		return "/mypage/json.jsp";
	}

}
