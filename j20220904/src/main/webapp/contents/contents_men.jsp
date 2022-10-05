<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/boardCss/boardCommon.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@48,400,0,0" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../css/boardCss/reviewBoard.css">
<style type="text/css">
	
	
	.contents-width	{
		width: 1200px;
		height: 800px;
		margin: 0 auto;
		
		
	}
	
	.breadcrumb-wrap {
		border:1px solid white;
		width: 1200px;
		height: 60px;
		margin-top: 20px;
		
	}

	.breadcrumb-wrap li {
	 float:left; 
	 list-style: none;
	}
	
	.contents-inner.product-detail-wrap	{
		 margin-top: 20px;
	}
	
	.image_big_left	{
		
		width: 580px;
		float: left;
	}
	
	.image_big_left_small 	{
		border:1px solid white;
		width: 100%;
		
	}
	
	.image_big_left_small div	{
		display: inline-block;
	}
	
	.image_big_left_small img	{
		width: 100px;
		height: 100px;
		margin:5.5px;
		
	}
	 .image_big_left_Product_satisfaction{
		width: 580px;
		
	
	}
	
	.image_big_left_Product_satisfaction_left{
		border:1px solid white;
		width: 260px;
		height: 120px;
		text-align: center;
		
		
		
	}
	
	.image_big_left_Product_satisfaction_left_1 {
		height: 14px;
		font-size: 14px;
		color: gray;
	}
	.image_big_left_Product_satisfaction_left_2 {
		height: 40px;
		font-size: 40px;
		color: red;
		font-weight: bold;
	}
	
	.image_big_left_Product_satisfaction_left_3{
		display: inline-block;
	}
	
	.image_big_left_Product_satisfaction_left_3 img{
		width:15px;
		height: 15px;
	}
	
	.image_big_left_Product_satisfaction_right	{
		border: 1px white solid;
		width: 260px;
		height: 120px;
		
	}
	
	.image_big_left_Product_satisfaction_right_1 {
		display: inline-block;
		margin-bottom: 50px;
	}
	.image_big_left_Product_satisfaction_right_1 li	{
		    list-style: none;
	}
	
	.image_big_left_Product_satisfaction_right_1 .label	{
		width: 120px;
		height: 15px;
		display: inline-block;
		color: gray;
		
	}
	
	.image_big_right{
		border:1px solid white;
		width: 580px;
		float: right;
	}
	.ABC_MRRT{
		background-color: #ee1c25;
		font-size: 13px;
		color:white;
		margin-right: 8px;
		float: left;
	}
	.detail_brandbox_like img {
		width:27px;
		height: 24px;
		float: right;
		margin-right: 50px;
	}
	
	.small_image_div:hover	{
		border:1px solid white;		
	}
	
	.brand_name	{
		font-weight: bold;
		font-size: 20px;
		margin: 15px 0 0 0;
		height: 39px;
	}
	.product_name{
		font-family: Montserrat, sans-serif;
		font-size:15px;
		line-height: 15px;
		height: 22px;
		margin: 6px 0 0 0;
		color: #666666;
	}
	
	.product_code	{
		font-size:13px;
		list-style: none;
		margin: 16px 0 0 0;
		color:#999999;
	}
	.detail_price	{
		display: block;
	}
	
	.detail_price ul {
		display: inline-block;
		list-style: none;
	}
	
	.detail_price ul li	{
		font-size: 30px;
		color: red;
		display: inline-block;
	}
	
	
		/* 모달 */
	.modal--bg {
	    position: absolute;
	    height: 200px;
	    width: 300px;
	    background-color: white;
	    margin: 0 0 0 10px;
	    display: inline-block;
	    align-items: top;
	    justify-content: center;
	}
	
	.visible {
	    visibility: visible;
	}
	
	.hidden {
	    background-color: white;
	    visibility: hidden;
	}
	.modal__text	{
		width: 200px;
		height: 100px;
		font-size: 12px;
		
	}
	
	.modal__text .product_real_price {
		font-size: 15px;
		font-weight: bold;
		color:red;
	}
	
	/* 스타일컬러 */
	.style_color	{
		border: 1px solid white;
		display: block;
		width: 580px;
		
		font-family: sans-serif;
	}
	
	.style_color_1	{
		height: 50px;
	 	display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
	
	}
	
	.style_color_left{
		border:1px solid white;
		display: inline-block;
		width: 200px;
		height: 50px;
		font-size: 13px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		margin-top: 30px;
	}
	
	.style_color_right{
		border:1px solid white;
		display: inline-block;
		margin-right: 20px;
		display: inline-block;
		margin-top: 30px;
	}
	
	.style_color_code_1	{
		height: 50px;
	 	display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
		 
	}
	.style_color_code_left {
		border:1px solid white;
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
	 	margin-top: 30px;
	 	
	}
	
	.style_color_code_right	{
		border:1px solid white;
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
	 	margin-top: 30px;
		display: inline-block;
	}
	/*  */
	.style_delivery_left_1{
		height: 50px;
	 	display: flex;
        flex-direction: row;
        flex-wrap: nowrap;
        align-content: center;
        justify-content: space-between;
        align-items: center;
        margin-top: 30px;
	
	}
	
	.style_delivery_left{
		border:1px solid white;
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		margin-top: 10px;
		display: inline-block;
	}
	
	.style_delivery_right	{
		border:1px solid white;
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		margin-top: 30px;
	}
	
	.style_delivery_down {
	    height: 50px;
	    display: flex;
	    flex-direction: row-reverse;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
		margin-top: 30px;
		
		
	}
	.style_delivery_down_right{
		margin-top: 30px;
	}
	
	.style_size{
	    height: 50px;
	    display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 30px;
	}
	
	.style_size_left{
		border:1px solid white;
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		margin-top: 30px;
	}
	
	.style_total{
		height: 50px;
	    display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    clear: both;
	    margin-top: 30px;
	}
	
	.style_total_left{
		border:1px solid white;
		display: inline-block;
		text-align: center;
		width: 350px;
		height: 50px;
		margin-top: 30px;
	}
	.style_total_right{
		border:1px solid white;
		width: 200px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		font-size: 25px;
		font-weight: bold;
		color:red;
		margin-left: 250px;
		
	}
	
	.style_myshopping	{
		height: 60px;
	    display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 30px;
	}

	
	.style_myshopping_left button	{
		background-color: #a5a5a5;
		width: 285px;
		height: 60px;
		color:white;
		display: inline-block;
		margin-top: 15px;
		cursor: pointer;
	}
	
	.style_myshopping_left button:hover{
		background-color: #747474;
	}
	
	.style_myshopping_right	button {
		background-color: black;
		width: 280px;
		height: 60px;
		color:white;
		display: inline-block;
		margin-top: 15px;
		cursor: pointer;
	}
	
	.append_product{
		border:1px white solid;
		width : 580px;
		display: hidden;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    font-weight: bold;
      
	   
	}
	.e1{
		border:1px white solid;
		width : 580px;
		display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 10px;
	}
	
	.append_list.div250	{
		border:1px white solid;
		display: inline-block;
		width: 202px;
		height: 20px;
		text-align: center;
		margin-top: 10px;
		margin-left: 40; 
		margin-right: auto;
		
	}
	#X1 {
		border:1px white solid;
		display: inline-block;
		text-align: center;
		margin-right: 250px;
		
	}
	
	.e2{
		border:1px white solid;
		width : 580px;
		display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 30px;
	}
	
	.append_list.div260	{
		border:1px white solid;
		display: inline-block;
		width: 202px;
		height: 20px;
		text-align: center;
		margin-top: 10px;
		margin-left: 40; 
		margin-right: auto;
		
	}
	#X2 {
		border:1px white solid;
		display: inline-block;
		text-align: center;
		margin-right: 250px;
		
	}
	.e3{
		border:1px white solid;
		width : 580px;
		display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 30px;
	}
	
	.append_list.div270	{
		border:1px white solid;
		display: inline-block;
		width: 202px;
		height: 20px;
		text-align: center;
		margin-top: 10px;
		margin-left: 40; 
		margin-right: auto;
		
	}
	#X3 {
		border:1px white solid;
		display: inline-block;
		text-align: center;
		margin-right: 250px;
		
	}
	.e4{
		border:1px white solid;
		width : 580px;
		display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 30px;
	}
	
	.append_list.div280	{
		border:1px white solid;
		display: inline-block;
		width: 202px;
		height: 20px;
		text-align: center;
		margin-top: 10px;
		margin-left: 40; 
		margin-right: auto;
		
	}
	#X4 {
		border:1px white solid;
		display: inline-block;
		text-align: center;
		margin-right: 250px;
		
	}
	.e5{
		border:1px white solid;
		width : 580px;
		display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    margin-top: 30px;
	}
	
	.append_list.div290	{
		border:1px white solid;
		display: inline-block;
		width: 202px;
		height: 20px;
		text-align: center;
		margin-top: 10px;
		margin-left: 40; 
		margin-right: auto;
		
	}
	#X5 {
		border:1px white solid;
		display: inline-block;
		text-align: center;
		margin-right: 250px;
		
	}
	
	
	.X	{
		width: 10px;
		height: 10px;
		margin-left: 50px;
		
	}
	
	.X:hover {
		cursor: pointer;
		
	}
	
	
	
	#number	{
		border:1px solid white;
		width: 200px;
		height: 30px;
		text-align: center;
		line-height: 30px;
		display: inline-block;
		
	}
	
	
	/* 상품정보 큰 이미지 시작 */
	
	.big_product	{
		width: 1200px;
		margin-top: 30px;
		margin: 0 auto;
	}
	
	.big_product_a	{
		margin: 0 auto;
		height: 50px;
	    display: flex;
	    flex-direction: row;
	    flex-wrap: nowrap;
	    align-content: center;
	    justify-content: space-between;
	    align-items: center;
	    clear: both;
	    font-weight: bold;
	    
		
	}
	
	.big_product_a a	{
		text-decoration: none;
		color:black;

	}
	
	.big_product_1	{
	
		width: 260px;
		height: 50px;
		margin-top: 70px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		text-decoration-line: none;

	}
	.big_product_1:hover	{
		cursor: pointer;
		border-bottom: 3px solid black;
		color:red;
	}
	
	
	.big_product_2	{
		
		width: 260px;
		height: 50px;
		margin-top: 70px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		
		
	}
	.big_product_2:hover	{
		cursor: pointer;
		border-bottom: 3px solid black;
		color:red;
	}
	.big_product_3	{
		
		width: 260px;
		height: 50px;
		margin-top: 70px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		
	}
	
	
	.big_product_3:hover	{
		cursor: pointer;
		border-bottom: 3px solid black;
		color:red;
	}
	
	.big_product_4	{
		
		width: 260px;
		height: 50px;
		margin-top: 70px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		
	}
	.big_product_4:hover	{
		cursor: pointer;
		border-bottom: 3px solid black;
		color:red;
	}
	
	.big_product_main_1	{
		height: 3660px;
		margin-top:60px;
	}
	.big_product_main_1_1	{
		margin: 0 40px 0 180px;
		width: 900px;
		
	}
	
	
	/*용규님 CSS  */
	.head-product-wrap {
		width: 1200px;
		margin: 0 auto;
	}
	.text-head {
		margin: 53px 0 0;
		color: #000;
		font-size: 18px;
		line-height: 30px;
		font-weight: 500;
		font-weight: bold;
		letter-spacing: -.9px;
	}
	.border-line-box {
		
		margin-top: 0;
		border-top: 2px solid #000;
		border-bottom: 1px solid #666;
	}
	.border-line-box table tr th {
		text-align: left;
	}
	tbody tr th {
		color: #666;
		vertical-align: middle;
		padding: 17px 0 17px 20px;
		display: table-cell;
		font-weight: bold;
		height: auto;
		font-size: 13px;
		letter-spacing: -.65px;
	}
	tbody tr td {
		padding: 19px 0 18px;
		line-height: 23px;
		height: auto;
		font-size: 13px;
		letter-spacing: -.65px;
		color: black;
		text-align: left;
		margin: 0;
		border: 0;
		font-style: normal;
		display: table-cell;
		vertical-align: inherit;
	}
	tbody tr+tr, tbody tr+tr td {
		border-top: 1px solid #d5d5d5;
	}
	table {
		width: 1200px;
		border-collapse: collapse;
		border-spacing: 0;
		table-layout: fixed;
		text-indent: initial;
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
    	<input type="hidden" name="toURI" id="toURI" value="${toURI }">
	<div class="contents-width">
		<div class="breadcrumb-wrap" id="prdtCtgrCrumb">
			<ul>
				<li>HOME ></li>
				<li id="genderChk"></li>
				<li>신발 ></li>
				<li> 
				<select name="category"> 
				<option selected="selected"><a herf="#">운동화</a></option>
				<option><a herf="#">스포츠</option>
				<option><a herf="#">샌들</option>
				</select>
				</li>
				<li>  >
				<select name="category"> 
				<option selected="selected"><a herf="#">스니커즈</a></option>
				<option><a herf="#">캔버스화</option>
				<option><a herf="#">슬립온</option>
				</select>
				</li>
			</ul>
		</div>
		<div class="contents-inner product-detail-wrap">
			<div class="image_big_left">
				<img src="${list[0].s_file_path }" id="big" name="product_id">
				  
					<div class="image_big_left_small">
					 
					<!--시간남으면 사진파일 가져올예정 
					<div class="small_image_div">
						<img src="" class="small">
					</div>
					<div class="small_image_div">
						<img src="" class="small">
					</div>
					<div class="small_image_div">
						<img src="" class="small">
					</div>
					<div class="small_image_div">
						<img src="" class="small"> 
					</div>
					<div class="small_image_div">
						<img src="" class="small"> 
					</div>  -->
					
					<div class="image_big_left_Product_satisfaction">
						<div class="image_big_left_Product_satisfaction_left">
							<div class="image_big_left_Product_satisfaction_left_1">상품만족도</div><p>
							<div class="image_big_left_Product_satisfaction_left_2">97%</div><p>
							<div class="image_big_left_Product_satisfaction_left_3"><img src="/j20220904/img/contexts/star_0.png"><img src="/j20220904/img/contexts/star_0.png"><img src="/j20220904/img/contexts/star_0.png"><img src="/j20220904/img/contexts/star_0.png"><img src="/j20220904/img/contexts/star_0.png"> 5</div><p>
						</div>
						<div class="image_big_left_Product_satisfaction_right">
							<div class="image_big_left_Product_satisfaction_right_1">
								<ul>
								    <li><span class="label" style="">사이즈</span>
								    	정사이즈
								    </li>
								    <li><span class="label" style="">색상</span>
								    	화면과 같음
							    	</li>
								    <li><span class="label" style="">발볼</span>
								    	적당함
							    	</li>
								    <li><span class="label" style="">발등</span>
								    	적당함
							    	</li>
								</ul>
							</div>
						</div>
					</div>
				</div>	
					
				
			</div>
			<div class="image_big_right">
				<div class="detail_brandbox">
					<span class="ABC_MRRT">ABC-MART</span>
						<div class="detail_brandbox_like">
							<c:if test="${likeCnt == 0}">
							<input type="hidden" class="heart" name="heart" value="0">
							<img src="/j20220904/img/contexts/heart1.png" id="heart">
							</c:if>
							<c:if test="${likeCnt != 0}">
							<input type="hidden" class="heart" name="heart" value="1">
							<img src="/j20220904/img/contexts/heart0.png" id="heart">
							</c:if>
						</div>
				</div>
				<div class="brand_name"> <p>
						${list[0].eng_name}
				</div>
				<div class="product_name">
						${list[0].kor_name}
				</div>
				<ul class="product_code">
					<li>
						${list[0].product_id}
					</li>
				</ul>
				<div class="detail_price">
				<ul>
					<!-- <s>89,000원</s> -->
					<li>
						${list[0].price}
					</li><span>원</span>
				</ul>
				<button class="button--open"><img src="/j20220904/img/contexts/product_button.png" id="product_button"></button>
			        <div class="modal--bg hidden">
			            <div class="modal">
			                	<table class="modal__text">
			                		<tr>
			                			<td>정상가</td><td>${list[0].price }원</td>
			                		</tr>
			                		<tr>	
			                			<td>할인가</td><td>0원</td>
			                		</tr>
			                		<tr>
			                			<td>회원최대혜택가</td><td class="product_real_price">
													${list[0].price}원
										</td>
			                		</tr>
			           					
			                	</table>
			            </div>
			        </div><!-- 모달끝 -->
					<hr> <!-- 스타일컬러 전에 밑줄쫙 -->
					<div class="style_color">
						<!--<div class="style_color_1">
							  시간남으면 사진 가져올 예정
								<div class="style_color_left">
								스타일컬러
							</div>
							<div class="style_color_right">
								<img src="/j20220904/img/contexts/similar_01.jpg" alt="비슷한스타일1">
								<img src="/j20220904/img/contexts/similar_02.jpg" alt="비슷한스타일2">
								<img src="/j20220904/img/contexts/similar_03.jpg" alt="비슷한스타일3">
								<img src="/j20220904/img/contexts/similar_04.jpg" alt="비슷한스타일4">
								<img src="/j20220904/img/contexts/similar_05.jpg" alt="비슷한스타일5">
							</div> 
						</div> -->
						<div class="style_color_code_1">	
							<div class="style_color_code_left">
								색상
							</div>
							<div class="style_color_code_right">
									${list[0].color}
							</div>
						</div>
						<div class="style_delivery_left_1">
							<div class="style_delivery_left">
								배송방법
							</div>
								<div class="style_delivery_right">
									일반배송(무료배송)
								</div>
						</div>	
						<!-- <div class="style_delivery_down">
							<select class="style_delivery_down_right">
								<option selected="selected" value="배송지주소값 넘어감">배송지 주소를 선택해주세요</option>
							</select>
						</div> -->
						<div class="style_size">
							<div class="style_size_left">사이즈</div>
							<div class="style_size_right">
								<button type="button" id="${list[0].pd_size }" value="${list[0].pd_size }">${list[0].pd_size }</button>
								<button type="button" id="${list[1].pd_size }" value="${list[1].pd_size }">${list[1].pd_size }</button>
								<button type="button" id="${list[2].pd_size }" value="${list[2].pd_size }">${list[2].pd_size }</button>
								<button type="button" id="${list[3].pd_size }" value="${list[3].pd_size }">${list[3].pd_size }</button>
								<button type="button" id="${list[4].pd_size }" value="${list[4].pd_size }">${list[4].pd_size }</button>				
							</div>
						</div>
						<form id="sizeForm" action="${pageContext.request.contextPath}/orders/ordersDirectProduct.do"> 
							<input type="hidden" name="product_id" value="${product_id }">
							<input type="hidden" name="mem_id" value="${mem_id }">
							<input type="hidden" name="brand" value="${list[0].brand }">
							<input type="hidden" name="eng_name" value="${list[0].eng_name }">
							<input type="hidden" name="kor_name" value="${list[0].kor_name }">
							<input type="hidden" name="gender" value="${list[0].gender }">
							<input type="hidden" name="price" value="${list[0].price }">	
							<input type="hidden" name="s_file_path" value="${list[0].s_file_path }">	
							<%-- 
							<input type="hidden" name="size_num" value="${list[0].size_num }">
							<input type="hidden" name="stock" value="${list[0].stock }"> 
							--%>
						<div class="append_product">
							<div class="append_product_child_left">
							
							
							
							</div>
						</div>
						
						<div class="style_total">
							<div class="style_total_left">
								총 결제금액
							</div>
							<div class="style_total_right">
									 0
							</div><span>원</span>
						</div>
						<div class="style_myshopping">
							<div class="style_myshopping_left">
								<button type="button" id="myshopping1" value="장바구니">장바구니</button>
							</div>
							<div class="style_myshopping_right">
								<button type="submit"  id="myshopping2" value="바로구매">바로구매</button>
							</div>			
						</div>
						</form>
					</div>
					
				</div>
			</div>
		</div>	
	</div>
	<!-- 용규님이 작성 -->
	<div class="head-product-wrap">
	<div class="text-head">상품정보제공 고시</div>
		<div class="border-line-box" id="product-detail-notice-wrapper">
		<table>
			<colgroup>
				<col style="width: 153px;">
				<col>
				<col style="width: 153px;">
				<col>
			</colgroup>
			<tbody id="product-detail-notice">
				<tr>
					<th>소재</th>
					<td>폴리에스터</td>
					<th>색상</th>
					<td>${list[0].color }</td>
				</tr>
				<tr>
					<th>치수</th>
					<td><span>${list[0].pd_size } / ${list[1].pd_size } / ${list[2].pd_size } /  ${list[3].pd_size } / ${list[4].pd_size } </span></td>
					<th>굽높이</th>
					<td><span>(굽높이)</span></td>
				</tr>
				<tr>
					<th>브랜드</th>
					<td><span>${list[0].brand }</span></td>
					<th>제조국</th>
					<td><span>베트남</span></td>
				</tr>
				<tr>
					<th>A/S 책임자와 전화번호</th>
					<td><span>ABC마트 A/S 담당자 : 080-701-7770</span></td>
					<th>제조년월</th>
					<td><span>상품별 입고시기에 따라 상이하여, 배송 받으신 제품의 라벨 참고 바랍니다.</span></td>
				</tr>
				<tr>
					<th>품질보증기준</th>
					<td><span>관련 법 및 소비자 분쟁 해결 기준에 따름 (품질보증기간 : 구입일로부터 6개월 이내)</span></td>
					<th>소재별 관리방법	</th>
					<td><span>상품 착용 및 세탁 시에는 제품에 부착된 라벨 및 취급 주의사항을 꼭 먼저 확인해 주시길 바랍니다. 가벼운 오염물이 묻었을 때에는 부드러운 솔로 털어내주시기 바랍니다. 물에 젖었을 때에는 바람이 잘 통하는 응달에 건조해 주시기 바랍니다.</span></td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
	
	
	
	
	
	<!-- 상품큰 사진 -->
	<div class="big_product">
		<div class="big_product_a">
			<div class="big_product_1">
				상품정보
			</div>
			<div class="big_product_2">
				상품후기
			</div>
			<div class="big_product_3">
				상품Q&A
			</div>
			<div class="big_product_4">
				배송/교환/반품/AS안내
			</div>
		</div> 
		
		
		
		
		<div class="big_product_main">
			<div class="big_product_main_1">
				 <img src="${list[0].l_file_path}" class="big_product_main_1_1" id="big_product_main_1_1"> 
			</div>
			<div class="big_product_main_2">
				<!--예림님이 상품후기 여기다가 작성  -->	
				<div id="content">
					<div id="productReview" class="top-wrap">
						<div class="inner">
							<!-- 메뉴 탭 list -->
							<%-- <ul class="tabs">
								<li class="tab-item">
									<a href="#" class="tab-link">상품정보</a>
								</li>
								<li class="tab-item ui-tabs-active">
									<a href="../board/reviewBoard.do" class="tab-link" id="review-btn">상품후기
										<span class="num">(${rbTotCnt })</span>
									</a>
								</li>
								<li class="tab-item">
									<a href="../board/qnaBoard.do" class="tab-link" id="qna-btn">상품 Q&amp;A
										<span class="num">(${qATotCnt})</span>
									</a>
								</li>
								<li class="tab-item">
									<a href="#" class="tab-link">배송/교환/반품/AS안내</a>
								</li>
							</ul> --%>
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
										총 ${rbTotCnt }개의 리뷰가 있습니다.
									</span>
								</div>
								<!-- 후기 리스트 -->
								<div class="border-line-box">
									<!-- 후기 없을 때 -->
									<div class="flex-box" style="display: none;">
										<p class="no-data-text">작성된 후기가 없습니다. 첫 번째 후기를 남겨보세요.</p>
									</div>
									<!-- 후기 글 목록 -->
									<table>
										<tr>
											<th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th>
										</tr>
										<!-- 글 목록 -->
										<c:if test="${rbTotCnt > 0 }">
											<c:forEach var="reviewBoard" items="${reviewList }">
												<tr>
													<td>${startNum }</td>
													<td>
														<a href="reviewContent.do?rb_id=${reviewBoard.rb_id}&pageNum=${currentPage}">
															${reviewBoard.rb_title}
														</a>
													</td>
													<td>${reviewBoard.mem_id }</td>
													<td>${reviewBoard.rb_date }</td>
													<td>${reviewBoard.rb_views }</td>
												</tr>
											</c:forEach>
										</c:if>
									</table>
									
									<!-- 나중에 수정 -->
									<div style="text-align: center;">
										<c:if test="${startPage > blockSize }">
											<a href='reviewBoard.do?pageNum=${startPage-blockSize}'>[이전]</a>
										</c:if>
										<c:forEach var="i" begin="${startPage}" end="${endPage}">
											<a href='reviewBoard.do?pageNum=${i}'>[${i}]</a>
										</c:forEach>
										<c:if test="${endPage < pageCnt }">
											<a href='reviewBoard.do?pageNum=${startPage+blockSize}'>[다음]</a>
										</c:if>
									</div>	
									<!--<ul class="fold-box-list">
										게시글 1개
										<li class="fold-box">
											<div class="fold-box-header">
												<div class="review-box">
													별점 표시 나중에 구현
													<div class="rating-wrap">
														<div class="star-rating"></div>
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
											<a href="reviewWriteForm.jsp" class="btn btn-dialog">상품 후기 작성</a>
										</div>
									</div>
									
								</div>
							</div>
						</div>
					</div>
				</div>
			    <%-- <div class="review_board">
					<jsp:include page="../board/reviewBoard.jsp"></jsp:include>
		    	</div>	 --%>
			    			
			    			
			</div>
			<div class="big_product_main_3">
			   	<!--예림님이 상품Q&A 여기다가 작성  -->	
			   	<div id="content">
					<div id="productQna" class="top-wrap">
						<div class="inner">
							<!-- Q&A 부분 -->
							<div class="qnaBox">
								<%-- <ul class="tabs">
									<li class="tab-item">
										<a href="#" class="tab-link">상품정보</a>
									</li>
									<li class="tab-item">
										<a href="../board/reviewBoard.do" class="tab-link" id="review-btn">상품후기
											<span class="num">(${rbTotCnt })</span>
										</a>
									</li>
									<li class="tab-item ui-tabs-active">
										<a href="../board/qnaBoard.do" class="tab-link" id="qna-btn">상품 Q&amp;A
											<span class="num">(${qATotCnt})</span>
										</a>
									</li>
									<li class="tab-item">
										<a href="#" class="tab-link">배송/교환/반품/AS안내</a>
									</li>
								</ul> --%>
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
											<c:if test="${qATotCnt > 0 }">
												<c:forEach var="qABoard" items="${qAList }">
													<tr>
														<td>${startNum }</td>
														<td>
															<a href='qnaContent.do?q_id=${qABoard.q_id}&pageNum=${currentPage}'>
																${qABoard.q_title}
															</a>
														</td>
														<td>${qABoard.mem_id}</td>
														<td>${qABoard.q_date }</td>
														<td>${qABoard.q_views }</td>
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
				</div>
			   	<%-- <div class="qna_board">
					<jsp:include page="../board/qnaBoard.jsp"></jsp:include>
				</div>	 --%>
			   				
			</div>
			<div class="big_product_main_4">
				<!--예림님이 배송/교환/반품/AS 여기다가 작성  -->
			 	<div class="etc_notice">
					<jsp:include page="../board/etcNotice.jsp"></jsp:include>
				</div>				
			</div>
		</div>
	</div>
	
	<div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div>

	 
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script type="text/javascript">

/* 상품 리뷰 게시판 */
$(function() {
	$(".big_product_main_2").click(function() {
		location.href="../board/reviewBoard.do?product_id=${product_id}";
	})
});

/* 상품 Q&A 게시판 */
$(function() {
	$(".big_product_main_3").click(function() {
		location.href="../board/qnaBoard.do?product_id=${product_id}";
	})
});

// 상품정보,상품후기,상품Q&A,AS안내 show/hide하는 로직
$(document).ready(function(){
	  $('.big_product_main_1').show();
	  $('.big_product_main_1').siblings('div').hide();
	  
	  $(".big_product_1").click(function(){
	    $('.big_product_main_1').show();
	    $('.big_product_main_1').siblings('div').hide();
	  });
	  $(".big_product_2").click(function(){
	    $('.big_product_main_2').show();
	    $('.big_product_main_2').siblings('div').hide();
	  });
	  $(".big_product_3").click(function(){
	    $('.big_product_main_3').show();
	    $('.big_product_main_3').siblings('div').hide();
	  });
	  $(".big_product_4").click(function(){
		    $('.big_product_main_4').show();
		    $('.big_product_main_4').siblings('div').hide();
	  });
	});




//성별 체크해서 나타나게하는 로직
	$(function(){
		if(Number(${list[0].gender})==0)	{
			$('#genderChk').text('MEN >');
		}else{
			$('#genderChk').text('WOMEN >');
		}
	});




	
//찜하면 빨간하트로 바뀌고 찜한상품 insert하는 로직	, 로그인 안했을때 장바구니 안담기게
	$(function () {
		var num =$('.heart').val();

		var imageName = ["heart1", "heart0"];
		$("#heart").click(function() {
			if(num == 1) {
				num=0;
				
				$.ajax({
					url:  '${pageContext.request.contextPath}/contents/deleteLike.do',
					type: 'get',
					data: {
							'product_id' : ${product_id},
							'mem_id' :  '${sessionScope.mem_id}'
							
					      },
						
					dataType: 'text',
					success : function(data){
						console.log('data='+data);
						if(data == '1') {	
							alert('찜한 상품이 삭제되었습니다');
						}else {
							alert('로그인후 찜한 상품을 담을수 있습니다');
							location.href="${pageContext.request.contextPath}/member/loginForm.do?toURI=${toURI}";
						}
					},
					error: function(err){
						console.log(err);
					}
				});	
				
			}else	    {
				num++;
				
				$.ajax({
					url: '${pageContext.request.contextPath}/contents/insertLike.do',
					type: 'get',
					data: {
							'product_id' : ${product_id},
							'mem_id' :  '${sessionScope.mem_id}'
						  },
					dataType: 'text',
					success : function(data){
						console.log('data='+data);
						if(data == '1') {
							alert('찜한 상품이 등록되었습니다');
						}else {
							alert('로그인후 찜한 상품을 담을수 있습니다');
							
							location.href="${pageContext.request.contextPath}/member/loginForm.do?toURI=${toURI}";
						}
					},
					error: function(err){
						console.log(err);
					}
				});	
				
			
				}
			
			$(this).attr("src","/j20220904/img/contexts/"+ imageName[num]+".png");
		});
	});	
	


	 
	
//작은 이미지 hover하면 큰 이미지로 바뀌는 로직	(시간남으면 이미지 더 추가)

	var bigPic = document.querySelector("#big"); //큰 사진
	var smallPics = document.querySelectorAll(".small"); //작은사진 여러개
	
	for(var i=0; i< smallPics.length; i++)	{
		smallPics[i].addEventListener("mouseover", changepic) // 이벤트 처리
		
	}
	
	function changepic(){ //사진바꾸는 함수
		var smallPicAttribute = this.getAttribute("src");
		bigPic.setAttribute("src", smallPicAttribute);
		
	}
	
		/* 모달창 자바스크립트 */
	var openBtn = document.querySelector('.button--open');
	var closeBtn = document.querySelector('.button--close');
	var modal = document.querySelector('.modal--bg');
	
	
	openBtn.addEventListener('mouseover', showModal);
	openBtn.addEventListener('mouseout', closeModal);

	function showModal() {
	    modal.classList.remove('hidden');
	    modal.classList.add('visible');
	}

	function closeModal() {
	    modal.classList.add('hidden');
	    modal.classList.remove('visible');
	}
	
	
	
	
////////////////// 사이즈 없으면 안눌려서 장바구니로 가지못하게 하는 로직//////////////////////
//여자버튼
 $(function(){
		
		if(Number(${list[0].size_num}) == '100' && Number(${list[0].stock}) == '0' ) {
			 
			$('#${list[0].pd_size }').prop('disabled',true); 
		}
	}); 
 
	 $(function(){
			
			if(Number(${list[1].size_num}) == '110' && Number(${list[1].stock}) == '0' ) {
				 
				$('#${list[1].pd_size }').prop('disabled',true); 
			}
		});
	 
	
	 $(function(){
			
			if(Number(${list[2].size_num}) == '120' && Number(${list[2].stock}) == '0' ) {
				 
				$('#${list[2].pd_size }').prop('disabled',true); 
			}
		}); 
	 $(function(){
			
			if(Number(${list[3].size_num}) == '130' && Number(${list[3].stock}) == '0' ) {
				 
				$('#${list[3].pd_size }').prop('disabled',true); 
			}
		}); 
	 $(function(){
			
			if(Number(${list[4].size_num}) == '140' && Number(${list[4].stock}) == '0' ) {
				 
				$('#${list[4].pd_size }').prop('disabled',true); 
			}
		}); 







 //남자 버튼
	 $(function(){
		
		if(Number(${list[0].size_num}) == '200' && Number(${list[0].stock}) == '0' ) {
			 
			$('#${list[0].pd_size }').prop('disabled',true); 
		}
	}); 
 
	 $(function(){
			
			if(Number(${list[1].size_num}) == '210' && Number(${list[1].stock}) == '0' ) {
				 
				$('#${list[1].pd_size }').prop('disabled',true); 
			}
		});
	 
	
	 $(function(){
			
			if(Number(${list[2].size_num}) == '220' && Number(${list[2].stock}) == '0' ) {
				 
				$('#${list[2].pd_size }').prop('disabled',true); 
			}
		}); 
	 $(function(){
			
			if(Number(${list[3].size_num}) == '230' && Number(${list[3].stock}) == '0' ) {
				 
				$('#${list[3].pd_size }').prop('disabled',true); 
			}
		}); 
	 $(function(){
			
			if(Number(${list[4].size_num}) == '240' && Number(${list[4].stock}) == '0' ) {
				 
				$('#${list[4].pd_size }').prop('disabled',true); 
			}
		}); 

	

//사이즈 누를때 append되는 로직	
	$(function(){

		
		$('#${list[0].pd_size }').click(function(){
			  
			
			if($('.append_product').children().text() != $('.div250').text()) {
				$('.append_product').children().addClass();
				
				
			}
			if($('.div250').text() == '') {
				$('.append_product_child_left').append('<div class="e1"><div class="append_list div250"> ${list[0].pd_size } </div><input type="number" value="1" class="input1" name="number"  min="1" max="99" id="number1"><input type="hidden" id="size_num" name="size_num" value="${list[0].size_num }"><img src="/j20220904/img/contexts/x.png" class="X" alt="X" id="X1"></div> ');
			}
			
			
			$('#X1').click(function(){
				$('.e1').remove();
				
				
				});
		});
	});
	
	
	$(function(){
		$('#${list[1].pd_size }').click(function(){
			
			
			
			
			if($('.append_product').children().text() != $('.div260').text()) {
				$('.append_product').children().addClass();
				
			}
			if($('.div260').text() == '') {
				$('.append_product_child_left').append('<div class="e2"><div class="append_list div260"> ${list[1].pd_size } </div> <input type="number" value="1" class="input2" name="number" min="1" max="99" id="number2"><input type="hidden" id="size_num" name="size_num" value="${list[1].size_num }"><img src="/j20220904/img/contexts/x.png" class="X" alt="X" id="X2"></div>');

			}
			$('#X2').click(function(){
				$('.e2').remove();
				
				
				});
			
		});
	});
	$(function(){
		$('#${list[2].pd_size }').click(function(){
			
			
			
			if($('.append_product').children().text() != $('.div270').text()) {
				$('.append_product').children().addClass();
				
			}
			if($('.div270').text() == '') {
				$('.append_product_child_left').append('<div class="e3"><div class="append_list div270"> ${list[2].pd_size } </div> <input type="number" name="number" class="input3" value="1" min="1" max="99" id="number3"><input type="hidden" id="size_num" name="size_num" value="${list[2].size_num }"><img src="/j20220904/img/contexts/x.png" alt="X" class="X" id="X3"></div>');
			
			}
			$('#X3').click(function(){
				$('.e3').remove();
				
				
				});
			
		});
	});
	$(function(){
		$('#${list[3].pd_size }').click(function(){
			
			
			
			if($('.append_product').children().text() != $('.div280').text()) {
				$('.append_product').children().addClass();
				
			}
			if($('.div280').text() == '') {
				$('.append_product_child_left').append('<div class="e4"><div class="append_list div280"> ${list[3].pd_size } </div><input type="number" name="number" class="input4" value="1" min="1" max="99" id="number4"><input type="hidden" id="size_num" name="size_num" value="${list[3].size_num }"><img src="/j20220904/img/contexts/x.png" alt="X" class="X" id="X4"></div>');
			}
			
			$('#X4').click(function(){
				$('.e4').remove();
				
				
				});
			
		});
	});
	$(function(){
		$('#${list[4].pd_size }').click(function(){
			
			
			if($('.append_product').children().text() != $('.div290').text()) {
				$('.append_product').children().addClass();
			}
			if($('.div290').text() == '') {
				$('.append_product_child_left').append('<div class="e5"><div class="append_list div290"> ${list[4].pd_size } </div> <input type="number" class="input5" name="number" value="1" min="1" max="99" id="number5"><input type="hidden" id="size_num" name="size_num" value="${list[4].size_num }"><img src="/j20220904/img/contexts/x.png" alt="X" class="X" id="X5"></div>');
			}
			
			$('#X5').click(function(){
				$('.e5').remove();
				
				
				});
		});
	});
	
//	


//총 결제금액 구하는 로직	
		var amount1 =0;
		$(document).on('click','#${list[0].pd_size }', function(){
			   amount1 = Number(${list[0].price});
			   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
		   });
		
	   $(document).on('change', '#number1', function() {
			   amount1 = Number(${list[0].price})*Number($("#number1").val()); // 89000;
			     
		      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);     
	   });
	   
	   $(document).on('click','#X1', function(){
		   amount1 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   
	   var amount2 = 0;
	   $(document).on('click','#${list[1].pd_size }', function(){
		   amount2 = Number(${list[0].price});
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   $(document).on('change', '#number2', function() {
	      amount2 = Number(${list[0].price})*Number($("#number2").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   $(document).on('click','#X2', function(){
		   amount2 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   var amount3 = 0;
	   $(document).on('click','#${list[2].pd_size }', function(){
		   amount3 = Number(${list[0].price});
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   $(document).on('change', '#number3', function() {
	      amount3 = Number(${list[0].price})*Number($("#number3").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   }); 
	   
	   $(document).on('click','#X3', function(){
		   amount3 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   var amount4 = 0;
	   $(document).on('click','#${list[3].pd_size }', function(){
		   amount4 = Number(${list[0].price});
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   $(document).on('change', '#number4', function() {
	      amount4 = Number(${list[0].price})*Number($("#number4").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   }); 
	   
	   $(document).on('click','#X4', function(){
		   amount4 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   var amount5 = 0;
	   $(document).on('click','#${list[4].pd_size }', function(){
		   amount5 = Number(${list[0].price});
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   $(document).on('change', '#number5', function() {
	      amount5 = Number(${list[0].price})*Number($("#number5").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   }); 
	   
	   $(document).on('click','#X5', function(){
		   amount5 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
//	
	   
	   
	   /* 장바구니 alert */
		$(function() {
			$(document).on('click','#myshopping1' ,function() {
				
				//만약에 사이즈가 0이거나 선택을 안했을시에
				if(!$('.input1').val() && !$('.input2').val() && !$('.input3').val() && !$('.input4').val() &&  !$('.input5').val()){
					alert('사이즈를 선택해주세요');
				}else{
					
								$.ajax({
									url: '${pageContext.request.contextPath}/contents/insertBasket.do', //장바구니쪽
									type: 'get',
									data: $('#sizeForm').serialize(), //form안에 있는 data 다 전송
									dataType: 'text',
									success : function(data){
										if(data == '1'){
											alert('장바구니에 상품이 등록되었습니다\n장바구니로 가시겠습니까?');
											location.href='http://localhost:8181/j20220904/basket/goToBasket.do';
										}else if(data == '2'){
											alert('이미 담겨있는 상품입니다');
										}else{
											alert('장바구니가 비었습니다\n장바구니에 상품을 담아주세요');
										}
									},
									error: function(err){
										console.log(err);
									}
								});	
							
				
				}
			
			});
		});
		
		/* 바로구매 alert */
		/* 
		$(function() {
			$(document).on('click','#myshopping2' ,function() {
				
				if(!$('.input1').val() && !$('.input2').val() && !$('.input3').val() && !$('.input4').val() &&  !$('.input5').val()){
					alert('옵션을 선택해주세요');
				}else{
								$.ajax({
									
									url: '${pageContext.request.contextPath}/orders/ordersDirectProduct.do',
									type: 'get',
									data: $('#sizeForm').serialize(), //form안에 있는 data 다 전송
									dataType: 'text',
									success : location.href='http://localhost:8181/orders/ordersDirectProduct.do',
									error: function(err){
										console.log(err);
									}
								});	
								
				};
			});	
		}); */
			
</script>

</body>

</html>