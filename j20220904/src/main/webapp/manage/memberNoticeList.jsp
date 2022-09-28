<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<style type="text/css">
	table {
	    width: 100%;
	    border-collapse: collapse;
	    border-spacing: 0;
	    table-layout: fixed;
	}
	
	span {
		font: bold;
	}
	
	/* ============= FAQ  =============  */
	/* 고객센터 */
	.contents-inner .page-title-wrap {
		margin-top: 18px;
	}
	
	/* 고객센터 아랫부분 */
	.contents-wrap .page-title-wrap+.contents-inner.contents-aside {
	    margin-top: 50px;
	}
	
	/* 왼쪽 선택창 (공지사항, FAQ) */
	.wrap .contents-wrap .contents-aside .aside-wrap {
	    width: 220px;
	    padding-right: 60px;
	}
	
	.customer-wrap .customer-lnb {
	    -webkit-transform: translateY(-1px);
	    transform: translateY(-1px);
	}
	
	.customer-wrap .customer-lnb .customer-lnb-item.eng a {
	    font-family: "Montserrat",sans-serif;
	    font-weight: 600;
	    letter-spacing: 0;
	}
	
	.customer-wrap .customer-lnb .customer-lnb-item+.customer-lnb-item {
	    margin-top: 25px;
	}
	
	
	/* 중앙화면 */
	.aside-contents {
	    margin-top: -140px;
	    width: calc(95% - 162px);
	}
	.text-head2.eng, .text-head2 .eng {
	    font-family: "Montserrat",sans-serif;
	    letter-spacing: 0;
	}
	
	body .tab-wrap.multi-line {
	    font-size: 14px;
	}
	.tbl-search-wrap+.tbl-prod-wrap, .tbl-search-wrap+.tab-wrap {
	    margin-top: 40px;
	}
	body .tab-wrap {
		margin: 0 auto;
	    padding: 46px;
	}
	
	body .tab-wrap.multi-line .tabs {
	    padding: 0;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: -webkit-box;
	    display: -ms-flexbox;
	    display: flex;
	    display: -webkit-flex;
	    -webkit-box-pack: start;
	    -ms-flex-pack: start;
	    justify-content: flex-start;
	    -ms-flex-wrap: wrap;
	    /* flex-wrap: wrap; */
	    -webkit-transform: translateX(1px);
	    transform: translateX(138px);
	}
	body .tab-wrap .tabs {
	    margin-bottom: -25px;
	}
	body .tab-wrap.multi-line .tabs .tab-item {
	    color: #666;
	    height: 20px;
	    margin: 0 0 0 -1px;
	    padding: 20px 0;
	    border: 1px solid #d5d5d5;
	    flex-grow: 0;
	    flex-shrink: 1;
	    flex-basis: calc(100%- 1px);
	    -webkit-flex: 0 1 calc(99% /5 + 1px);
	    font-size: 20px;
	    letter-spacing: -1.35px;
	    -webkit-transition: all .23s ease-out;
	    transition: all 0.23s ease-out;
	}
	
	.border-line-box-header {
	    position: relative;
	}
	
	.border-line-box-header+.border-line-box, .border-line-box-header+.mypage-detail-info-box, .border-line-box-header+.mypage-complete-wrap {
	    margin-top: 16px;
	}
	.border-line-box {
	    border-top: 2px solid #000;
	    border-bottom: 1px solid #b5b5b5;
	    transform: translateX(138px);
	}
	ol, ul {
	    list-style: none;
	}
	.border-line-box .fold-box-list .fold-box:first-child {
	    border-top: none;
	}
	
	.text-head1 {
		color: #000;
	    font-family: "Montserrat","Noto Sans KR",sans-serif;
	    font-size: 32px;
	    font-weight: 700;
	    margin-top: 50px;
	    margin-bottom: 50px;
	}
	
	.contents-width {
	    width: 1200px;
	    margin: 0 auto;
	}
	
	
	.aside-wrap {
		width: 220px;
		padding-right: 60px;
	}
	
	 [id$="-toggle"] {
	   margin-right: 15px;
	 }
	 
	 a {
		text-decoration: none;
		color		   : black;
	}
	
	table {
		border: 1px solid grey;
		border-collapse: collapse;
		margin-bottom: 30px;
		text-align: center;
		font-family: "Montserrat","Noto Sans KR",sans-serif;
	}
	
	td {
		border: 1px solid grey;
		border-collapse: collapse;
		width: 180px;
		height:40px;
		padding : 10px;
	}
	
	.text-head2 {
	    color: #000;
	    font-family: "Montserrat","Noto Sans KR",sans-serif;
	    font-weight: 800;
	    font-size: 22px;
	    letter-spacing: -1.1px;
	    transform: translateX(138px);
	}
	
	.text-head2.eng, .text-head2 .eng {
	    font-family: "Montserrat",sans-serif;
	    letter-spacing: 18px;
	}
	
	li.product-manage {
		margin : 6px 0 0 10px;
	}
	
	/* =================================== */
	/* 공지사항 목록 */
	.tbl-wrap.tbl-col {
   	 	text-align: center;
   	 	font-family: "Montserrat","Noto Sans KR",sans-serif;
	}
	
	.border-line-box-header+.tbl-wrap, .border-line-box-header+.tbl-prod-wrap {
	    margin-top: 14px;
	}
