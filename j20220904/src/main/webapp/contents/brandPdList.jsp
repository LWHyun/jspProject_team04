<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신사몰 - ${ca_name }</title>
<style type="text/css">
/* 배너----------------------------------------------------------------------------------- */
.contents-wrap {
	min-width: 1600px;
	overflow: hidden;
}

.contents-width {
	width: 1200px;
	margin: 0 auto;
}

.contents-width .breadcrumb-wrap {
	height: 60px;
}

.contents-wrap .breadcrumb-wrap .breadcrumb-list {
	margin-top: 23px;
}

.breadcrumb-list {
	display: inline-block;
}

ol, ul {
	list-style: none;
}

.breadcrumb-lis .crumb.home {
	padding-left: 17px;
	font-weight: 600;
}

.breadcrumb-list .crumb {
	float: left;
	position: relative;
	color: #999;
	padding-left: 14px; line-height : 15px;
	font-size: 13px;
	letter-spacing: -.65px;
	line-height: 15px;
}

.breadcrumb-list .crumb.home:before {
	width: 12px;
	background-position: 0 0;
}

.breadcrumb-list .crumb:before {
	content: '';
	position: absolute;
	display: inline-block;
	height: 11px;
	background: url(https://abcmart.a-rt.com/static/images/common/comm_breadcrumb_icon_ots.png) no-repeat -12px 0;
	left: 0;
	top: 2px;
}

a {
	text-decoration: none;
	color: inherit;
}

.breadcrumb-list .crumb+.crumb {
	margin-left: 9px;
}

.breadcrumb-list .crumb:last-child {
	color: #333;
}

.first-brand-space {
	width: 1200px;
	font-size: 38px;
	margin: 0 124px;
}

.text-head0 brand-name {
	text-align: center;
	color: #000;
	font-size: 38px;
	vertical-align: top;
	font-weight: 700;
}

h2 {
	line-height: 1;
	text-align: center;
	font-size: 40px;
	margin-right: 100px;
	font-weight: 1000;
}
.eng {
	font-size: 37px;
	font-weight: 700;
}

.brand-slide-wrap {
	margin-top: 44px;
}
.prod-main-branner {
	position: relative;
	width: 100%;
	height: 388px;
}

.brand-img-division {
	position: absolute;
	top: 0;
	left: 50%;
	width: 1920px;
	height: 100%;
	overflow: hidden;
	transform: translateX(-50%);
}

.banner-division-text {
	width: 1200px;
	margin: 0 360px;
	padding-top: 80px;
	text-align: left;
}

strong {
	font-size: 34px;
	font-weight: 700;
	letter-spacing: -.68px;
	line-height: 50px;
}

strong, p {
	color: white;
}

strong+p {
	margin-top: 20px;
	font-size: 14px;
	letter-spacing: -.8px;
	line-height: 28px;
}

.brand-logo {
	position: absolute;
	left: 49%;
	text-align: left;
	width: 1200px;
	transform: translateX(-50%);
	background-size: 50%;
}

/* 필터와 상품리스트 묶음----------------------------------------------------------------------------------- */
.filter-list-wrap {
	margin-top: 86px;
	display: flex;
	margin-left: 100px;
}

/* 필터----------------------------------------------------------------------------------- */
ul {
  list-style: none;
}
.filter-wrap {
  flex: 0 0 250px;
  max-width: 250px
	}
.filter-wrap .filter-header {
  border-bottom: 2px solid black;
  line-height: 40px;
  font-size: 18px;
  display: flex;
  justify-content: space-between;
  font-weight: 600;
}
.btn-reset-filter {
  color: #666;
  padding-left: 24px;
  text-decoration: underline;
  font-size: 15px;
  border: white;
  background-color: white;
}
.fold-box-list .fold-box {
  border-bottom: 1px solid #d5d5d5;
}
.fold-box-list .fold-box {
  border-top: none;
  border-bottom-color: #b5b5b5;
}
.fold-box-expanded .fold-box-header {
  border-bottom: none;
}
.fold-box-header {
  padding-left: 0;
  font-weight: 600;
  text-align: center;
  line-height: 70px;
  border-bottom: 1px solid;
}
  .fold-box-list .fold-box .fold-box-header {
  position: relative;
  padding-right: 33px;
  font-size: 15px;
  padding-right: 33px;
}
.brand-block {
  border-bottom: 1px solid gray;
  padding: 35px;
  font-size: 20px;
  font-weight: 600;
}
.brand-block:hover {
  border: 2px solid black;
}


/* 상품 리스트 ----------------------------------------------------------------------------------- */

  	a {
		text-decoration: none;
	}
	ol, ul {
		list-style: none;
	}
	.product-list {
		width: 1300px;
		border-top: 2px solid black;
		margin-bottom: 100px;
		margin-left: 80px;
	}
	.cell {
		float: left;
	}
	.product-list>.product-box {
		width: 24%;
		min-height: 417px;
		background: white;
		padding: 20px;
		box-sizing: border-box;
		margin-right: 10px;
		margin-top: 10px;
	}
	.product-list>.product-box:nth-child(4n) {
		margin-right: 5px;
	}
	.prod-wrap:hover {
		display: block;
		background-color: white;
		border: 1px solid black;
	}	
	.prod-util-wrap {
		height: 0;
	} 
	/* display: none; 이거 어떻게 해야 돼ㅠㅠ */ 
	
	.product-list>.product-box>.prod-wrap>.prod-link>img {
		width: 100%;
	}
	.product-list>.product-box>.prod-wrap>.prod-link>.txt-box {
		text-align: left;
		padding: 15px 10px 0;
		margin-top: 10px;
	}
	.prod-brand, .prod-price {
		font-weight: bold;
		color: black;
	}
	.prod-brand {
		font-size: 15px;
	}
	.prod-name {
		font-size: 14px;
		color: #666;
	}
	.prod-price {
		font-size: 19px;
	}
	.prod-btn-wrap {
		border-top: 1px solid black;
		height: 44px;
		display: flex;
		justify-content: flex-start;
	}
	.prod-btn-wrap .util-btn-wrap {
		max-width: 90px;
		height: 42px;
		margin: 0 auto;
		text-align: center;
		line-height: 42px;
	}
	.btn-prod-favorite {
		position: relative;
		width: 24px;
		height: 22px;
		vertical-align: middle;
		background-image: url('../img/contexts/prod_icon_list_util_btn.png');
		font-size: 0;
		top: 0;
		border: none;
		flex-basis: 24px;
		background-color: white;
	}
	 .btn-prod-favorite:hover {
	  background-position: 0 -22px;
	}
	.btn-buy-now {
		width: 150px;
		background: black;
		font-size: 14px;
		letter-spacing: -.7px;
		color: #fff;
		height: 44px;
		line-height: 42px;
	}
	.btn-buy-now {
		cursor: pointer;
	}
	button {
		margin: 0;
	}

/* 페이지 이동----------------------------------------------------------------------------------- */
	.pagination-wrap {
		text-align: center;
		height: 27px;
	}
	.pagination-wrap .pagination-list {
		display: inline-block;
		margin-bottom: 100px;
	}
	.pagination-wrap .pagination-list .pagination-item {
		float: left;
	}
	.pagination-wrap .pagination-list .pagination-item+.pagination-item {
	 	margin-left: 4px;
	}
	
	#btn_prev {
		margin-left: 6px;
		background: url(https://abcmart.a-rt.com/static/images/ui/button/btn_icon_pagination.png) no-repeat 0 0;
		background-position: -28px 0;
	}
	#btn_next {
		margin-left: 6px;
		background: url(https://abcmart.a-rt.com/static/images/ui/button/btn_icon_pagination.png) no-repeat 0 0;
		background-position: 0 -28px;
	}
	
	.modal{ 
	  position:fixed; 
	  width:100%; 
	  height:100%; 
	  top:0; 
	  left:0; 
	  display:none;
	}
	
	#modal_div_button{
		width:550px; 
		height:670px;
		background:#fff; 
		border-radius:10px;
		position:relative; 
		top:30%; left:40%;
		margin-top:-100px; 
		margin-left:-150px;
		text-align:center;
		box-sizing:border-box; 
		padding:20px 0;
		line-height:23px; 
		cursor:pointer;
	}
	
	#modalClose{
		margin-top: 10px;
	}
	
	.page-btn {
		color: white;
		background-color: black;
	}
	.btn-page {
	  	color: #666;
	 	width: 26px;
	  	height: 26px;
	  	text-align: center;
		border: 0;
		background: white;
	}
	.btn-page+.btn-page{
		margin-left: 20px;		
	}
	
	.page-btn {
		color: white;
		background-color: black;
		padding: 5px 10px;
	}
	
