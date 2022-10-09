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
				
	.basket-wrap td {
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
			
	.basket-view {
					margin-top : 30px;
	}		
			
			
	/* 이하 최근 본 상품, 찜한 상품 tab관련 css		 */
			
	.documentation {
		   				 color: #fd264f;
					}
		
	button:focus,
	input:focus,
	textarea:focus,
	select:focus {
		  			outline: none; 
		  		}
		
	.tabs {
			  display: block;
			  display: -webkit-flex;
			  display: -moz-flex;
			  display: flex;
			  -webkit-flex-wrap: wrap;
			  -moz-flex-wrap: wrap;
			  flex-wrap: wrap;
			  margin: 0;
		  	  overflow: hidden; 
		  }
	.tabs [class^="tab"] label,
	.tabs [class*=" tab"] label {
								    color: black;
								    cursor: pointer;
								    display: block;
								    font-size: 1.1em;
								    font-weight: 300;
								    line-height: 1em;
								    padding: 2rem 0;
								    text-align: center; 
								 }
		 	.tabs [class^="tab"] [type="radio"],
		  .tabs [class*=" tab"] [type="radio"] {
		    border-bottom: 1px solid rgba(239, 237, 239, 0.5);
		    cursor: pointer;
		    -webkit-appearance: none;
		    -moz-appearance: none;
		    appearance: none;
		    display: block;
		    width: 100%;
		    -webkit-transition: all 0.3s ease-in-out;
		    -moz-transition: all 0.3s ease-in-out;
		    -o-transition: all 0.3s ease-in-out;
		    transition: all 0.3s ease-in-out; }
		    .tabs [class^="tab"] [type="radio"]:hover, .tabs [class^="tab"] [type="radio"]:focus,
		    .tabs [class*=" tab"] [type="radio"]:hover,
		    .tabs [class*=" tab"] [type="radio"]:focus {
		      border-bottom: 1px solid black; }
		    .tabs [class^="tab"] [type="radio"]:checked,
		    .tabs [class*=" tab"] [type="radio"]:checked {
		      border-bottom: 2px solid black; }
		    .tabs [class^="tab"] [type="radio"]:checked + div,
		    .tabs [class*=" tab"] [type="radio"]:checked + div {
		      opacity: 1; }
		    .tabs [class^="tab"] [type="radio"] + div,
		    .tabs [class*=" tab"] [type="radio"] + div {
		      display: block;
		      opacity: 0;
		      padding: 2rem 0;
		      width: 90%;
		      -webkit-transition: all 0.3s ease-in-out;
		      -moz-transition: all 0.3s ease-in-out;
		      -o-transition: all 0.3s ease-in-out;
		      transition: all 0.3s ease-in-out; }
		  .tabs .tab-2 {
		    width: 50%; }
		    .tabs .tab-2 [type="radio"] + div {
		      width: 200%;
		      margin-left: 200%; }
		    .tabs .tab-2 [type="radio"]:checked + div {
		      margin-left: 0; }
		    .tabs .tab-2:last-child [type="radio"] + div {
		      margin-left: 100%; }
		    .tabs .tab-2:last-child [type="radio"]:checked + div {
		      margin-left: -100%; }
					
			
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
										<input type="hidden" name="item_size_num" value="${item.size_num }">
										
										<tr id="tr${item.product_id }_${item.size_num }">
											<td><input type="checkbox" name="rowCheck" value="${item.product_id },${item.size_num}" id="${item.product_id },${item.size_num}"checked></td>
											
											<td class="pd_img"><input type="hidden" name="small_image" value=${item.s_file_path }><img src="${item.s_file_path }" width="100px"></td>
											
											<td class="item_info"><span class="item-name"><input type="hidden" name="kor_name" value=${item.kor_name }>${item.kor_name}</span><br><br><span><input type="hidden" name="pd_size" value=${item.pd_size }>${item.pd_size}<br></span><span class="item-color"><input type="hidden" name="color" value=${item.color }>${item.color }</span></td>
											<td><input type="button" value="-" onclick="minusCnt(${item.product_id}, ${item.size_num })">
												<input type="hidden" value="${item.price }" name="price" id="price${item.product_id}_${item.size_num}">
												<input type="text" value="${item.cnt }" name="cnt" id="cnt${item.product_id }_${item.size_num}" min="1" max="99" style="width:15px;">
												<input type="button" value="+" onclick="plusCnt(${item.product_id}, ${item.size_num })"></td>
											
											<td id="sum${item.product_id }_${item.size_num}" class="sumProduct">${item.price * item.cnt }원</td>
											
											<td><input type="button" value="바로구매" onclick="goDirectOrder(${item.product_id}, ${item.size_num })"><br><br>
												<input type="button" value="삭제" onclick="delItem(${item.product_id}, ${item.size_num })"></td>
										</tr>
									
									</c:forEach>
								</c:when>
								
								<c:when test="${empty basketList}">
									<tr>
										<td>장바구니가 비어있습니다.</td>
									</tr>
								</c:when>
							</c:choose>
						</tbody>
					</table>
						
						<c:if test="${not empty basketList}">
						<!-- 장바구니에 상품이 있을때 (null이 아닐 때) 만 삭제 버튼을 보여줌 -->
							<div class="order-delete-btn">
								<input type="button" value="선택 삭제" id="delChk" onclick="delChkItem()">
							</div>
						
						<!-- 장바구니에 상품이 있을때 (null이 아닐 때) 만 결제 예정 금액을 보여줌 -->
							<div class="price-cal">
								<table class="cal-tbl">
									<tr><td>결제 예정 금액</td></tr>
									<tr><td id="total">원</td></tr>
								</table>
							</div>
						
						<div class="buy-btn">
							<input type="button" value="계속 쇼핑하기" onclick="location.href='https://abcmart.a-rt.com/'">
							<input type="button" value="선택 상품 주문하기" onclick="location='../orders/ordersInfo.jsp'">
							<input type="button" value="전체 상품 주문하기" onclick="location.href='${pageContext.request.contextPath }/orders/goToOrderInfo.do'">
						</div>
						
						<div class="buy-notice">
							<div class="notice-contents">
							<h3>상품 주문 전 꼭 확인해 주세요!</h3><br>
							<p>결제는 무통장 입금방식으로만 진행됩니다.</p>
							</div>
						</div>
					</c:if> 
		</div> <!-- order-basket 끝-->
	</div> <!-- basket-content 끝 -->
		
		<div class="basket-view">
		<c:choose>
			<c:when test="${not empty likeProList }">
	      		<c:forEach var="like" items="${likeProList }" begin="0" end="3">
	      			<table class="likeTbl">
						<tr>
							<td><img src="${like.s_file_path }" width="230px"><br><br>
							${like.brand }<br>
							${like.kor_name }<br>
							${like.price }</td>
						</tr>		      			
	      			</table>
	     		 </c:forEach>
			</c:when>
		</c:choose>
		
		
		</div>
	</div>
	
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
  	</div>
	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	// 화면 로딩될때 가격 계산도 해줘
	$(function(){
		calcTotal()
	})
	
	
	// 상품 수량 증가 함수
	function plusCnt(prod_id, size_num) {
		
		//상품 수량을 가져와야함
		let target = document.getElementById("cnt"+prod_id+"_"+size_num)
		let count = parseInt(target.value)
		
		//상품 최대 수량 설정
		if (count >= 99) {
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
</body>
</html>