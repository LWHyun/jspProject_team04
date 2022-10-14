<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
<style type="text/css">

	.basket-wrap {		margin-top : 79px;
						padding-left: 150px;
						padding-right: 150px;
		
					}
	
	.basket-body {
		min-height : 300px;
	}
	
	.basket-body .item-name {
		font-size : 18px;
		margin-bottom : 10px;
	}
	
	.basket-body .item-color {
		font-size : 13px;
		color : gray;
	}
	
	
	.basket-body td {
		vertical-align: middle;
	}
	
	.basket-body, .cal-tbl {	
					width : 100%;
					margin-top : 30px;
					margin-bottom : 30px;
					border-top: 2px solid black;
					border-bottom: 1px solid black;	
				}
	
	.basket-wrap h2 {
		font-size : 32px;
		font-weight : bold;
	}
				
	.basket-content td {
					padding : 20px;
					text-align : center;
					}
			
	.buy-btn {
				text-align : center;
				margin-bottom : 30px;
			}
			
	.buy-notice {
					width : 100%;
					height : 250px;
					margin : 0 auto;
			        border: 1px solid #E6E6E6;
			       
			       	background-color: #FAFAFA;
				
			}
			
	.notice-contents {
						padding : 50px;
	
					}
					
	.notice_title {
		font-size: 19px;
		font-weight: bold;
		margin-bottom : 10px;
	}
	
			
	.basket-view {
					margin-top : 30px;
	}		
			
	
	.cal-text {
		
		font-weight: bold;
		font-size: 20px;
		
	}
	
	.sumProduct{
		color : red;
		font-weight: bold;
	}
	
	
	#total {
		font-size : 18px;
		color : red;
		font-weight: bold;
	}
	
	
	.orderBtn {
		background-color: black;
		color : white;
		padding : 0, 12px;
		width : 80px;
		height : 30px;
	}
	
	.deleteBtn, #delChk {
		background-color: white;
		color : black;
		padding : 0, 12px;
		width : 80px;
		height : 30px;
	}
	
	.shopBtn {
		background-color: white;
		color : black;
		padding : 0, 12px;
		width : 150px;
		height : 30px;
	}
	
	
	.orderAll {
		background-color: black;
		color : white;
		padding : 0, 12px;
		width : 150px;
		height : 30px;
	}
	
	
	.like_pro {
		color : black;
		font-weight: bold;
	}
	
	.like_brand {
		color : black;
		font-weight : bold;
		font-size: 15px;
	}
	
	.like_name {
		color : #666666;
		font-size : 14px;
	}
	
	.like_price {
		color : red;
		font-size : 19px;
	}
	
	.likeTbl {
					width : 100%;
					margin-top : 30px;
					margin-bottom : 30px;
					border-top: 2px solid black;
					border-bottom: 1px solid black;	
		
	}
	
	.likeTbl td {
		vertical-align: middle;
		padding : 20px;
		text-align: center;
	}
	
	.no_like_tbl {
					width : 100%;
					margin-top : 30px;
					margin-bottom : 30px;
					border-top: 2px solid black;
					border-bottom: 1px solid black;	
			
	}
	
	.like_title {
		
		margin-top : 15px;
		font-size: 25px;
		font-weight: bold;
	}
	
	
	.like_title a {
	
		text-decoration-line: none;
		color : black;
		
	}
	.no_like{
		padding-top: 80px;
		padding-bottom: 80px;
		text-align: center;
	}
	.item-name {
		font-weight : bold;
	}
	
	
	.countBtn {
		background-color: #FFFBF9;
		border : 1px solid #B2B1AE;
		height: 21px;
   		width: 21px;
   		text-align: center;
	}
	
			