</style>
<%
	String context = request.getContextPath();
%>
</head>
<body>
	<div id="header">
       <jsp:include page="../main/header.jsp"></jsp:include>
    </div>  <!-- header -->	

	<div id="contentsWrap" class="contents-wrap">
  															<!-- 리스트의 상품이 12개가 넘어가면 페이지 이동버튼이 가려집니다...-->
  		<!-- 배너 (맨 왼쪽 위) -->
		<div class="contents-width">
			<div class="breadcrumb-wrap">
				<ol class="breadcrumb-list">
					<li class="crumb home">
						<a href="../index.jsp">HOME ></a>							<!-- 클릭시 홈으로 이동 -->
					</li>
					<li class="crumb">
						<a href="#">BRAND ></a></li>
					<li class="crumb">${ca_name }</li>													<!--  현재 페이지의 브랜드-->
				</ol>
			</div>
			<div class="page-title-wrap">
				<h2 class="text-head0 brand-name"><span class="eng">${ca_name }</span></h2>			<!-- 현재 페이지의 브랜드 이름 -->
			</div>
		</div>
		<c:if test="${ca_name == 'NIKE' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/nike_banner.jpg');">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
									1964년에 설립된 전세계 1위 브랜드 나이키. <br>다양한 컬래버레이션과 두터운 매니아층을 통해 세계적으로
									그 위치를 증명하고 있습니다.
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
								<img alt="나이키 로고" src="../img/brand_logo_imgs/nike_logo.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ca_name == 'FILA' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/fila_banner.jpg');">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
									1911년 이태리, FILA 형제들로부터 탄생한 브랜드입니다. <br>100년 이상의 브랜드 헤리티지를 바탕으로 한 글로벌 스포츠 패션 트렌드를 제안합니다.
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
								<img alt="필라 로고" src="../img/brand_logo_imgs/fila_logo.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ca_name == 'ADIDAS' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/adidas_banner.jpg');">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
									1949년부터, 스토리와 스타일, 스포츠를 이끌다. <br>세상의 모든 스포츠를 포용하는 브랜드
									<br>아디다스는 모두의 스포츠 브랜드입니다.
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
								<img alt="아디다스 로고" src="../img/brand_logo_imgs/adidas_logo.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ca_name == 'CONVERSE' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/converse_banner.jpg');">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
									젊은이들의 '자유로움의 표상'이 된 컨버스. <br>100년의 역사를 가진 Original America 브랜드로, 없어선 안될 스테디셀러 아이콘으로 자리잡았습니다.
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
								<img alt="컨버스 로고" src="../img/brand_logo_imgs/converse_logo.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ca_name == 'DR.MARTENS' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/dr_martens_banner.jpg');">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
									닥터마틴은 자신만의 개성을 지닌 진정성 있는 사람들과 자아 표현에 자부심을 지닌 사람들, 그리고 보통 사람들과는 다른 사람들에게 어필합니다. 
									<br>심플하지만 유니크한 스타일로 공연, 스트릿 패션 등 다양한 문화 전반에서 사랑받는 브랜드입니다.
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
								<img alt="닥터마틴 로고" src="../img/brand_logo_imgs/dr_martens_logo.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ca_name == 'LACOSTE' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/lacoste_banner.jpg');">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
									역사적인 테니스 스타 라코스테가 설립한 프리미엄 캐주얼 브랜드입니다. <br>'악어'캐릭터는 그의 별명에서 유래되었으며, 현재까지 사랑받는 시그니처가 되었습니다.
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
								<img alt="라코스테 로고" src="../img/brand_logo_imgs/lacoste_logo.png">
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
		<c:if test="${ca_name == 'BIRKENSTOCK' }">
			<div class="brand-slide-wrap">
				<div class="prod-main-branner">
					<div class="bg-item">
						<div class="brand-img-division" style="background-image: url('../img/banners/brand_banner/birkenstock_banner.jpg')">
							<div class="banner-division-text">
								<strong style="font-size: 37px; font-weight: 700">${ca_name }</strong>											<!-- 브랜드 이름과 주석 -->
								<p>
								</p>
							</div>
							<div class="brand-logo">											<!--  브랜드 로고 -->
							</div>
						</div>
					</div>
				</div>
			</div>
		</c:if>
  
 		<!-- 필터와 상품리스트 묶음 -->
		<div class="filter-list-wrap">
  
   				<!-- 필터 -->
		<div class="filter-wrap" id="includeSmartSearch">
		<div class="filter-header">
			<span class="tilte">BRAND</span>
			<button type="button" name="smart-search-clear-btn"
				class="btn-reset-filter"></button>
		</div>
		<div class="filter-contents">
			<div class="fold-box-list-wrap filter">
				<div class="brand-block-wrap">
					<ul>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10100">ADIDAS</a></li>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10200">BIRKENSTOCK</a></li>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10300">CONVERSE</a></li>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10400">DR.MARTENS</a></li>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10500">FILA</a></li>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10600">LACOSTE</a></li>
						<li class="brand-block"><a href="${pageContext.request.contextPath}/contents/brandPdList.do?ca_code=10700">NIKE</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

			<!-- 상품 리스트 -->
		<div class="product-list row">
		
			<c:if test="${totCnt > 0 }">
				<c:forEach var="list" items="${list }">	
					<div class="product-box cell">																		<!-- cell하나당 상품 하나 -->
						<div class="prod-wrap">
							<a class="prod-link" href="contents_men.do?product_id=${list.product_id }&gender=${list.gender}"> <!-- 상품상세 페이지로 이동 -->
							<img class="img-box" alt="신발" src="${list.s_file_path }">
							<span class="prod-brand" style="font-size: 15px">${ca_name}</span><br>
							<span class="prod-name" style="font-size: 14px; color: #666;">${list.kor_name}</span><br> 																	<!-- 상품이름 -->
							<span class="prod-price"><fmt:formatNumber value="${list.price }" pattern="#,###"/></span> <span class="price-unit">원</span>							</a>
							<div class="prod-util-wrap">
								<div class="prod-btn-wrap">
									<div class="util-btn-wrap">
										<c:choose>
											<c:when test="${list.e > 0 }">
											<button type="button" id="${list.product_id }" style="background-position: 0 -44px" class="btn-prod-favorite">즐겨찾기</button>
											</c:when>
											<c:when test="${list.e == 0 }">
											<button type="button" id="${list.product_id }" class="btn-prod-favorite">즐겨찾기</button>
											</c:when>
										</c:choose>
										<!-- <button type="button" class="btn-prod-cart">장바구니 담기</button> -->			<!-- 장바구니에 상품코드 저장 -->
									</div>
									<button type="button" class="btn-buy-now">바로구매</button>						<!-- 결제창 이동 -->
									<input type="hidden" name="buyNow_product_id" id="buyNow_product_id" class="buyNow_product_id" value="${list.product_id }">
									<div class="modal">
									<div id="modal_div_button">
										<div class="modal_div_inner">
											<div class="modal_content" title="구매용 모달창">
											
											${list.product_id }
											</div>
										</div>
										
										<button id="modalClose" class="custom-btn btn-close">닫기</button>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<c:if test="${totCnt == 0 }">
				<h2>데이터 없음</h2>
			</c:if>
			
		</div> <!-- product-list row 끝 -->
		
	</div> <!-- filter-list-wrap 끝-->			
	<!-- 페이지 -->
	<div id="pagingDiv" class="pagination-wrap">										<!-- 다음 상품목록 페이지로 이동 -->
		<c:if test="${startPage > blockSize }">
			<a href="brandPdList.do?ca_code=${ca_code }&pageNum=${startPage - blockSize }" class="btn-page prev" id="btn_prev">이전 페이지로</a>
		</c:if>
		<c:forEach var="i" begin="${startPage }" end="${endPage }">
			<c:if test="${pageNum == i }">
			<a href="brandPdList.do?pageNum=${i}&ca_code=${ca_code}" class="btn-page" style="width: 26px; height: 26px; font-size: 13px"><span class="page-btn">${i}</span></a>
			</c:if>
			<c:if test="${pageNum != i }">
			<a href="brandPdList.do?pageNum=${i}&ca_code=${ca_code}" class="btn-page">${i}</a>
			</c:if>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href="brandPdList.do?pageNum=${startPage - blockSize }&ca_code=${ca_code}" class="btn-page next" id="btn_next">다음 페이지로</a>
		</c:if>
	</div>
	
