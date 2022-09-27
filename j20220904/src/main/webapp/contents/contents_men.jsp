<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.contents-width	{
		border:1px solid white;
		width: 1200px;
		height: 1000px;
	}
	
	.breadcrumb-wrap {
		border:1px solid white;
		width: 1200px;
		height: 60px;
		
	}

	.breadcrumb-wrap li {
	 float:left;
	 list-style: none;
	}
	
	.contents-inner.product-detail-wrap	{
		 margin-top: 20px;
	}
	
	.image_big_left	{
		border:1px solid white;
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
		width: 200px;
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
	    margin-top: 30px;
      
	   
	}
	
	.append_list.div250	{
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		text-align: center;
		
	}
	#250 {
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		margin-left: 15px;
		
	}
	
	.append_list.div260	{
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		text-align: center;
		
		
	}
	#260 {
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		margin-left: 15px;
	}
	
	.append_list.div270	{
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		
		text-align: center;
		
	}
	#270 {
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		margin-left: 15px;
		
	}
	
	.append_list.div280	{
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		text-align: center;
		
	}
	#280 {
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		margin-left: 15px;
		
	}
	
	.append_list.div290	{
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		
		
		
	}
	#290 {
		border:1px white solid;
		display: inline-block;
		width: 260px;
		height: 50px;
		line-height: 50px;
		text-align: center;
		margin-left: 15px;
	}
	
	.X	{
		width: 10px;
		height: 10px;
		margin-left: 10px;
		
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
		border:1px solid white;
		width: 1200px;
		margin-top: 30px;
	}
	
	.big_product_a	{
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
		border:1px solid white;
		width: 260px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		text-decoration-line: none;

	}
	.big_product_1:hover	{
		cursor: pointer;
	}
	
	
	.big_product_2	{
		border:1px solid white;
		width: 260px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		
		
	}
	.big_product_2:hover	{
		cursor: pointer;
	}
	.big_product_3	{
		border:1px solid white;
		width: 260px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		
	}
	
	
	.big_product_3:hover	{
		cursor: pointer;
	}
	
	.big_product_4	{
		border:1px solid white;
		width: 260px;
		height: 50px;
		text-align: center;
		line-height: 50px;
		display: inline-block;
		
	}
	.big_product_4:hover	{
		cursor: pointer;
	}
	
	.big_product_main_1	{
		height: 3660px;
	}
	.big_product_main_1_1	{
		margin: 0 40px 0 180px;
		width: 900px;
		
	}
	
