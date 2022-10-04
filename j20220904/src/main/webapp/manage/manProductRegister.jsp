<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
</style>
<script type="text/javascript" src="../js/jquery.js"></script>
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
							<li class="customer-lnb-item"><a href="manNoticeList.do">공지사항 관리</a></li>
							<li class="customer-lnb-item eng"><a href="manProductManage.do" class="active">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>

					<!-- 중앙 화면 : 공지사항 등록 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">상품 등록</h3>
						
						<form action="manProductRegisterPro.do?pageNum=${pageNum}" method="post" enctype="multipart/form-data">
						
						<table style="margin-top: 50px; margin-left:20%;">
							<tr>
								<td style="width:80px;"> 제품코드</td>
								<td> <input type="text" name="product_id" required="required"></td>
							</tr>
							<tr>
								<td> 브랜드 </td>
								<td>
									<!-- 나중에 시간되면 select 타입으로 바꾸기 -->
									<input type="text" name="brand" required="required">
								</td>
							</tr>
							<tr>
								<td>영어이름</td>
								<td> <input type="text" name="eng_name" required="required"></td>
							</tr>
							<tr>
								<td>한글이름</td>
								<td> <input type="text" name="kor_name" required="required"></td>
							</tr>
							<tr>
								<td>성별</td>
								<td>
									<input type="radio" name="gender" value="0">남자
									<input type="radio" name="gender" value="1">여자
								</td>
							</tr>
							<tr>
								<td>가격</td>
								<td><input type="text" name="price" required="required"></td>
							</tr>
							<tr>
								<td>색상</td>
								<td><input type="text" name="color" required="required"></td>
							</tr>
							<tr>
								<td>카테고리 코드</td>
								<td><input type="text" name="ca_code" required="required"></td>
							</tr>
							<tr>
								<td>상품 대표 이미지 등록</td>
								<!-- name 뭐 넣어야할지 모르겠어서 수정해야 할 듯 -->
								<td><input type="file" name="filename" required="required"></td>
							</tr>
							<tr>
								<td>상품 상세 이미지 등록</td>
								<!-- name 뭐 넣어야할지 모르겠어서 수정해야 할 듯 -->
								<td><input type="file" name="filename" required="required"></td>
							</tr>
						</table>
						<div style="margin-left:250px; margin-top:15px;">
							<input type="submit" value="확인">
							<input type="reset" value="취소">
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