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
import dao.MemberDAO;
import dto.MyPage_QABoardDTO;

public class JsonQAListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 로그인 여부
		HttpSession session = request.getSession();
		if(session.getAttribute("mem_id") == null) {
			System.out.println("uri="+request.getRequestURI());
			request.setAttribute("toURI", request.getRequestURI());
			return "/member/loginCheck.jsp";
		}
		
		// 데이터 받기
		String mem_id = (String)session.getAttribute("mem_id");
		int curPage = request.getParameter("curPage") == null ? 1 : Integer.parseInt(request.getParameter("curPage"));
		
		// QA 총 개수
		MemberDAO memberDAO = MemberDAO.getInstance();
		int totalCnt = memberDAO.QAListCnt(mem_id);
		
		// paging
		PageHandler ph = new PageHandler(curPage, 5, 2, totalCnt);
		
		// QA 리스트 받기
		int startNum = (curPage-1) * ph.getPageSize() + 1;
		int endNum = startNum + ph.getPageSize() -1;
		
		List<MyPage_QABoardDTO> list = memberDAO.QAList(mem_id, startNum, endNum);
		
		JSONObject json = new JSONObject();
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(MyPage_QABoardDTO dto : list) {
				JSONObject tmp = new JSONObject();
				
				tmp.put("q_id", dto.getQ_id());
				tmp.put("mem_id", dto.getMem_id());
				tmp.put("product_id", dto.getProduct_id());
				tmp.put("kor_name", dto.getKor_name());
				tmp.put("gender", dto.getGender());
				tmp.put("q_passwd", dto.getQ_passwd());
				tmp.put("q_title", dto.getQ_title());
				tmp.put("q_content", dto.getQ_content());
				tmp.put("q_date", sdf.format(dto.getQ_date()));
				tmp.put("q_views", dto.getQ_views());
				tmp.put("q_answer", dto.getQ_answer());
				
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
