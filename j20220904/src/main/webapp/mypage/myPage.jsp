<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이 페이지</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/myPage.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	<input type="hidden" id="active" value="${requestScope.active }">
    <div class="contents-wrap">
        <div class="myPage-inner-contents">
            <!-- top bar -->
            <div class="breadcrumb-wrap">
                <ol class="breadcrumb-list">
                    <li class="crumb home"><a href="/">HOME</a></li>
                    <li class="crumb">마이페이지</li>
                </ol>
            </div>

            <!-- 마이페이지 타이틀 -->
            <div class="page-title-wrap mypage">
                <h2 class="text-head1 text-left">마이페이지</h2>
            </div>

            <div class="contents-inner contents-aside mypage-wrap">
                <div class="aside-wrap">
                    <ol class="mypage-lnb">
                        <li>
                            <span class="mypage-lnb-title">마이 페이지</span>
                            <ol>
                                <li class="mypage-lnb-item">
                                    <a href="${pageContext.request.contextPath }/mypage/mypage.do" id="myTag">마이 페이지</a>
                                </li>
                            </ol>
                        </li>

                        <li>
                            <span class="mypage-lnb-title">쇼핑수첩</span>
                            <ol>
                                <li class="mypage-lnb-item">
                                    <a href="#">찜한상품</a>
                                </li>
                                <li class="mypage-lnb-item">
                                    <a href="#">상품 Q&A</a>
                                </li>
                            </ol>
                        </li>

                        <li>
                            <span class="mypage-lnb-title">개인정보</span>
                            <ol>
                                <li class="mypage-lnb-item">
                                    <a href="${pageContext.request.contextPath }/mypage/checkPwdForm.do" id="updatePwdTag">비밀번호 변경</a>
                                </li>
                                <li class="mypage-lnb-item">
                                    <a href="${pageContext.request.contextPath }/mypage/checkUpdateForm.do" id="updateTag">개인정보 수정</a>
                                </li>
                                <li class="mypage-lnb-item">
                                    <a href="${pageContext.request.contextPath }/mypage/checkDeleteForm.do" id="deleteTag">회원 탈퇴</a>
                                </li>
                            </ol>
                        </li>
                    </ol>
                </div><!-- aside-wrap -->

                <div class="aside-contents">
                    <div class="member-grade-box">
                        <div class="grade-info-box">
                            <span class="grade-info"><span>${sessionScope.mem_name }</span> 님은 <span class="bold">온라인 회원</span>입니다.</span>
                        </div>

                        <div class="grade-box-contents shopinfo">
                            <div class="shopping-info">
                                <div class="info-item">
                                    <span class="info-title"><i class="icon-cart"></i> 장바구니</span>
                                    <span class="info-data"><a href="${pageContext.request.contextPath }/basket/goToBasket.do">${requestScope.basketCnt }<span class="unit">개</span></a></span>
                                </div>
                                <div class="info-item">
                                    <span class="info-title"><i class="icon-favorite"></i> 찜한상품</span>
                                    <span class="info-data"><a href="#">${requestScope.likeProCnt }<span class="unit">개</span></a></span>
                                </div>
                            </div>
                        </div><!-- grade-box-contents shopinfo -->
                    </div><!-- member-grade-box -->
					
					<c:if test="${empty requestScope.display}">
	                    <div class="border-line-box-header">
	                        <h3 class="text-head2">최근 주문내역</h3>
	                        <div class="btn-wrap">
	                            <button type="button" class="btn-txt-arr" id="moreOrder">더보기</button>
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
	
	                    <div class="tab-wrap header-tab ui-tabs ui-corner-all ui-widget ui-widget-content">
	                        <ul class="tabs ui-tabs-nav ui-corner-all ui-helper-reset ui-helper-clearfix ui-widget-header">
	                            <!-- <li class="tabs-li1">
	                                <a href="#" id="newProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">최근 본 상품(<span id="recentPdtCount">0</span>) </a>
	                            </li > -->
	
	                            <li class="tabs-li2">
	                                <a href="#" id="wishProductCount" class="tab-link ui-tabs-anchor" role="presentation" tabindex="-1">찜한 상품(${requestScope.likeProCnt > 4 ? 4 : requestScope.likeProCnt}) </a>
	                            </li>
	                        </ul>
	
	                        <div class="tab-content">
	                            <div class="btn-wrap">
	                                <button type="button" class="btn-txt-arr" id="moreOrder">더보기</button>
	                            </div>
	                            
	                            <div class="col-list-wrap" >
	                                <ul class="col-list prod-list col-4">
	                                	<c:forEach var="likeProDTO" items="${likeProList }" begin="0" end="${requestScope.likeProCnt > 4 ? 3 : requestScope.likeProCnt == 0 ? 0 : requestScope.likeProCnt-1}">
		                                	<li class="col-list-item prod-item no-util">
		                                        <a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${likeProDTO.product_id}&gender=${likeProDTO.gender}" class="prod-link">
		                                 
		                                            <div class="img-wrap">
		                                                <img src="${likeProDTO.s_file_path }" alt="${likeProDTO.kor_name }" class="recent-product-image">
		                                            </div>
		                                            
		                                            <div class="prod-info-wrap">
		                                                <span class="prod-brand">${likeProDTO.brand }</span>
		                                                <span class="prod-name">${likeProDTO.kor_name }</span>
		                                                <span class="prod-price">${likeProDTO.price }</span>
		                                            </div>
		                                        </a>
		                                    </li>
	                                	</c:forEach>
	                                </ul>
	                            </div><!-- col-list-wrap -->
	
	                            <div class="mypage-no-data has-line-bottom" style="display:none;" >
	                                <div class="flex-box">
	                                    <p class="no-data-text">찜한 상품이 없습니다.</p>
	                                </div>
	                            </div><!-- has-line-bottom -->
	                        </div><!-- tab-content -->
	                    </div><!-- tab-wrap header-tab 최근 본 상품 / 찜한 상품-->
                    </c:if>
                    
                    <c:if test="${not empty requestScope.display }">
                    	<jsp:include page="${requestScope.display }"></jsp:include>
                    </c:if>
                </div><!-- aside-contents -->
            </div><!-- mypage-wrap -->

        </div><!-- myPage-inner-contents -->
    </div><!-- myPage-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
$(function() {
	// 현재 페이지 처리
	var active = $('#active').val();
	console.log(active);
	if(active=='my') {
		$('#myTag').addClass('active');
	} else if(active == 'update') {
		$('#updateTag').addClass('active');
	} else if(active =='updatePwd') {
		$('#updatePwdTag').addClass('active');
	} else if(active == 'delete') {
		$('#deleteTag').addClass('active');
	}
	
	// 찜한 상품이 있을 때 없을 때 display:none 처리
	var listCnt = Number(${requestScope.likeProCnt});
	if(listCnt == 0) {
		$('.mypage-no-data').css('display', '');
		$('.col-list-wrap').css('display', 'none');
	} else {
		$('.mypage-no-data').css('display', 'none');
		$('.col-list-wrap').css('display', '');
	}
	
	// 찜한 상품 mouseover 처리
	$('li.prod-item').mouseover(function() {
		$(this).css('border', '1px solid black');
	});
	$('li.prod-item').mouseout(function() {
		$(this).css('border', '');
	});
});
</script>
</body>
</html>