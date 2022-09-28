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
				<div class="order-count">
					
				</div>
			
				<div class="order-basket">
					<table class="basket-body">
						<tbody>
							<!-- 장바구니에 담긴 상품이 없을 때 -->
							<c:if test="${basketList eq null }">
							<tr>
								<td>
								   <div class="order-null" text-align="center">
					             	  <h3>장바구니에 담긴 상품이 없습니다.</h3>
						           </div>
								</td>
							</tr>
							</c:if>
							<!-- 장바구니 상품 추가될 때마다 반복될 테이블 -->
							<c:forEach var="item" items="${basketList }">
								<tr id="tr${item.product_id }">
									<td><input type="checkbox" checked></td>
									<td class="pd_img"><img src="${item.s_file_path }" width="100px"></td>
									
									<td><span class="item-name">${item.kor_name}</span><br><br><span>${item.pd_size}<br></span><span class="item-color">${item.color }</span></td>
									
									<td><input type="button" value="-" onclick="minusCnt(${item.product_id})">
										<input type="hidden" value="${item.price }" id="price${item.product_id}">
										<input type="text" value="${item.cnt }" id="cnt${item.product_id }" min="1" max="99" style="width:15px;">
										<input type="button" value="+" onclick="plusCnt(${item.product_id})"></td>
									
									<td id="sum${item.product_id }" class="sumProduct">${item.price * item.cnt }원</td>
									
									<td><input type="button" value="바로구매"><br><br>
										<input type="button" value="삭제"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<!-- 장바구니에 상품이 있을때 (null이 아닐 때) 만 삭제 버튼을 보여줌 -->
					<c:if test="${basketList ne null }">
						<div class="order-delete-btn">
							<input type="button" value="선택 삭제">
						</div>
					</c:if>
					
				</div> 
				
				<!-- 장바구니에 상품이 있을때 (null이 아닐 때) 만 결제 예정 금액을 보여줌 -->
				<c:if test="${basketList ne null }">
					<div class="price-cal">
						<table class="cal-tbl">
							<tr><td>결제 예정 금액</td></tr>
							<tr><td id="total">원</td></tr>
						</table>
					</div>
				</c:if>
				
				<div class="buy-btn">
					<input type="button" value="계속 쇼핑하기" onclick="location.href='https://abcmart.a-rt.com/'">
					<input type="button" value="선택 상품 주문하기" onclick="location='orderInfo.jsp'">
					<input type="button" value="전체 상품 주문하기" onclick="location='orderInfo.jsp'">
				</div>
				
				<div class="buy-notice">
					<div class="notice-contents">
					<h3>상품 주문 전 꼭 확인해 주세요!</h3><br>
					<p>결제는 무통장 입금방식으로만 진행됩니다.</p>
					</div>
				</div>
		</div>
		<div class="basket-view">
		
		<!-- tab 관련 html코드 -->
			<div class="tabs">
			  <div class="tab-2">
			    <label for="tab2-1">최근 본 상품</label> <!-- 첫번째 탭 이름 -->
			    <input id="tab2-1" name="tabs-two" type="radio" checked="checked">
			    <div>
			      <h4>최근 본 상품 이미지</h4>
			    </div>
			  </div>
			  <div class="tab-2">
			    <label for="tab2-2">내가 찜한 상품</label> <!-- 두번째 탭 이름 -->
			    <input id="tab2-2" name="tabs-two" type="radio">
			    <div>
			      <h4>찜한 상품 이미지</h4>
			    </div>
			  </div>
			</div>
		<!-- tab 관련 html코드 끝-->
		
		</div>
	</div>
	
	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script type="text/javascript">
	
	// 화면 로딩될때 가격 계산도 해줘
	$(function(){
		calcTotal()
	})
	
	function plusCnt(prod_id) {
		
		//상품 수량을 가져와야함
		let target = document.getElementById("cnt"+prod_id)
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
		
		location.href="${pageContext.request.contextPath }/basket/updateBasketCnt.do?product_id="+prod_id+"&cnt="+count
		
		//소계 계산
		//calcSum(prod_id)
	
	}
	
	
	function minusCnt(prod_id) {
		
		//상품 수량을 가져와야함
		let target = document.getElementById("cnt"+prod_id)
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
		
		location.href="${pageContext.request.contextPath }/basket/updateBasketCnt.do?product_id="+prod_id+"&cnt="+count
		
		//소계 계산
		//calcSum(prod_id)
	}
	
	
	function calcSum(prod_id) {
		
		//상품 수량 가져오기
		let targetCnt = document.getElementById("cnt"+prod_id).value
		//상품 단가 가져오기
		let targetPrice = document.getElementById("price"+prod_id).value
		// 수량*단가를 반영하기
		let targetSumTd = document.getElementById("sum"+prod_id)
		targetSumTd.innerHTML = targetCnt*targetPrice + "원"
		// 합계에 반영
		calcTotal()
	}

	
	function calcTotal() {
		//장바구니에 값이 없으면 계산안함
		<c:if test="${basketList eq null }">
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
		
		let targetTotal = document.getElementById("total")
		targetTotal.innerHTML = result + "원"
	}
	
</script>
</body>
</html>