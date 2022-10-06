<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	$(document).ready(function() {
		$("#updateBtn").click(function(){
			
			var str = "";
			var tdArr = new Array();
			var updateBtn = $(this);
			
			var tr = updateBtn.parent().parent();
			var td = tr.children();
			
			var product_id = td.eq(0).text();
			var pd_size    = td.eq(4).text();
			
			var price = $("#tbl tbody tr td input").eq(0).val();	//  price
			var stock = $("#tbl tbody tr td input").eq(1).val();	// 	stock
				
			alert("상품 " + product_id + " (사이즈 : " + pd_size + ") / " + "가격(" + price +")과 수량(" + stock + ")를 수정합니다~~");
			
			location.href='manProductUpdate.do?product_id='+product_id+'&pd_size='+pd_size+'&price='+price+'&stock='+stock;
		})
	});
	
	
	/* 가격, 재고 값 변할 때마다 alert 하게 */
	$( document ).ready( function() {
	    $( '#price, #stock' ).change( function() {
	      var price = $( '#price' ).val();
	      var stock = $( '#stock' ).val();
	      alert(price + " / " + stock);
	    } )
	  } );
	
</script>
<title>상품관리</title>
</head>
<link rel="stylesheet" href="../css/manageCss/notice.css">
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

									<!-- Row2~ : 찐 공지사항 목록 -->
									<tbody id="productList" style="vertical-align: center;">
										<c:if test="${totCnt > 0}">
											<c:forEach var="product_ImgSrcDTO" items="${productList}">
												<tr>
													<td>${product_ImgSrcDTO.product_id}</td>
													<td>${product_ImgSrcDTO.brand}</td>
													<td>${product_ImgSrcDTO.kor_name}</td>
													<td><input type="number" id="price" min="0" value="${product_ImgSrcDTO.price}" style="width:60px;"></td>
													<td>${product_ImgSrcDTO.pd_size}</td>
													<td><input type="number" id="stock" min="0" max="999" value="${product_ImgSrcDTO.stock}" style="width:60px;"></td>
													<td>
														<input type="button" class="updateBtn" id="updateBtn" value="수정">
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