<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPageOrderList.css">
<div class="border-line-box-header">
    <h3 class="text-head2">최근 주문내역</h3>
    <div class="btn-wrap">
        <a href="${pageContext.request.contextPath }/mypage/orderList.do"><button type="button" class="btn-txt-arr" id="moreOrder">더보기</button></a>
    </div>
</div><!-- border-line-box-header -->

<div class="border-line-box order-status-wrap">
    <div class="order-list-box">
        <ul class="order-list">
            <li><a href="#" class="val" id="standByCnt">0</a><span class="order-type">입금대기</span></li>
            <li><a href="#" class="val" id="completeCnt">0</a><span class="order-type">결제완료</span></li>
            <!-- <li><a href="#" class="val" id="productPreparationCnt">0</a><span class="order-type">상품준비중</span></li>
            <li><a href="#" class="val" id="dlvyingPickupReadyCnt">0</a><span class="order-type">배송중/픽업준비완료</span></li>
            <li><a href="#" class="val" id="dlvyFinishCnt">0</a><span class="order-type">배송/수령완료</span></li> -->
        </ul>
    </div>
</div><!-- border-line-box order-status-wrap 최근 주문내역 -->

<div class="border-line-box-header order-header">
	<h3 class="text-head2">주문/배송 현황 조회</h3>
</div><!-- border-line-box-header -->

<!-- // 주문 갯수가 있을 때 없을 때 display:none 처리는 myPage.jsp에 있는 jquery 의 영향을 받고있음 -->
<div class="mypage-no-data has-line-bottom" style="display:none;" >
    <div class="flex-box">
        <p class="no-data-text">주문한 정보가 없습니다.</p>
    </div>
</div><!-- has-line-bottom -->

