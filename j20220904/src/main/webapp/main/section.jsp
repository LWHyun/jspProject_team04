<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.main-section {
		margin-top: 100px;
		margin-bottom: 200px;
	}
	.main-section .abc-best-brand {
		position: relative;
		width: 1200px;
		margin: 0 auto 35px;
		text-align: center;
		font-size: 30px;
		font-weight: 600;
	}
	.section-title .text-head1 {
		text-align: center;
		color: black;
	}
	.best-brand-top.swiper-container {
		position: relative;
		margin: 0 auto;
		overflow: hidden;
		list-style: none;
		padding: 0;
		z-index: 1;
	}
	.best-brand-bg-list {
		height: 365px;
		position: relative;
		display: flex;
		padding: 0;
		overflow: visible;
		width: 100%;
	}
	.best-brand-bg-list li {
		width: 100%;
		opacity: 1;
		transform: translate3d(0, 0, 0);
		overflow: visible;
	}
	.bg-item {
		position: relative;
		background-repeat: no-repeat;
		background-position: top center;
		background-image: url(https://image.a-rt.com//art/display/contents/202205/1653037219569.jpg);
		list-style-type: none;
		display: list-item;
    	font-size: 0;
	}
	.swiper-slide {
		flex-shrink: 0;
		width: 100%;		
		height: 100%;
	}
	.best-brand-banner-controller {
		position: absolute;
		width: 1200px;
		top: 106px;
		left: 50%;
		transform: translateX(-50%);
		z-index: 2;
	}
	.best-brand-banner-pagination {
		position: relative;
		display: inline-block;
	}
	.swiper-pagination {
		width: 1200px;
		margin-top: 55px;
		position: absolute;
		text-align: center;
		z-index: 10;
	}
	.swiper-pagination-bullet {
		width: auto;
		height: auto;
		background-color: transparent;
		font-size: 17px;
		color: white;
		opacity: .4;
		cursor: pointer;
		display: inline-block;
	}
  	.swiper-pagination-bullet+.swiper-pagination-bullet {
	    margin-left: 95px;  
	}
	.best-brand-banner-nav {
		top: 0;
	}
	.wrap {
		font-size: 0;
	}
	.btn-main-swiper.prev {
		background-position: -24px;
		left: -40px;
	}
	.btn-main-swiper.next {
		right: -40px;
	}
	.btn-main-swiper {
		position: absolute;
		width: 24px;
		height: 45px;
		background: url("https://abcmart.a-rt.com/static/images/main/main_btn_abc_main_event_swiper.png") 0 0 no-repeat;
		pointer-events: visible;
	    font-size: 0;
	    border: 0;
	}
	.swiper-container .swiper-notification {
		position: absolute;
		left: 0;
		top: 0;
		pointer-events: none;
		opacity: 0;
		z-index: -1000;
	}
	.best-brand-prod-wrap {
		position: relative;
		z-index: 2;
		width: 1200px;
		margin: -129px auto 0;
	}
	.col-list {
	    display: flex;
	    justify-content: flex-start;
		flex-wrap: wrap;
		padding: 0;
	}
	.col-list .col-list-item:nth-child(4n+1) {
		margin-left: 0;
	}
	.col-list .col-list-item {
		flex-grow: 0;
	    flex-shrink: 1;
	    max-width: calc((100% - (20px * (4 - 1))) / 4);
	    margin-left: 20px;
	}
	.prod-item {
		position: relative;
		font-size: 0;
	    flex-direction: row;
	}
	.prod-item .prod-item-inner {
		display: block;
		text-align: center;
    	width: 285px;
    	height: 285px;
		padding-right: 10px;
	}
	.prod-item .prod-link {
		display: block;
	}
	a {
		text-decoration: none;
	}
	.prod-item .img-wrap {
		position: relative;
		padding-top: 100%;
	}
	.prod-item .img-wrap img {
		position: absolute;
		width: 100%;
		left: 50%;
		top: 50%;
		transform: translate(-50%, -50%);
	}
	img {
		vertical-align: top;
	}
	.prod-item .prod-info-wrap {
		padding: 15px 10px 0;
		text-align: left;
	}
    .prod-item .prod-info-wrap .prod-brand {
	    margin-top: 4px;
	    font-size: 15px;
	    font-weight: 600;
	    display: inline-block;
	    width: 100%;
	    max-width: 100%;
	    white-space: nowrap;
	    overflow: hidden;
	    text-overflow: ellipsis;
	    height: auto;
	    max-height: none;
	    line-height: 1.2;
    }
  	.prod-item .prod-info-wrap .prod-name {
	    color: #666;
	    margin-top: 8px;
	    font-size: 14px;
	    overflow: hidden;
	    height: 38px;
	    max-height: 38px;
	    line-height: 19px;
	    display: block;
	    white-space: normal;
 	 }
	.prod-info-wrap .prod-price {
		position: relative;
		margin-top: 9px;
		display: block;
	}
	.prod-cost {
		font-size: 19px;
		font-weight: 600;
	}
	.price-unit {
		font-size: 14px;
	}
</style>
</head>
<body>
	<section class="main-section">
		<h2 class="main-section abc-best-brand">
			<span class="text-head1">BEST BRAND</span>
		</h2>
		<div class="abc-best-brand-banner">
			<div class="best-brand-top swiper-container">
				<ul class="best-brand-bg-list">
					<li class="bg-item">CORCS</li>
				</ul>
				<div class="best-brand-banner-controller">
					<span class="best-brand-banner-pagination">
						<span class="swiper-pagination swiper-pagination-clickable">
							<span class="swiper-pagination-bullet">NIKE</span>
							<span class="swiper-pagination-bullet">ADIDAS</span>
							<span class="swiper-pagination-bullet">FILA</span>
							<span class="swiper-pagination-bullet">CONVERSE</span>
							<span class="swiper-pagination-bullet">LACOSTE</span>
              
						</span>
					</span>
					<span class="best-brand-banner-nav">
						<button type="button" class="btn-main-swiper prev">이전 브랜드</button>
						<button type="button" class="btn-main-swiper next">다음 브랜드</button>
					</span>
				</div>
			</div>
			<span class="swiper-notification"></span>
		</div>
		<div class="best-brand-prod-wrap">
			<ul class="col-list">
			<c:forEach var="list" items="${list }" begin="1" end="4">
				<li class="col-list-item prod-item">
					<div class="prod-item-inner">
						<a class="prod-link" id="#" href="contents/contents_men.do?product_id=${list.product_id }&gender=${list.gender}">
							<div class="img-wrap">
								<img class="img-box" alt="신발" src="${list.s_file_path }">
							</div>
							<div class="prod-info-wrap" id=#>
								<div class="prod-info-wrap" id="#">
									<span class="prod-brand">${ca_name }</span><br>
									<span class="prod-name">${list.kor_name }</span><br> 
									<span class="prod-price">
										<span class="prod-cost">${list.price}</span>
										<span class="price-unit">원</span>
									</span>
								</div>
							</div>
						</a>
					</div>
				</li>
			</c:forEach>
				<li class="col-list-item prod-item">
					<div class="prod-item-inner">
						<a class="prod-link" id="101008390" href="https://abcmart.a-rt.com/product/new?prdtNo=1010083900">
							<div class="img-wrap">
								<img class="img-box" alt="신발" src="https://image.a-rt.com/art/product/2020/08/34116_1598495392321.jpg?shrink=388:388">
							</div>
							<div class="prod-info-wrap" id=101008390>
								<div class="prod-info-wrap" id="">
									<span class="prod-brand">나이키</span><br>
									<span class="prod-name">나이키 샬라샬라</span><br> 
									<span class="prod-price">
										<span class="prod-cost">59,000</span>
										<span class="price-unit">원</span>
									</span>
								</div>
							</div>
						</a>
					</div>
				</li>
		        
			</ul>
		
		</div>


	</section>
</body>
</html>