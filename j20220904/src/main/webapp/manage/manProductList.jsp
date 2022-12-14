<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    width: calc(93% - 162px);
    transform: translateX(74px);
}

.text-head2.eng, .text-head2 .eng {
	font-family: "Montserrat", sans-serif;
	letter-spacing: 0;
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
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	/* 상품 삭제 버튼 */
	 $(function() {
		$(".deleteBtn").click(function(){
			
				var str = "";
				var tdArr = new Array();
				var deleteBtn = $(this);
				
				var tr = deleteBtn.parent().parent();
				var td = tr.children();
				
				console.log("클릭한 Row의 모든 데이터 : " + tr.text());
				
				var no1 = td.eq(0).text();	//  product_id
				var no2 = td.eq(4).text();	// 	pd_size
				
				alert("사이즈 " + no2 +"의 " + no1 + "를 삭제합니다");
				
				location.href='manProductDeletePro.do?product_id='+no1+'&pd_size='+no2;
			})
	});

 	/* 상품 수정 버튼 */
	$(function() {
		$(".updateBtn").click(function(){
			
			var str = "";
			var tdArr = new Array();
			var updateBtn = $(this);
			
			var tr = updateBtn.parent().parent();
			var td = tr.children();
			var input = td.children();
			
			console.log("클릭한 Row의 모든 데이터 : " + tr.text());
			
			var product_id = td.eq(0).text();	// product_id
			var pd_size    = td.eq(4).text();	// pd_size
			
			//var price = $("#tbl tbody tr td input").eq(0).val();	//  price
			//var stock = $("#tbl tbody tr td input").eq(1).val();	// 	stock
			var price = input.eq(0).val();	//  price
			var stock = input.eq(1).val();	// 	stock	
			alert("상품 " + product_id + " (사이즈 : " + pd_size + ") / " + "가격(" + price +")과 수량(" + stock + ")를 수정합니다");
			
			location.href='manProductUpdate.do?product_id='+product_id+'&pd_size='+pd_size+'&price='+price+'&stock='+stock;
		})
	});

	
	
  	/* 가격, 재고 값 변할 때마다 alert 하게 */
/*	$( function() {
	    $( '#price, #stock' ).change( function() {
	      var price = $( '#price' ).val();
	      var stock = $( '#stock' ).val();
	      console.log(price + " / " + stock);
	    } )
	  } ); */
	
</script>
<title>상품관리</title>
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
							<li class="customer-lnb-item"><a href="manNoticeList.do">공지사항 관리</a></li>
							<li class="customer-lnb-item eng"><a href="manProductList.do" class="active">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>

					<!-- 중앙 화면 : 상품 목록 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">상품관리</h3>
						
						<div class="border-line-box fold-box-list-wrap">
							<span style="position: fixed; right: 2%; bottom: 103%;">  
								<input type="button" value="상품 등록" onclick="location.href='manProductRegister.do'">
							</span>
						
							<div class="tbl-wrap tbl-col notice-list">
								<table style="table-layout:fixed" id="tbl">
									<!-- Row 1 : 제품코드 | 브랜드 | 한국 이름 | 가격 | 사이즈 | 재고 */ -->
									<thead>
										<tr>
											<th>제품코드</th>
											<th>브랜드</th>
											<th width="200px">한글이름</th>
											<th>가격</th>
											<th width="70px">사이즈</th>
											<th width="80px">재고</th>
											<th>기타</th>
										</tr>
									</thead>

									<!-- Row2 : 찐 상품 목록 -->
									<tbody id="productList" style="vertical-align: center;">
										<c:if test="${totCnt > 0}">
											<c:forEach var="product_ImgSrcDTO" items="${productList}" varStatus="status">
												<tr>
													<td id="product_id${status.index}">${product_ImgSrcDTO.product_id}</td>
													<td>${product_ImgSrcDTO.brand}</td>
													<td>${product_ImgSrcDTO.kor_name}</td>
													<td><input type="number" name="price" min="0" id="price${status.index}" value="${product_ImgSrcDTO.price}" style="width:60px;"></td>
													<td id="pd_size${status.index}">${product_ImgSrcDTO.pd_size}</td>
													<td><input type="number" name="stock" min="0" id="stock${status.index}" max="999" value="${product_ImgSrcDTO.stock}" style="width:60px;"></td>
													<td>
														<input type="button" class="updateBtn" value="수정" onclick="updateBtnClick(${status.index})">
														<input type="button" class="deleteBtn" id="deleteBtn" value="삭제" onclick="location.href='manProductDelete.do?product_id=${product_ImgSrcDTO.product_id}&pd_size=${product_ImgSrcDTO.pd_size }&pageNum=${pageNum }'">
													</td>
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
									<a href="manProductList.do?pageNum=${startPage - blockSize}">[이전]</a>
								</c:if>

								<c:forEach var="i" begin="${startPage}" end="${endPage}">
									<a href="manProductList.do?pageNum=${i}">[${i}]</a>
								</c:forEach>

								<c:if test="${endPage < pageCnt }">
									<a href="manProductList.do?pageNum=${startPage + blockSize}">[다음]</a>
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