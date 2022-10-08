<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<style type="text/css">
	table {
		width: 100%;
		border-collapse: collapse;
		border-spacing: 0;
		table-layout: fixed;
		transform: translate(166px, 67px);
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
		margin-top: -140px;
    	width: calc(95% - 162px);
    	transform: translate(111px, 32px);
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
	
/* 	td {
		border: 1px solid grey;
		border-collapse: collapse;
		width: 180px;
		height: 40px;
		padding: 10px;
	} */
	
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
		padding: 10px 10px;
		border-top: 0px solid #000;
		font-weight: 500;
		line-height: 21px;
		font-size: 14px;
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
</style>
</head>
<body>
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
							<li class="customer-lnb-item eng"><a href="manNoticeList.do" class="active">공지사항 관리</a></li>
							<li class="customer-lnb-item"><a href="manProductList.do">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>

					<!-- 중앙 화면 : 공지사항 등록 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">공지사항 등록</h3>
						
						<form action="manNoticeWritePro.do?pageNum=1" method="post">
						<input type="hidden" name="notice_code" value="0">
							
						<table style="text-align: left;border: 1px solid black;transform: translate(100px, 40px);width: 55%;">
							<tbody style="border: 1px solid black;">
								<tr style="border: 1px solid black;">
									<td style="width: 2%;text-align: center;padding: 10px 10px 10px 10px;border: 1px solid black; vertical-align: middle;">제목</td>
								<td style="width: 25%;vertical-align: middle;">
									<input type="text" name="notice_title" required="required" style="width: 386px;height: 30px;margin: 10px 10px 10px 10px;">
								</td>
							</tr>
							<tr style="border: 1px solid black;">
								<td style="text-align: center;padding: 10px 10px 30px 10px; vertical-align:middle;border: 1px solid black;">내용</td>
								<td style="width: 99px; padding: 10px 10px 10px 10px;">
									<textarea rows="10" cols="50" name="notice_content" required="required" style="padding: 10px 10px 10px 10px;"></textarea>
								</td>
							</tr>
						</tbody></table>
						
						<div style="transform: translate(114px, 81px);margin-top: 10px;margin-bottom: 179px;">
							<input type="submit" value="확인">
							<input type="reset" value="모두 지우기">
						</div>
						</form>
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