</style>
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- 본문 -->
	<div id="contentsWrap" class="contents-wrap">
     <div class="contents-width">
	   <div class="contents-inner">
	   
	     <!--고객센터 -->
	   	  <div class="page-title-wrap mypage">
	      	<h2 class="text-head1 text-left">고객센터</h2>
	      </div>
	      
	      <!-- 고객센터 밑 화면 -->
	      <div class="contents-inner contents-aside customer-wrap">
	      	<!-- 왼쪽 선택창 -->
	      	<div class="aside-wrap">
	         <ol class="customer-lnb">
	            <li class="customer-lnb-item eng"><a href="#" class="active">공지사항</a></li>
	            <li class="customer-lnb-item"><a href="memberFaqView.jsp">FAQ</a></li>
	         </ol>
	       </div>
	       
	       <!-- 공지사항 목록 -->
	      <div class="tbl-wrap tbl-col notice-list">
	      	<table>
	      		<colgroup>
					<col style="width: 75px;">
					<col>
					<col style="width: 121px;">
				</colgroup>
				<thead>
					<tr>
						<th scope="col">번호</th>
						<th scope="col">제목</th>
						<th scope="col">작성일</th>
					</tr>
				</thead>
				
				<tbody id="noticeList">
				<tr>
							<td><span class="icon-notice"></span></td>
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="94">개인정보처리방침 개정 안내</a></td>
					<td class="date-txt">2022.08.01</td>
				</tr>
			
				<tr>
							<td>32</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="95">뉴발란스 소비자가 변동 안내</a></td>
					<td class="date-txt">2022.08.09</td>
				</tr>
			
				<tr>
					
							<td>31</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="93">개인정보처리방침 개정 안내</a></td>
					<td class="date-txt">2022.06.17</td>
				</tr>
			
				<tr>
					
							<td>30</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="92">아디다스 소비자가 변동 안내</a></td>
					<td class="date-txt">2022.05.26</td>
				</tr>
			
				<tr>
					
							<td>29</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="90">컨버스 소비자가 변동 안내</a></td>
					<td class="date-txt">2022.05.23</td>
				</tr>
			
				<tr>
					
							<td>28</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="89">개인정보처리방침 개정 안내</a></td>
					<td class="date-txt">2022.05.03</td>
				</tr>
			
				<tr>
					
							<td>27</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="88">편의점 픽업 서비스 종료 및 택배사 변경 안내</a></td>
					<td class="date-txt">2022.04.25</td>
				</tr>
			
				<tr>
					
							<td>26</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="87">개인정보처리방침 개정 안내</a></td>
					<td class="date-txt">2022.04.21</td>
				</tr>
			
				<tr>
					
							<td>25</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="85">고객센터 운영시간 변경 안내</a></td>
					<td class="date-txt">2022.04.18</td>
				</tr>
			
				<tr>
					
							<td>24</td>
						
					<td class="text-left"><a href="javascript:void(0)" class="notice-link" value="84">개인정보처리방침 개정 안내</a></td>
					<td class="date-txt">2022.04.12</td>
				</tr>
			
	</tbody>
	      	</table>
	      </div>
	       
	       
		</div>
		</div>
		</div>
	</div>

	<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>

</body>
</html>