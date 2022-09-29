<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A Board</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../css/boardCss/boardCommon.css">
<link rel="stylesheet" href="../css/boardCss/qnaBoard.css">
</head>
<body>
	<div id="header">
		<jsp:include page="../main//header.jsp"></jsp:include>
	</div>
	<div id="content">
		<div id="productQna" class="top-wrap">
			<div class="inner">
				<ul class="tabs">
					<li class="tab-item">
						<a href="#" class="tab-link">상품정보</a>
					</li>
					<li class="tab-item">
						<a href="#" class="tab-link">상품후기
							<span class="num">(37)</span>
						</a>
					</li>
					<li class="tab-item ui-tabs-active">
						<a href="#" class="tab-link">상품 Q&amp;A
							<span class="num">(${totCnt})</span>
						</a>
					</li>
					<li class="tab-item">
						<a href="#" class="tab-link">배송/교환/반품/AS안내</a>
					</li>
				</ul>
				<div class="tab-content">
					<ul class="bullet-text-list">
						<li class="bullet-text">
							단순 상품비방, 상업적인 내용, 미풍양속 위반, 게시판의 성격에 맞지 않는 글은 통보 없이 삭제될 수 있습니다.
						</li>
						<li class="bullet-text">
							오프라인 매장 재고현황 문의는 ‘전국오프라인매장’ 정보를 참고하시어 해당 매장으로 문의하시면 좀 더 정확한 확인이 가능합니다.
						</li>
						<li class="bullet-text">
							주문/배송/반품 및 AS 등 기타 문의는 1:1 상담문의(마이페이지>쇼핑수첩>나의상담)에 남겨주시기 바랍니다.<br>
							(상품 자체에 대한 문의가 아닌 주문/배송/반품 및 AS 등의 기타문의를 작성하실 경우 나의상담 메뉴로 글이 이동될 수 있습니다.)
						</li>
					</ul>
				</div>
				<!-- Q&A 탭 -->
				<div class="tab-qna">
					<div class="border-line-box">
						<!-- 글이 없을 때 -->
						<div class="flex-box" style="display: none;">
							<p class="no-data-text">작성된 Q&A가 없습니다.</p>
						</div>
						<!-- Q&A 글 목록 -->
						<table>
							<tr>
								<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
							</tr>
							<!-- 글 목록 -->
							<c:if test="${totCnt > 0 }">
								<c:forEach var="board" items="${qAList }">
									<tr>
										<td>${startNum }</td>
										<td>${board.q_title}</td>
										<td>${board.mem_id}</td>
										<td>${board.q_date }</td>
										<td>${board.q_views }</td>
									</tr>
									<c:set var="startNum" value="${startNum - 1}"/>
								</c:forEach>
							</c:if>
						</table>
						
						<!-- 나중에 수정 -->
						<div style="text-align: center;">
							<c:if test="${startPage > blockSize }">
								<a href='qnaBoard.do?pageNum=${startPage-blockSize}'>[이전]</a>
							</c:if>
							<c:forEach var="i" begin="${startPage}" end="${endPage}">
								<a href='qnaBoard.do?pageNum=${i}'>[${i}]</a>
							</c:forEach>
							<c:if test="${endPage < pageCnt }">
								<a href='qnaBoard.do?pageNum=${startPage+blockSize}'>[다음]</a>
							</c:if>
						</div>	
						<!-- <ul class="fold-box-list">
							<li class="fold-box">
								<div class="fold-box-header">
									<div class="question-title">금요일 수거해갔어요.</div>
									<div class="question-info">
										<span class="question-type">h******9</span>
										<span class="question-date">2022.03.21</span>
										<span class="answer-status complete">답변완료</span>
									</div>
								</div>
								<div class="fold-box-contents">
									<div class="question-box-detail">
										<div class="question-desc">
											금요일 수거해갔어요. 신속하게 환불 처리 부탁드립니다.
										</div> 
									</div>
									<div class="answer-box">
										<p class="desc">  아이콘?
										안녕하세요 고객님.<br><br>

										먼저 ABC 마트를 이용해주셔서 감사합니다.<br><br>
										
										해당 공간은 상품 문의만을 전담하는 공간으로,<br>
										그 외 문의는 고객센터(1588-9667)를 이용해 주시면 감사하겠습니다.<br><br>
										
										더 나은 서비스 제공을 위해 항상 노력하는 ABC 마트가 되겠습니다.<br>
										감사합니다.
										</p>
									</div>
								</div>
							</li>
						</ul> -->
						<!-- 페이징 -->
						<div class="pagination-wrap" id="product-review-pagination">
							<div>
								<ol class="pagination-list">
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num selected">1</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">2</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">3</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">4</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">5</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">6</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">7</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">8</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">9</button>
									</li>
									<li class="pagination-item">
										<button type="button" class="btn-page btn-page-num">10</button>
									</li>
								</ol>
							</div>
							<div class="btn-wrap text-right">
								<a href="qnaWriteForm.do" class="btn btn-dialog">Q&A 작성</a>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>
	<div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div>
</body>
</html>