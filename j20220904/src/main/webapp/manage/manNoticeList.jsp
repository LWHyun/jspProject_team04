<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/manageCss/notice.css">
<title>공지사항</title>
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