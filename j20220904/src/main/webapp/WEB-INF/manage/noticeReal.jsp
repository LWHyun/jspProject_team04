<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Navigation Bar</title>
<link rel="stylesheet" href="style.css">
<style type="text/css">
.aside-contents {
	width: calc(100% - 220px);
	margin: auto;
}

ul {
	background-color: #EE1C25;
	list-style-type: none;
	margin: 0;
	padding: auto;
	list-style-type: none;
}

a.notice-link {
	color: black;
	text-decoration: none;
}

a:hover {
	color: green;
	text-decoration: underline;
}

table thead tr th {
	color: #666;
	padding: 10px 10px;
	border-top: 2px solid #000;
	font-weight: bold;
	line-height: 21px;
}

td {
	text-align: center;
	margin    : auto;
	padding   : 5px;
	border-top: 1px solid #e5e5e5;
	border-bottom : 1px solid
}

td.text-left td.date-text {
	text-align: left;
}

span.icon-notice {
	content:url("https://cdn-icons-png.flaticon.com/512/3179/3179416.png");
	width  : 18px;
	height : 18px;
}

.aside-wrap.customer-lnb li{
	list-style-type:none;
}
</style>
</head>
<body>
	<form>
		<div class="aside-wrap" align="left">
			<h2 class="text-head1 text-left">고객센터</h2>
			
			<ol class="customer-lnb">
				<li><a href="#">FAQ</a></li>
				<li><a href="#">공지사항</a></li>
			</ol>
		</div>
	
		<div class="aside-contents" align="center">
			<div class="border-line-box-header">
				<h3 class="text-head2">공지사항</h3>
			</div>
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

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="98">추석연휴 기간 배송안내 </a></td>
							<td class="date-txt">2022.09.05</td>
						</tr>

						<tr>

							<td><span class="icon-notice"></span></td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="94">개인정보처리방침 개정 안내</a></td>
							<td class="date-txt">2022.08.01</td>
						</tr>

						<tr>

							<td>32</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="95">뉴발란스 소비자가 변동 안내</a></td>
							<td class="date-txt">2022.08.09</td>
						</tr>

						<tr>

							<td>31</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="93">개인정보처리방침 개정 안내</a></td>
							<td class="date-txt">2022.06.17</td>
						</tr>

						<tr>

							<td>30</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="92">아디다스 소비자가 변동 안내</a></td>
							<td class="date-txt">2022.05.26</td>
						</tr>

						<tr>

							<td>29</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="90">컨버스 소비자가 변동 안내</a></td>
							<td class="date-txt">2022.05.23</td>
						</tr>

						<tr>

							<td>28</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="89">개인정보처리방침 개정 안내</a></td>
							<td class="date-txt">2022.05.03</td>
						</tr>

						<tr>

							<td>27</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="88">편의점 픽업 서비스 종료 및 택배사 변경 안내</a></td>
							<td class="date-txt">2022.04.25</td>
						</tr>

						<tr>

							<td>26</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="87">개인정보처리방침 개정 안내</a></td>
							<td class="date-txt">2022.04.21</td>
						</tr>

						<tr>

							<td>25</td>

							<td class="text-left"><a href="javascript:void(0)"
								class="notice-link" value="85">고객센터 운영시간 변경 안내</a></td>
							<td class="date-txt">2022.04.18</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			
			<!-- 페이징 처리 -->
			<div id="pagingDiv" class="pagination-wrap">
				<ol class="c">
					<li><button type="button" pagenum="1">1</button></li>
					<li><button type="button" pagenum="2">2</button></li>
					<li><button type="button" pagenum="3">3</button></li>
					<li><button type="button" pagenum="4">4</button></li>
					<li><button type="button" pagenum="5">5</button></li>
				</ol>
			</div>
			
	</form>
</body>
</html>