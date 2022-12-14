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
		transform: translateX(-1px);
	}
	
	.customer-wrap .customer-lnb .customer-lnb-item.eng a {
		font-family: "Montserrat", sans-serif;
		font-weight: 600;
		color: red;
		text-decoration: underline;
		letter-spacing: 0;
	}
	
	.customer-wrap .customer-lnb .customer-lnb-item+.customer-lnb-item {
		margin-top: 25px;
	}
	
	/* 중앙화면 */
	.aside-contents {
		margin-top: -118px;
   	 	width: calc(80% - 162px);
   	 	transform: translateX(152px);
	}
	
	.text-head2.eng, .text-head2 .eng {
		font-family: "Montserrat", sans-serif;
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
		flex-basis: calc(100% - 1px);
		-webkit-flex: 0 1 calc(99%/ 5 + 1px);
		font-size: 20px;
		letter-spacing: -1.35px;
		-webkit-transition: all .23s ease-out;
		transition: all 0.23s ease-out;
	}
	
	
	.wrap .contents-wrap .contents-aside .aside-contents {
	    width: calc(100% - 220px);
	}
	
	.border-line-box-header {
		position: relative;
	}
	
	.border-line-box-header+.border-line-box, .border-line-box-header+.mypage-detail-info-box,
		.border-line-box-header+.mypage-complete-wrap {
		margin-top: 16px;
	}
	
	.border-line-box {
		margin-top: 54px;
		border-top: 2px solid #000;
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
		font-family: "Montserrat", "Noto Sans KR", sans-serif;
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
		color: black;
	}
	
	table {
		border: 1px solid grey;
		border-collapse: collapse;
		margin-bottom: 30px;
		text-align: center;
		font-family: "Montserrat", "Noto Sans KR", sans-serif;
	}
	
	td {
		border: 1px solid grey;
		border-collapse: collapse;
		width: 180px;
		height: 40px;
		padding: 10px;
	}
	
	.text-head2 {
		color: #000;
		font-family: "Montserrat", "Noto Sans KR", sans-serif;
		font-weight: 800;
		font-size: 22px;
		letter-spacing: -1.1px;
		transform: translateX(138px);
	}
	
	.text-head2.eng, .text-head2 .eng {
		font-family: "Montserrat", sans-serif;
		letter-spacing: 18px;
	}
	
	li.product-manage {
		margin: 6px 0 0 10px;
	}
	
	/* =================================== */
	/* 공지사항 목록 css */
	.tbl-wrap.tbl-col {
		text-align: center;
		font-family: "Montserrat", "Noto Sans KR", sans-serif;
	}
	
	.border-line-box-header+.tbl-wrap, .border-line-box-header+.tbl-prod-wrap
		{
		margin-top: 14px;
	}
	
	.tbl-wrap.tbl-col table thead tr:last-child th {
		border-bottom: 1px solid #b5b5b5;
	}
	
	.tbl-col.notice-list table thead tr th {
		height: 50px;
	}
	
	.tbl-wrap.tbl-col table thead tr th {
		height: 21px;
		color: #666;
		padding: 9px 20px;
		border-top: 0px solid #000;
		font-weight: 500;
		line-height: 21px;
		letter-spacing: -.7px;
	}
	
	.tbl-col.notice-list table tbody {
		border-color: #d5d5d5;
	}
	
	.tbl-wrap.tbl-col table tbody {
		border-bottom: 1px solid #b5b5b5;
	}
	
	.tbl-wrap.tbl-col table tbody tr:first-child td {
		border-top: none;
	}
	
	.tbl-col.notice-list table tbody tr td {
		padding: 19px 10px 16px;
	}
	
	.tbl-wrap.tbl-col table tbody tr td {
		color: #000;
		height: 9px;
		padding: 13px 10px;
		border-top: 1px solid #e5e5e5;
		line-height: 20px;
		font-size: 15px;
		letter-spacing: -.75px;
	}
	.board-view-wrap .board-view-head .text-date {
	    color: #666;
	    transform: translateX(480px);
	    font-family: "Montserrat",sans-serif;
	    font-size: 15px;
	    line-height: 19px;
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

				<!-- 관리자 페이지 -->
				<div class="page-title-wrap mypage">
					<h2 class="text-head1 text-left">관리자 페이지</h2>
				</div>

				<!-- 고객센터 밑 화면 -->
				<div class="contents-inner contents-aside customer-wrap">
					<!-- 왼쪽 선택창 -->
					<div class="aside-wrap">
						<ol class="customer-lnb">
							<li class="customer-lnb-item eng"><a href="#" class="active">공지사항 관리</a></li>
							<li class="customer-lnb-item"><a href="manProductList.do">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>

					<!-- 중앙 화면 : 공지사항 목록 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">공지사항</h3>
						
						<div class="border-line-box fold-box-list-wrap">
						<div style="position: fixed; right: 2%; bottom: 103%;">  
							<input type="button" value="글 쓰기" onclick="location.href='manNoticeWriteForm.do'">
						</div>
						
							<div class="tbl-wrap tbl-col notice-list">
								<table style="table-layout:fixed">
									<!-- Row 1 : 번호 제목 작성일 -->
									<thead>
										<tr>
											<th width="75px">번호</th>
											<th width="500px">제목</th>
											<th width="121px">작성일</th>
										</tr>
									</thead>

									<!-- Row2~ : 찐 공지사항 목록 -->
									<tbody id="noticeList" style="vertical-align: center;">
										<c:if test="${totCnt > 0}">
											<c:forEach var="notice" items="${list}">
												<tr>
													<td>${startNum}</td>

													<td class="text-left" width=200><a
														href="manNoticeContent.do?notice_code=${notice.notice_code}&pageNum=${currentPage}">
															${notice.notice_title}</a></td>

													<td>${notice.notice_date}</td>
												</tr>

												<c:set var="startNum" value="${startNum - 1}"></c:set>
											</c:forEach>
										</c:if>

										<c:if test="${totCnt == 0}">
											<tr>
												<td colspan="7">NO DATA</td>
											</tr>
										</c:if>
									</tbody>
								</table>
							</div>

							<!-- 페이징 -->
							<div style="text-align: center; margin-top: 45px;">
								<c:if test="${startPage > blockSize}">
									<a href="manNoticeList.do?pageNum=${startPage - blockSize}">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="manNoticeList.do?pageNum=${i}">[${i}]</a>
								</c:forEach>

								<c:if test="${endPage < pageCnt }">
									<a href="manNoticeList.do?pageNum=${startPage + blockSize}">[다음]</a>
								</c:if>
							</div>
						</div>
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