</style>
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<div class="basket-wrap">
		<div class="basket-content">
			<h2>장바구니</h2>
				<div class="order-basket">
					<table class="basket-body">
						<tbody>
							<c:choose>
								<c:when test="${not empty basketList }">
								<!-- 장바구니 상품 추가될 때마다 반복될 테이블 -->
									<c:forEach var="item" items="${basketList }">
										<input type="hidden" name="item_product_id" value="${item.product_id }">
										<input type="hidden" name="item_size_num" 	value="${item.size_num }">
										<input type="hidden" name="kor_name"		value="${item.kor_name }">
										<input type="hidden" name="small_image" 	value="${item.s_file_path }">
										<input type="hidden" name="pd_size" 		value="${item.pd_size }">
										<input type="hidden" name="color" 			value="${item.color }">
										<input type="hidden" name="stock"		id="stock"	value="${item.stock }">
										
										<tr id="tr${item.product_id }_${item.size_num }">
											<td>
												<input type="checkbox" name="rowCheck" value="${item.product_id },${item.size_num}" id="${item.product_id },${item.size_num}">
											</td>
											<td class="pd_img">
												<a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${item.product_id }&gender=${item.gender}">
													<img src="${item.s_file_path }" width="100px">
												</a>
											</td>
											<td class="item_info">
												<span class="item-name">${item.kor_name}</span><br><br>
												<span>${item.pd_size}<br></span>
												<span class="item-color">${item.color }</span>
											</td>
											<td>
												<input type="button" class="countBtn" value="-" onclick="minusCnt(${item.product_id}, ${item.size_num })">
												<input type="hidden" value="${item.price }" name="price" id="price${item.product_id}_${item.size_num}">
												<input type="text" value="${item.cnt }" name="cnt" id="cnt${item.product_id }_${item.size_num}" min="1" max="99" style="width:15px;">
												<input type="button" class="countBtn" value="+" onclick="plusCnt(${item.product_id}, ${item.size_num })">
											</td>
											<td id="sum${item.product_id }_${item.size_num}" class="sumProduct">
												${item.price * item.cnt }원
											</td>
											<td>
												<input type="button" value="바로구매" class="orderBtn" onclick="goDirectOrder(${item.product_id}, ${item.size_num })"><br><br>
												<input type="button" value="삭제" class="deleteBtn" onclick="delItem(${item.product_id}, ${item.size_num })">
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:when test="${empty basketList}">
									<tr>
										<td>
											장바구니가 비어있습니다.
										</td>
									</tr>
								</c:when>
							</c:choose>
						</tbody>
					</table> <!-- .basket-body table 끝 -->
						
						<c:if test="${not empty basketList}">
							<!-- 장바구니에 상품이 있을때 (not empty) 만 삭제 버튼을 보여줌 -->
							<div class="order-delete-btn">
								<input type="button" value="선택 삭제" id="delChk" onclick="delChkItem()">
							</div>
						
							<!-- 장바구니에 상품이 있을때 (null이 아닐 때) 만 결제 예정 금액을 보여줌 -->
							<div class="price-cal">
								<table class="cal-tbl">
									<tr class="cal-text"><td>결제 예정 금액</td></tr>
									<tr><td id="total">원</td></tr>
								</table>
							</div>
						
							<div class="buy-btn">
								<input type="button" class="shopBtn" value="계속 쇼핑하기" onclick="location.href='../index.jsp'">
								<input type="button" class="orderAll" value="전체 상품 주문하기" onclick="location.href='${pageContext.request.contextPath }/orders/goToOrderInfo.do'">
							</div>
						
							<div class="buy-notice">
								<div class="notice-contents">
									<div class="notice_title">상품 주문 전 꼭 확인해 주세요!</div><br>
									<div class="notice_p">
										<p>매장에서 발송되는 경우 온라인 물류센터 상품보다 평균 배송기간이 2~3일 정도 더 소요될 수 있습니다.<br><br>
										주문과 관련된 정보는 주문 완료 후 ‘마이페이지 > 최근 주문내역’에서 확인 가능합니다.<br><br>
										배송비는 무료로 제공해드리고 있습니다.<br><br>
										2개 이상의 상품 주문 시 재고 여부에 따라 분리 발송될 수 있습니다.</p>
									</div>
								</div>
							</div>
						</c:if> 
		</div> <!-- order-basket 끝-->
	</div> <!-- basket-content 끝 -->
		
		<div class="basket-view">
		<c:choose>
			<c:when test="${not empty likeProList }">
	      		<div class="like_title">
	      			<a href="${pageContext.request.contextPath }/mypage/likeProList.do">찜한 상품</a> 
	      		</div>
      			<table class="likeTbl">
					<tr>
			      		<c:forEach var="like" items="${likeProList }" begin="0" end="3">
							<td>
								<a href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${like.product_id }&gender=${like.gender}">
								<img src="${like.s_file_path }" width="230px"></a><br><br>
								<span class="like_brand">${like.brand }</span><br>
								<span class="like_name">${like.kor_name }</span><br>
								<span class="like_price">${like.price }원</span>
							</td>
			     		 </c:forEach>
					</tr>		      			
      			</table>
			</c:when>
			<c:when test="${empty likeProList }">
				<div class="like_title"> 찜한 상품 </div>
				<table class="no_like_tbl">
					<tr>
						<td class="no_like">
							찜한 목록이 없습니다.
						</td>
					</tr>
				</table>
			</c:when>
		</c:choose>
		
		</div> <!-- basket view 끝 -->
	</div> <!-- basket wrap 끝 -->
	
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
  	</div>
	
