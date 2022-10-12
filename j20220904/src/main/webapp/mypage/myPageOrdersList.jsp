<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPageOrderList.css">
<style>
/* has-line-bottom 찜한 상품 없습니다 */
.order-mypage-no-data.has-line {
    border-bottom: 1px solid #d5d5d5;
}

.order-mypage-no-data .flex-box{
    height: 500px;
}
.flex-box {
    display: flex;
    justify-content: space-around;
    flex-direction: column;
    align-content: space-around;
    align-items: center;
    flex-wrap: nowrap;
}
.order-mypage-no-data .flex-box .no-data-text {
    padding-top: 107px;
    background: url(https://abcmart.a-rt.com/static/images/common/common_icon_error.png) no-repeat center top;
    font-size: 20px;
    letter-spacing: -1px;
    font-weight: 800;
}
</style>
<div class="border-line-box-header">
    <h3 class="text-head2">최근 주문내역</h3>
    <div class="btn-wrap">
        <a href="${pageContext.request.contextPath }/mypage/orderList.do"><button type="button" class="btn-txt-arr" id="moreOrder">더보기</button></a>
    </div>
</div><!-- border-line-box-header -->

<div class="border-line-box order-status-wrap">
    <div class="order-list-box">
        <ul class="order-list">
        	<c:if test="${empty requestScope.orderStatusList}">
           		<li><a href="#" class="val" id="standByCnt">0</a><span class="order-type">입금대기</span></li>
           		<li><a href="#" class="val" id="completeCnt">0</a><span class="order-type">결제완료</span></li>
           	</c:if>
            <c:forEach var="orderStatus" items="${requestScope.orderStatusList }">
           		<c:if test="${orderStatus.order_status == 0}">
           			<li><a href="#" class="val" id="standByCnt">${orderStatus.cnt }</a><span class="order-type">입금대기</span></li>
           		</c:if>
           		<c:if test="${orderStatus.order_status == 1}">
           			<li><a href="#" class="val" id="completeCnt">${orderStatus.cnt }</a><span class="order-type">결제완료</span></li>
           		</c:if>
          	</c:forEach>
            <!-- <li><a href="#" class="val" id="productPreparationCnt">0</a><span class="order-type">상품준비중</span></li>
            <li><a href="#" class="val" id="dlvyingPickupReadyCnt">0</a><span class="order-type">배송중/픽업준비완료</span></li>
            <li><a href="#" class="val" id="dlvyFinishCnt">0</a><span class="order-type">배송/수령완료</span></li> -->
        </ul>
    </div>
</div><!-- border-line-box order-status-wrap 최근 주문내역 -->

<div class="border-line-box-header order-header">
	<h3 class="text-head2">주문 현황 조회</h3>
</div><!-- border-line-box-header -->

<div class="order-mypage-no-data has-line" style="display:none;" >
    <div class="flex-box">
        <p class="no-data-text">주문한 정보가 없습니다.</p>
    </div>
</div>

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
    		<input type="hidden" name="ordersCnt" value="${requestScope.ordersCnt}">
    		<!-- 각각의 주문 정보 -->
    		<c:forEach var="ordersDTO" items="${requestScope.ordersDTOlist }">
    			<!-- 전체 가격 계산 -->
    			<c:set var="totalSum" value="0"/>
    			<c:forEach var="tmp" items="${ordersDTO.list }">
    				<c:set var="totalSum" value="${totalSum+tmp.order_price }"/>
    			</c:forEach>
	    		<div class="tbl-wrap tbl-col tbl-prod">
	    			<div class="tbl-header order">
	    				<div class="customer-action-info">
	    					<span class="action-item">
	    						<span class="action-item-label">주문번호</span>
	    						<span class="action-item-value bold"><a href="#" name="orderNo" value="${ordersDTO.order_id }">${ordersDTO.order_id }</a></span>
	    					</span>
	    					<span class="action-item">
									<span class="action-item-label">주문일시</span>
									<span class="action-item-value"><fmt:formatDate value="${ordersDTO.order_date }" pattern="yyyy-MM-dd"/> </span>
							</span>
	    				</div>
	    				<div class="right-box">
	    					<div class="prod-price">
	    						<span class="price-text">총 결제금액</span>
								<span class="val">${totalSum }</span>
								<span class="unit">원</span>
	    					</div>
	    					<!-- <button type="button" class="btn btn-sm" name="orderCancelAllYn">전체 주문취소</button> -->
	    					<input type="hidden" name="orderStatus" value="${ordersDTO.order_status }">
	    				</div>
	    			</div><!-- tbl-header order -->
	    			
	    			<table>
	    				<caption>주문번호 ${ordersDTO.order_id } 상품</caption>
	    				<colgroup>
							<col style="width: 50%">
							<col class="prod-cost">
							<col>
							<col class="btn-sm">
						</colgroup>
						
						<!-- 주문 상세 정보들 -->
						<c:forEach var="ordersDetailDTO" items="${ordersDTO.list }">
							<tbody>
								<tr>
									<td>
										<span class="prod-item no-util individual">
											<span class="prod-item-inner">
												<span class="prod-link">
													<a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${ordersDetailDTO.product_id}&gender=${ordersDetailDTO.gender}" class="img-wrap">
														<img src="${ordersDetailDTO.s_file_path }" alt="${ordersDetailDTO.kor_name }">
													</a>
													<span class="prod-info-wrap">
														<span class="prod-brand">${ordersDetailDTO.brand }</span>
														<a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${ordersDetailDTO.product_id}&gender=${ordersDetailDTO.gender}" class="prod-name multi-line">${ordersDetailDTO.kor_name }</a>
														<span class="prod-option">
																<span class="prod-option-value">${ordersDetailDTO.pd_size } / ${ordersDetailDTO.cnt }개</span>
														</span>
													</span>
												</span>
											</span>
										</span>
									</td><!-- 상품 정보 td -->
									<td class="text-center">
										<span class="prod-cost">
											<span class="value"><fmt:formatNumber value="${ordersDetailDTO.order_price }" pattern="#,###"/></span>
											<span class="unit">원</span>
										</span>
									</td><!-- 주문 가격 정보 td -->
									<td class="text-center"> 									 
										<span class="prod-status">
											<c:choose>
												<c:when test="${ordersDTO.order_status == 1 }">입금완료</c:when>
												<c:when test="${ordersDTO.order_status == 0 }">입금대기</c:when>
											</c:choose>
										</span>
									</td><!-- 입금 대기 td -->
									<td>
										<!-- <button type="button" class="btn btn-sm btn-line" name="orderCancel">주문 취소</button> -->
										<input type="hidden" name="orderStatus" value="${ordersDTO.order_status }">
									</td><!-- 주문 취소 버튼 td -->
								</tr>
							</tbody>
						</c:forEach>
	    			</table><!-- table -->
	    		</div><!-- tbl-wrap -->
	    		</c:forEach>
	    	</div><!-- tbl-prod-wrap -->
    	
    	
    	<!-- 페이징 처리부분 -->
	    <div id="mypage-product-interest-pagination" class="pagination-wrap">
	    	<div>	
	    		<ol class="pagination-list">
	    			<c:if test="${ph.showPrev == true }">		
		    			<li class="pagination-item showPrev">
		    				<a href="${pageContext.request.contextPath }/mypage/orderList.do?curPage=${ph.startPage-1}">&lt;</a>
		    			</li>
	    			</c:if>
	    			
	    			<c:forEach var="i" begin="${ph.startPage }" end="${ph.endPage }">
	    				<c:if test="${requestScope.curPage == i}">
			    			<li class="pagination-item" name="li_page">			
			    				<a href="${pageContext.request.contextPath }/mypage/orderList.do?curPage=${i }">
			    				<button type="button" class="btn-page btn-page-num selected">${i }</button>		
			    				</a>
		    				</li>	
	    				</c:if>
	    				<c:if test="${requestScope.curPage != i}">
			    			<li class="pagination-item" name="li_page">	
			    				<a href="${pageContext.request.contextPath }/mypage/orderList.do?curPage=${i }">		
			    				<button type="button" class="btn-page btn-page-num">${i }</button>		
			    				</a>
		    				</li>
	    				</c:if>
	    			</c:forEach>	
    				
    				<c:if test="${ph.showNext == true}">
	    				<li class="pagination-item showNext">
		    				<a href="${pageContext.request.contextPath }/mypage/orderList.do?curPage=${ph.endPage+1}">&gt;</a>
		    			</li>	
	    			</c:if>
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
		$('.order-mypage-no-data').css('display', '');
		$('.tab-wrap').css('display', 'none');
		$('.order-header').css({
			'border-bottom' : '2px solid #000',
			'height' : '45px',
			'line-height' : '45px'
		});
	} else {
		$('.order-mypage-no-data').css('display', 'none');
		$('.tab-wrap').css('display', '');
		$('.order-header').css({
			'border-bottom' : '',
			'height' : '',
			'line-height' : ''
		});
	}
	
	// 전체 주문 취소
	$('button[name="orderCancelAllYn"]').click(function() {
		let status = $(this).next().val();
		console.log(status);
		
		if(status == 1) {
			alert("입금이 완료되어 취소하실 수 없습니다.");
		} else if(status == 0) {
			if(confirm("정말로 취소하시겠습니까?")) {
				
			}
		}
	});
	
	// 주문 취소
	$('button[name="orderCancel"]').click(function() {
		let status = $(this).next().val();
		console.log(status);
		
		if(status == 1) {
			alert("입금이 완료되어 취소하실 수 없습니다.");
		} else if(status == 0) {
			if(confirm("정말로 취소하시겠습니까?")) {
				
			}
		}
	});
});
</script>