</style>
</head>
<body>
	<div class="contents-width">
		<div class="breadcrumb-wrap" id="prdtCtgrCrumb">
			<ul>
				<li>HOME ></li>
				<li>MEN ></li>
				<li>신발 ></li>
				<li>
				<select name="category">
				<option selected="selected"><a herf="#">운동화</a></option>
				<option><a herf="#">스포츠</option>
				<option><a herf="#">샌들</option>
				</select>
				</li>
				<li>
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
				<img src="${list[0].l_file_path }" id="big" name="product_id">
				<div class="image_big_left_small">
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
					</div>
					
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
							<img src="/j20220904/img/contexts/heart1.png" id="heart">
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
					</li>
				</ul>
				<button class="button--open"><img src="/j20220904/img/contexts/product_button.png" id="product_button"></button>
			        <div class="modal--bg hidden">
			            <div class="modal">
			                	<table class="modal__text">
			                		<tr>
			                			<td>정상가</td><td>89,000원</td>
			                		</tr>
			                		<tr>	
			                			<td>할인가</td><td>0원</td>
			                		</tr>
			                		<tr>
			                			<td>회원최대혜택가</td><td class="product_real_price">
													${list[0].price}
										</td>
			                		</tr>
			           					
			                	</table>
			            </div>
			        </div><!-- 모달끝 -->
					<hr> <!-- 스타일컬러 전에 밑줄쫙 -->
					<div class="style_color">
						<div class="style_color_1">
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
						</div>
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
									<input type="checkbox" required="required">일반배송(무료배송)
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
								<button type="button" id="250" value="250">250</button>
								<button type="button" id="260" value="260">260</button>
								<button type="button" id="270" value="270">270</button>
								<button type="button" id="280" value="280">280</button>
								<button type="button" id="290" value="290">290</button>
							</div>
						</div>
						<div class="append_product">
							<div class="append_product_child_left">
							
							</div>
						</div>
						
						<div class="style_total">
							<div class="style_total_left">
								총 결제금액
							</div>
							<div class="style_total_right">
									
							</div><span>원</span>
						</div>
						<div class="style_myshopping">
							<div class="style_myshopping_left">
								<button type="button" id="myshopping1" value="장바구니">장바구니</button>
							</div>
							<div class="style_myshopping_right">
								<button type="button"  id="myshopping2" value="바로구매">바로구매</button>
							</div>			
						</div>
					</div>
					
				</div>
			</div>
		</div>
		
			
	</div>
	
	<jsp:include page="pd_detail_info.jsp"></jsp:include>
	
	<!-- 상품큰 사진 -->
	<div class="big_product">
		<div class="big_product_a">
			<div class="big_product_1">
				<a href="">
				상품정보
				</a>
			</div>
			<div class="big_product_2">
				<a href="">
				상품후기
				</a>
			</div>
			<div class="big_product_3">
				<a href="">
				상품Q&A
				</a>
			</div>
			<div class="big_product_4">
				<a href="">
				배송/교환/반품/AS안내
				</a>
			</div>
		</div>
		
		<div class="big_product_main">
			<div class="big_product_main_1">
				<img src="/j20220904/img/contexts/big_product_main_1_1.jpg" class="big_product_main_1_1" id="big_product_main_1_1">
			</div>
		</div>
	</div>
	
	
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script> 
<script type="text/javascript">
	$(function () {
		var num = 0;
		var imageName = ["heart1", "heart0"];
		$("#heart").click(function() {
			if(num == 1) {
				num=0;
				
				$.ajax({
					url:  '${pageContext.request.contextPath}/contents/deleteLike.do',
					type: 'post',
					data: {
							'product_id' : ${product_id},
							'mem_id' :  '${sessionScope.mem_id}'
					      },
						
					dataType: 'text',
					success : function(data){
						alert('찜한 상품이 삭제되었습니다');
					},
					error: function(err){
						console.log(err);
					}
				});	
				
			}else 	     {
				num++;
				
				$.ajax({
					url: '${pageContext.request.contextPath}/contents/insertLike.do',
					type: 'post',
					data: {
							'product_id' : ${product_id},
							'mem_id' :  '${sessionScope.mem_id}'
						  },
					dataType: 'text',
					success : function(data){
						alert('찜한 상품이 등록되었습니다');
					},
					error: function(err){
						console.log(err);
					}
				});	
				
			
			}
			$(this).attr("src","/j20220904/img/contexts/"+ imageName[num]+".png");
		});
	});	
	
	
	 
	
	
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
	
	/* 장바구니 alert */
	$(function() {
		$("#myshopping1").click(function() {
			confirm('상품이 장바구니에 담겼습니다\n장바구니로 이동하시겠습니까?');
			location.href="https://www.naver.com"; /* 장바구니로 이동 */
		});
	});
	
	/* 바로구매 alert */
	
	
	

	
	$(function() {
		$("#myshopping2").click(function() {
			confirm('바로 구매하시겠습니까?');
			location.href="https://www.daum.net"; /* 바로구매창 이동 */
		});
	});
	
	$(function(){
		
		
		
		$('#250').click(function(){
			
			if($('.append_product').children().text() != $('.div250').text()) {
				$('.append_product').children().addClass();
				
				
			}
			if($('.div250').text() == '') {
				$('.append_product_child_left').append('<div class="e1"><div class="append_list div250"> 250 </div><input type="number" value="0" class="input1" name="number"  min="0" max="99" id="number1"><img src="/j20220904/img/contexts/x.png" class="X" alt="X" id="X1"></div> ');
			}
			
			
			$('#X1').click(function(){
				$('.e1').remove();
				
				
				});
		});
	});
	
	
	$(function(){
		$('#260').click(function(){
			
			
			
			
			if($('.append_product').children().text() != $('.div260').text()) {
				$('.append_product').children().addClass();
				
			}
			if($('.div260').text() == '') {
				$('.append_product_child_left').append('<div class="e2"><div class="append_list div260"> 260 </div> <input type="number" value="0" class="input2" name="number" min="0" max="99" id="number2"><img src="/j20220904/img/contexts/x.png" class="X" alt="X" id="X2"></div>');

			}
			$('#X2').click(function(){
				$('.e2').remove();
				
				
				});
			
		});
	});
	$(function(){
		$('#270').click(function(){
			
			
			
			if($('.append_product').children().text() != $('.div270').text()) {
				$('.append_product').children().addClass();
				
			}
			if($('.div270').text() == '') {
				$('.append_product_child_left').append('<div class="e3"><div class="append_list div270"> 270 </div> <input type="number"  class="input3" value="0" min="0" max="99" id="number3"><img src="/j20220904/img/contexts/x.png" alt="X" class="X" id="X3"></div>');
			
			}
			$('#X3').click(function(){
				$('.e3').remove();
				
				
				});
			
		});
	});
	$(function(){
		$('#280').click(function(){
			
			
			
			if($('.append_product').children().text() != $('.div280').text()) {
				$('.append_product').children().addClass();
				
			}
			if($('.div280').text() == '') {
				$('.append_product_child_left').append('<div class="e4"><div class="append_list div280"> 280 </div><input type="number" class="input4" value="0" min="0" max="99" id="number4"><img src="/j20220904/img/contexts/x.png" alt="X" class="X" id="X4"></div>');
			}
			
			$('#X4').click(function(){
				$('.e4').remove();
				
				
				});
			
		});
	});
	$(function(){
		$('#290').click(function(){
			
			
			if($('.append_product').children().text() != $('.div290').text()) {
				$('.append_product').children().addClass();
			}
			if($('.div290').text() == '') {
				$('.append_product_child_left').append('<div class="e5"><div class="append_list div290"> 290 </div> <input type="number" class="input5" value="0" min="0" max="99" id="number5"><img src="/j20220904/img/contexts/x.png" alt="X" class="X" id="X5"></div>');
			}
			
			$('#X5').click(function(){
				$('.e5').remove();
				
				
				});
		});
	});
	
	
	
		var amount1 = 0;
	   $(document).on('change', '#number1', function() {
		  
			   
			   amount1 = Number(${list[0].price})*Number($("#number1").val()); // 89000;
			      
			      
		      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
			      
	   });
	   
	   $(document).on('click','#X1', function(){
		   amount1 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   
	   var amount2 = 0;
	   $(document).on('change', '#number2', function() {
	      amount2 = Number(${list[0].price})*Number($("#number2").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   $(document).on('click','#X2', function(){
		   amount2 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   var amount3 = 0;
	   $(document).on('change', '#number3', function() {
	      amount3 = Number(${list[0].price})*Number($("#number3").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   }); 
	   
	   $(document).on('click','#X3', function(){
		   amount3 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   var amount4 = 0;
	   $(document).on('change', '#number4', function() {
	      amount2 = Number(${list[0].price})*Number($("#number4").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   }); 
	   
	   $(document).on('click','#X4', function(){
		   amount4 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	   
	   var amount5 = 0;
	   $(document).on('change', '#number5', function() {
	      amount2 = Number(${list[0].price})*Number($("#number5").val()); // 89000;
	      
	      $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   }); 
	   
	   $(document).on('click','#X5', function(){
		   amount5 = 0;
		   $('.style_total_right').text(amount1 + amount2 + amount3 + amount4 +amount5);
	   });
	
	
	
	   
		
	
		
	
	
	




		
	   
	   
</script>
</body>
</html>