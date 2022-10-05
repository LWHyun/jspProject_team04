<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
.border-line-box-header~.tab-wrap {
    margin-top: 22px;
}
/* 주문 탭 */
.tab-ul {
    text-align: center;
    border: 3px solid black;
    border-bottom: 3px solid white;
}
.tab-ul li {
    font-weight: 550;
    color: #000;
    padding: 0 20px;
    line-height: 48px;
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