</body>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	// 화면 로딩될때 가격 계산도 해줘
	$(function(){
		calcTotal()
	})
	
	
	// 상품 수량 증가 함수
	function plusCnt(prod_id, size_num) {
		
		let stock = document.getElementById("stock").value;
		//상품 수량을 가져와야함
		let target = document.getElementById("cnt"+prod_id+"_"+size_num)
		let count = parseInt(target.value)
		
		//상품 최대 수량 설정
		if (count >= stock) {
			alert("최대 수량을 초과했습니다.");
			return false;
		}
		
		//상품 수량을 수정 (+1)
		count++;
		//변경된 수량을 반영
		target.value = count
		
		location.href="${pageContext.request.contextPath }/basket/updateBasketCnt.do?product_id="+prod_id+"&cnt="+count+"&size_num="+size_num
		
		//소계 계산
		//calcSum(prod_id)
	}
	
	// 상품 수량 감소 함수
	function minusCnt(prod_id, size_num) {
		
		//상품 수량을 가져와야함
		let target = document.getElementById("cnt"+prod_id+"_"+size_num)
		let count = parseInt(target.value)
		
		//상품 최소 수량 설정
		if (count <= 1) {
			alert("최소 1개이상 담아주세요");
			return false;
		}
		
		//상품 수량을 수정 (-1)
		count--;
		//변경된 수량을 반영
		target.value = count
		
		location.href="${pageContext.request.contextPath }/basket/updateBasketCnt.do?product_id="+prod_id+"&cnt="+count+"&size_num="+size_num
		
		//소계 계산
		//calcSum(prod_id)
	}
	
	// 상품 수량*원가 계산 함수
	function calcSum(prod_id, size_num) {
		
		//상품 수량 가져오기
		let targetCnt = document.getElementById("cnt"+prod_id+"_"+size_num).value
		//상품 단가 가져오기
		let targetPrice = document.getElementById("price"+prod_id+"_"+size_num).value
		// 수량*단가를 반영하기
		let targetSumTd = document.getElementById("sum"+prod_id+"_"+size_num)
		targetSumTd.innerHTML = targetCnt*targetPrice + "원"
		// 합계에 반영
		calcTotal()
	}

	// 장바구니에 담긴 모든 상품 계산
	function calcTotal() {
		//장바구니에 값이 없으면 계산안함
		<c:if test="${empty basketList }">
			return false	
		</c:if>
		
		// 모든 소계를 가져와야함
		let targetSumArr = document.getElementsByClassName("sumProduct")
		
		// 모든 소계 합산
		let result = 0;
		for ( let i = 0 ; i < targetSumArr.length ; i++){
			let str = targetSumArr[i].innerHTML
			result += parseInt(str.substring(0,str.length-1))
		}
		// 합산 가격 반영
		
		let targetTotal = document.getElementById("total");
		targetTotal.innerHTML = result + "원"
	}
	
	// 단건 [상품 삭제] 함수
	function delItem(prod_id, size_num) {
		
		if(!confirm("상품을 삭제하시겠습니까?")){
			alert("상품 삭제가 취소되었습니다.");
		} else {
			alert("상품이 삭제되었습니다.")
			location.href='${pageContext.request.contextPath }/basket/deleteBasketItem.do?product_id='+prod_id+'&size_num='+size_num
			}
	}
	
	// [바로구매] 함수
	function goDirectOrder(prod_id, size_num) {
		
		let cnt = document.getElementById("cnt"+prod_id+"_"+size_num).value
		
		let str = 'product_id='+prod_id+'&size_num='+size_num+'&cnt='+cnt
		location.href='${pageContext.request.contextPath }/orders/ordersPageDirect.do?'+str
		
	}
	
	// [선택삭제] 함수
  	function delChkItem() {
  		
  		let target = $("input[name='rowCheck']:checked"); // rowCheck라는 name의 선택된 checkbox를 target배열로 지정
  		let chkCnt = target.length;			// chkCnt는 target의 길이
  		if(chkCnt == 0){
  			alert("선택된 상품이 없습니다.")
  			return false;	// 선택된 상품이 없는데 삭제를 눌렀을 경우 함수 종료
  		}
  		
  		if(!confirm("선택한 상품을 삭제하시겠습니까?")){
			alert("상품 삭제가 취소되었습니다.");
			return false;	// 취소를 눌렀을 경우 함수 종료
		}
  		
 
  		// [확인] 눌렀을 경우
  		// 가지고 와야하는 값이 2개(product_id, size_num)여서 rowcheck의 value에 ,를 사용하여 두 값을 넣어둠
  		// 두개의 값을 가져갈 때 가능한 방법 : 배열로 가져가거나 / String으로 가져가서 ,를 후에 제거하기 
  		// 두번째 방법 선택
  		let chkStr = '';	
  		for( let i=0; i<chkCnt ; i++) {
  			// 선택된 checkbox의 수만큼 value를 가져가야하므로 for문 사용
  			chkStr += $(target).eq(i).val()		// target 배열의 .eq(i) : 인덱스 번호에 따른 .val() : value값을 chkStr에 넣음 
  			if( i != chkCnt-1 ) {	// 체크된 value를 모두 가져오고 마지막 값이 ,로 끝나지 않기 위해 -1
  				chkStr += ',';		// ,로 가져온 값들을 구분 짓기 위해 
  			}
  			
  		}
  		
		console.log(chkStr);
		location.href='${pageContext.request.contextPath }/basket/deleteChkBasketItem.do?chkStr='+chkStr
		// String 상태가 된 chkStr을 가지고 체크된 Basket 상품을 삭제하는 서비스로 이동
		 		
  	}
 	
</script>
</html>