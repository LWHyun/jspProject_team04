<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Board</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../css/boardCss/boardCommon.css">
<link rel="stylesheet" href="../css/boardCss/reviewBoard.css">
</head>
<body>
	<%-- <div id="header">
		<jsp:include page="../main//header.jsp"></jsp:include>
	</div> --%>
	<div id="content">
		<div id="productReview" class="top-wrap">
			<div class="inner">
				<!-- 메뉴 탭 list -->
				<ul class="tabs">
					<li class="tab-item">
						<a href="#" class="tab-link">상품정보</a>
					</li>
					<li class="tab-item ui-tabs-active">
						<a href="#" class="tab-link">상품후기
							<span class="num">(37)</span>
						</a>
					</li>
					<li class="tab-item">
						<a href="#" class="tab-link">상품 Q&amp;A
							<span class="num">(37)</span>
						</a>
					</li>
					<li class="tab-item">
						<a href="#" class="tab-link">배송/교환/반품/AS안내</a>
					</li>
				</ul>
				<!-- 상품 후기 안내사항 -->
				<div class="tab-content">
					<ul class="bullet-text-list">
						<li class="bullet-text">일반(텍스트) 후기는 500포인트, 포토 후기는 1,000포인트, 동영상 후기는 1,500포인트를 적립해드립니다.
							<br>(동영상 후기는 mp4 형식의 파일만 해당됩니다.)
						</li>
						<li class="bullet-text">
							후기 등록일 이후 최대 3일 이내에 후기 포인트 적립해드립니다. (주말 및 공휴일 제외)
						</li>
						<li class="bullet-text">
							상품 결제 가격이 2만 원 미만인 경우 후기 포인트가 지급되지 않습니다.
						</li>
						<li class="bullet-text">
							구매 확정일로부터 30일 이후에 후기를 등록한 경우 후기 포인트가 지급되지 않습니다.
						</li>
						<li class="bullet-text">
							직접 촬영한 사진 및 동영상이 아닐 경우 포토/동영상 후기에 대한 포인트 지급이 제외됩니다.
						</li>
						<li class="bullet-text">
							동일한 이미지를 사용하여 여러 번 상품 후기를 등록하시는 경우 포토 후기에 대한 포인트는 한 번만 지급됩니다.
						</li>
						<li class="bullet-text">
							허위, 과대광고, 문의 등 후기 내용과 관련 없는 글은 통보 없이 삭제될 수 있습니다.
						</li>
						<li class="bullet-text">
							포인트는 통합멤버십 회원에게만 지급됩니다.
						</li>
						<li class="bullet-text">
							상품후기는 A-RT.COM 주문 상품만 작성 가능합니다.
						</li>
						<li class="bullet-text">
							작성하신 상품후기는 A-RT.COM에 귀속되며, 마케팅 용도로 사용될 수 있습니다.
						</li>
					</ul>
				</div>
				<!-- 평균 별점 및 리뷰 -->
				<div class="review-gray-box">
					<div class="rating-box">
						<div class="tit_type1">상품만족도</div>
						<div class="tit_type2">
							95
							<span class="unit">%</span>
						</div>
						<div class="tit_type3">
							<div class="rating-container">
								<div class="rating-stars">
									<span class="empty-stars">
										<span class="material-symbols-outlined" id="empty-star">star</span>
										<span class="material-symbols-outlined" id="empty-star">star</span>
										<span class="material-symbols-outlined" id="empty-star">star</span>
										<span class="material-symbols-outlined" id="empty-star">star</span>
										<span class="material-symbols-outlined" id="empty-star">star</span>
									</span>
									<span class="filled-stars" style="width: 100%; display: none;">
										<span class="material-symbols-outlined" id="filled-star">star</span>
										<span class="material-symbols-outlined" id="filled-star">star</span>
										<span class="material-symbols-outlined" id="filled-star">star</span>
										<span class="material-symbols-outlined" id="filled-star">star</span>
										<span class="material-symbols-outlined" id="filled-star">star</span>
									</span>
								</div>
							</div>
							<span class="num">5</span>
						</div>
					</div>
					<div class="review-text-contents">
						<div class="left-box">
							<div class="review-category-list-wrap">
								<ul class="review-category-list">
									<li class="category-item" id="">
										<div class="category">사이즈</div>
										<div class="text" id="">정 사이즈</div>
										<div class="percent">
											81
											<span class="unit">%</span>
										</div>
									</li>
									<li class="category-item" id="">
										<div class="category">색상</div>
										<div class="text" id="">화면과 같음</div>
										<div class="percent">
											89
											<span class="unit">%</span>
										</div>
									</li>
									<li class="category-item" id="">
										<div class="category">발볼</div>
										<div class="text" id="">적당함</div>
										<div class="percent">
											77
											<span class="unit">%</span>
										</div>
									</li>
									<li class="category-item" id="">
										<div class="category">발등</div>
										<div class="text" id="">적당함</div>
										<div class="percent">
											84
											<span class="unit">%</span>
										</div>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<!-- 리뷰 모아보기 -->
				<div class="tab-review">
					<!-- 리뷰 개수 -->
					<div class="border-line-box-header">
						<span class="search-result-text">
							총 37개의 리뷰가 있습니다.
						</span>
					</div>
					<!-- 후기 리스트 -->
					<div class="border-line-box">
						<!-- 후기 없을 때 -->
						<div class="flex-box" style="display: none;">
							<p class="no-data-text">작성된 후기가 없습니다. 첫 번째 후기를 남겨보세요.</p>
						</div>
						<!-- 후기 글 4/5개씩(고민) -->
						<ul class="fold-box-list">
							<!-- 게시글 1개 -->
							<li class="fold-box">
								<div class="fold-box-header">
									<div class="review-box">
										<!-- 별점 표시 나중에 구현 -->
										<div class="rating-wrap">
											<!-- <div class="star-rating"></div> -->
											<ul class="rating-list">
												<li>
													<span class="rating-type">사이즈</span>
													<span class="desc">정 사이즈</span>
												</li>
												<li>
													<span class="rating-type">색상</span>
													<span class="desc">화면과 같음</span>
												</li>
												<li>
													<span class="rating-type">발볼</span>
													<span class="desc">적당함</span>
												</li>
												<li>
													<span class="rating-type">발등</span>
													<span class="desc">적당함</span>
												</li>
											</ul>
										
										</div>
																				<p class="review-text">1 신발이 너무 예뻐요.</p>
										<div class="id-date-text">
											<span class="id-text">0*******a</span>
											<span class="date-text">2022.09.02 13:53:47</span>
										</div>
									</div>
								</div>
							</li>
							<li class="fold-box">
								<div class="fold-box-header">
									<div class="review-box">
										<div class="rating-wrap">
											<ul class="rating-list">
												<li>
													<span class="rating-type">사이즈</span>
													<span class="desc">정 사이즈</span>
												</li>
												<li>
													<span class="rating-type">색상</span>
													<span class="desc">화면과 같음</span>
												</li>
												<li>
													<span class="rating-type">발볼</span>
													<span class="desc">적당함</span>
												</li>
												<li>
													<span class="rating-type">발등</span>
													<span class="desc">적당함</span>
												</li>
											</ul>
										</div>
										<p class="review-text">2 신발이 너무 예뻐요.</p>
										<div class="id-date-text">
											<span class="id-text">0*******a</span>
											<span class="date-text">2022.09.02 13:53:47</span>
										</div>
									</div>
								</div>
							</li>
						</ul>
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
								<a href="reviewWriteForm.jsp" class="btn btn-dialog">상품 후기 작성</a>
							</div>
						</div>
						
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<%-- <div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div><!-- footer --> --%>
</body>
</html>