<div class="tab-wrap justify ui-tabs ui-corner-all ui-widget ui-widget-content">
	<ul class="tab-ul">
        <li>
            일반 주문
        </li>
    </ul>
    
    <!-- s : tab_content -->
    <div id="tabProdOrder" class="tab-content ui-tabs-panel ui-corner-bottom ui-widget-content">
    	<!-- 주문 정보 감싸는 wrap -->
    	<div class="tbl-prod-wrap" id="normalOrderPagingArea">
    		<!-- 각각의 주문 정보 -->
    		<div class="tbl-wrap tbl-col tbl-prod">
    			<div class="tbl-header order">
    				<div class="customer-action-info">
    					<span class="action-item">
    						<span class="action-item-label">주문번호</span>
    						<span class="action-item-value bold"><a href="#" name="orderNo" value="2022100577038">2022100577038</a></span>
    					</span>
    					<span class="action-item">
								<span class="action-item-label">주문일시</span>
								<span class="action-item-value">2022-10-05 17:52:07 </span>
						</span>
    				</div>
    				<div class="right-box">
    					<div class="prod-price">
    						<span class="price-text">총 결제금액</span>
							<span class="val">258,000</span>
							<span class="unit">원</span>
    					</div>
    					<button type="button" class="btn btn-sm" name="orderCancelAllYn">전체 주문취소</button>
    				</div>
    			</div><!-- tbl-header order -->
    			
    			<table>
    				<caption>주문번호 2022100577038 상품</caption>
    				<colgroup>
						<col style="width: 50%">
						<col class="prod-cost">
						<col>
						<col class="btn-sm">
					</colgroup>
					<tbody>
						<tr>
							<td>
								<span class="prod-item no-util individual">
									<span class="prod-item-inner">
										<span class="prod-link">
											<a href="#" class="img-wrap">
												<img src="https://image.a-rt.com/art/product/2020/08/34116_1598495392321.jpg?shrink=100:100" alt="가젤" onerror="javascript:abc.biz.product.common.util.image.noImage(this);">
											</a>
											<span class="prod-info-wrap">
												<span class="prod-brand">아디다스</span>
												<a href="#" class="prod-name multi-line">가젤</a>
												<span class="prod-option">
														<span class="prod-option-value">220 / 1개</span>
												</span>
											</span>
										</span>
									</span>
								</span>
							</td><!-- 상품 정보 td -->
							<td class="text-center">
								<span class="prod-cost">
									<span class="value">129,000</span>
									<span class="unit">원</span>
								</span>
							</td><!-- 주문 가격 정보 td -->
							<td class="text-center"> 									 
								<span class="prod-status">입금대기</span>
							</td><!-- 입금 대기 td -->
							<td>
								<button type="button" class="btn btn-sm btn-line" name="orderCancel">주문 취소</button>
							</td><!-- 주문 취소 버튼 td -->
						</tr>
					</tbody>
					<tbody>
						<tr>
							<td>
								<span class="prod-item no-util individual">
									<span class="prod-item-inner">
										<span class="prod-link">
											<a href="#" class="img-wrap">
												<img src="https://image.a-rt.com/art/product/2020/08/34116_1598495392321.jpg?shrink=100:100" alt="가젤" onerror="javascript:abc.biz.product.common.util.image.noImage(this);">
											</a>
											<span class="prod-info-wrap">
												<span class="prod-brand">아디다스</span>
												<a href="#" class="prod-name multi-line">가젤</a>
												<span class="prod-option">
														<span class="prod-option-value">220 / 1개</span>
												</span>
											</span>
										</span>
									</span>
								</span>
							</td><!-- 상품 정보 td -->
							<td class="text-center">
								<span class="prod-cost">
									<span class="value">129,000</span>
									<span class="unit">원</span>
								</span>
							</td><!-- 주문 가격 정보 td -->
							<td class="text-center"> 									 
								<span class="prod-status">입금대기</span>
							</td><!-- 입금 대기 td -->
							<td>
								<button type="button" class="btn btn-sm btn-line" name="orderCancel">주문 취소</button>
							</td><!-- 주문 취소 버튼 td -->
						</tr>
					</tbody>
					
    			</table><!-- table -->
    		</div><!-- tbl-wrap -->
    		
    		<div class="tbl-wrap tbl-col tbl-prod">
    			<div class="tbl-header order">
    				<div class="customer-action-info">
    					<span class="action-item">
    						<span class="action-item-label">주문번호</span>
    						<span class="action-item-value bold"><a href="#" name="orderNo" value="2022100577038">2022100577038</a></span>
    					</span>
    					<span class="action-item">
								<span class="action-item-label">주문일시</span>
								<span class="action-item-value">2022-10-05 17:52:07 </span>
						</span>
    				</div>
    				<div class="right-box">
    					<div class="prod-price">
    						<span class="price-text">총 결제금액</span>
							<span class="val">258,000</span>
							<span class="unit">원</span>
    					</div>
    					<button type="button" class="btn btn-sm" name="orderCancelAllYn">전체 주문취소</button>
    				</div>
    			</div><!-- tbl-header order -->
    			
    			<table>
    				<caption>주문번호 2022100577038 상품</caption>
    				<colgroup>
						<col style="width: 50%">
						<col class="prod-cost">
						<col>
						<col class="btn-sm">
					</colgroup>
					<tbody>
						<tr>
							<td>
								<span class="prod-item no-util individual">
									<span class="prod-item-inner">
										<span class="prod-link">
											<a href="#" class="img-wrap">
												<img src="https://image.a-rt.com/art/product/2020/08/34116_1598495392321.jpg?shrink=100:100" alt="가젤" onerror="javascript:abc.biz.product.common.util.image.noImage(this);">
											</a>
											<span class="prod-info-wrap">
												<span class="prod-brand">아디다스</span>
												<a href="#" class="prod-name multi-line">가젤</a>
												<span class="prod-option">
														<span class="prod-option-value">220 / 1개</span>
												</span>
											</span>
										</span>
									</span>
								</span>
							</td><!-- 상품 정보 td -->
							<td class="text-center">
								<span class="prod-cost">
									<span class="value">129,000</span>
									<span class="unit">원</span>
								</span>
							</td><!-- 주문 가격 정보 td -->
							<td class="text-center"> 									 
								<span class="prod-status">입금대기</span>
							</td><!-- 입금 대기 td -->
							<td>
								<button type="button" class="btn btn-sm btn-line" name="orderCancel">주문 취소</button>
							</td><!-- 주문 취소 버튼 td -->
						</tr>
					</tbody>
					
    			</table><!-- table -->
    		</div><!-- tbl-wrap -->
    	</div><!-- tbl-prod-wrap -->
    	
    	<!-- 페이징 처리부분 -->
	    <div id="mypage-product-interest-pagination" class="pagination-wrap">
	    	<div>	
	    		<!-- 동적 처리 부분 -->
	    		<ol class="pagination-list">
	    			<%-- <c:if test="${ph.showPrev == true }">		
		    			<li class="pagination-item showPrev">
		    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${ph.startPage-1}">&lt;</a>
		    			</li>
	    			</c:if>
	    			
	    			<c:forEach var="i" begin="${ph.startPage }" end="${ph.endPage }">
	    				<c:if test="${requestScope.curPage == i}">
			    			<li class="pagination-item" name="li_page">			
			    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${i }">
			    				<button type="button" class="btn-page btn-page-num selected">${i }</button>		
			    				</a>
		    				</li>	
	    				</c:if>
	    				<c:if test="${requestScope.curPage != i}">
			    			<li class="pagination-item" name="li_page">	
			    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${i }">		
			    				<button type="button" class="btn-page btn-page-num">${i }</button>		
			    				</a>
		    				</li>
	    				</c:if>
	    			</c:forEach>	
    				
    				<c:if test="${ph.showNext == true}">
	    				<li class="pagination-item showNext">
		    				<a href="${pageContext.request.contextPath }/mypage/likeProList.do?curPage=${ph.endPage+1}">&gt;</a>
		    			</li>	
	    			</c:if> --%>
   				</ol>
			</div>
		</div><!-- pagination-wrap -->
    </div>
    <!-- e : tab_content -->
</div><!-- tab-wrap -->

<script>
$(function() {
	// 주문 내역이 있을 때 없을 때 display:none 처리
	var orderlistCnt = Number(${requestScope.ordersCnt});
	if(orderlistCnt == 0) {
		$('.mypage-no-data').css('display', '');
		$('.tab-wrap').css('display', 'none');
		$('.order-header').css({
			'border-bottom' : '2px solid #000',
			'height' : '45px',
			'line-height' : '45px'
		});
	} else {
		$('.mypage-no-data').css('display', 'none');
		$('.tab-wrap').css('display', '');
		$('.order-header').css({
			'border-bottom' : '',
			'height' : '',
			'line-height' : ''
		});
	}
});
</script>