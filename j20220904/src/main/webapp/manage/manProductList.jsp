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
	$(document).ready(function () {
		$('#delBtn').click(function() {
			if($("input[type=radio]").on("click", function(e) {
				// e.target 	  : 선택된 타깃
				// e.target.value : 선택된 타깃의 value 값
				// e.target.name  : 선택된 타깃의 네임
				alert(e.target.value);
				location.href = 'manProductDelete.do?product_id=' + e.target.value;
			}))
			
		})
	})
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
								<button name="button" id="delBtn" onclick="location.href='manProductDelete.do?product_id=${product.product_id}'">상품 삭제</button>
							</span>
						
							<div class="tbl-wrap tbl-col notice-list">
								<table style="table-layout:fixed">
									<!-- Row 1 : 선택 | 제품코드 | 브랜드 | 한글 이름 | 가격 | 색상 | 카테고리 코드 */ -->
									<thead>
										<tr>
											<th>선택</th>
											<th>제품코드</th>
											<th>브랜드</th>
											<th width="200px">한글이름</th>
											<th>가격</th>
											<th width="70px">색상</th>
											<th width="80px">카테고리<br>코드</th>
										</tr>
									</thead>

									<!-- Row2~ : 찐 공지사항 목록 -->
									<tbody id="productList" style="vertical-align: center;">
										<c:if test="${totCnt > 0}">
											<c:forEach var="product" items="${productList}">
												<tr>
													<td>
														<input type="radio" name="toDelete" value="${product.product_id}">
													</td>
													<td>${product.product_id}</td>
													<td>${product.brand}</td>
													<td>${product.kor_name}</td>
													<td>${product.price}</td>
													<td>${product.color}</td>
													<td>${product.ca_code}</td>
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