</div> <!-- contents-wrap 끝--> 

<div id="footer">
       <jsp:include page="../main/footer.jsp"></jsp:include>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	
$(function() {
	$('.btn-buy-now').click(function() {
		var product_id = $(this).siblings('input[name="buyNow_product_id"]').val();
		console.log(product_id);
		$.ajax({
			url : '${pageContext.request.contextPath}/contents/buyProductNow.do',
			data : 
				{product_id : product_id}, 
			dataType : 'html',
			success : function(data) {
				$('.modal_content').html(data);
			}
		});
		
		
		$('.modal').fadeIn();
	});
	$('.modal #modalClose').click(function() {
		$('.modal').fadeOut();
	})
})

	$(function(){
		
		$(document).on("click", ".btn-prod-favorite", function () {
				var sandData = "product_id=" + $(this).attr('id');
											// $(.btn-prod-favorite) 태그의 id를 가져와라
				var product_id = $(this).attr('id');
				console.log(product_id);
				/* alert( $('.btn-prod-favorite').css("background-position")); */
			if(	$('.btn-prod-favorite[id="'+product_id+'"]').css("background-position") == "0px -22px"){
				
			 $.ajax({
				url: '${pageContext.request.contextPath}/contents/registerLike.do',
				type: 'get',
				data: sandData,
				dataType: 'text',
				success: function (data) {
					console.log(data);
					if (data == "1") {
						alert('찜한상품에 담겼습니다.');
						$('.btn-prod-favorite[id="'+product_id+'"]').css("background-position", "0 -44px");
					} else if (data == "-1") {
						alert('로그인 후 찜한상품으로 담을 수 있습니다.');
						location.href = "${pageContext.request.contextPath}/member/loginForm.do?toURI=${toURI}";
					} else // (data == "0")
						alert('이미 찜한상품입니다.');
						$('.btn-prod-favorite[id="'+product_id+'"]').css("background-position", "0 -44px");
				}
			});
			 
			} else {
			 $.ajax({
				url: '<%=context%>/contents/removeLike.do',
				type: 'get',
				data: "product_id=" + $(this).attr('id'),
				success: function (data) {
					if (data == "1") {
						alert ("찜한상품이 해제되었습니다.");
						$('.btn-prod-favorite[id="'+product_id+'"]').css("background-position", "0 -22px");
					} else if (data == "-1") {
						alert('로그인 후 찜한상품을 해제할 수 있습니다.');
						location.href = "${pageContext.request.contextPath}/member/loginForm.do";
					} else {
						alert("error");
						$('.btn-prod-favorite[id="'+product_id+'"]').css("background-position", "0 0");
					}
				}
			 });
			}
		});
	});
	
</script>

</body>
</html>