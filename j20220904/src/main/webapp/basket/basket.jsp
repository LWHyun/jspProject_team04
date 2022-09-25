<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.basket-wrap {	
						padding-left: 150px;
						padding-right: 150px;
		
					}
	
	.basket-body, .cal-tbl {	
					width : 100%;
					margin-top : 30px;
					margin-bottom : 30px;
					border-top: 2px solid black;
					border-bottom: 1px solid black;	
				}
				
			td {
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
	<div class="basket-wrap">
		<div class="basket-content">
			<h2>장바구니</h2>
				<div class="order-count">
					
				</div>
				<div class="order-null" text-align="center">
					<h3>장바구니에 담긴 상품이 없습니다.</h3>
				</div>
				<div class="order-basket">
					
					<div class="tbl-header gray">
						<div class="header-title">
							<span class="eng"> 일반 </span> 
							배송상품
							<span class="prod-cnt"></span>
						</div>
					</div>
					
					<table class="basket-body">
						<caption>일반 배송 상품</caption>
						<tbody>
							<c:forEach var="item" items="${basketList }">
								<tr>
									<td><input type="checkbox" checked></td>
									<td class="pd_img"><img src="images/shoe.jpg" width="100px"></td>
									<td>DAYSOF DUAL THONG<br> MELON </td>
									<td><input type="button" value="-">
										<input type="text" value="${item.cnt }" min="0" style="width:15px;">
										<input type="button" value="+"></td>
									<td>27,000원</td>
									<td><input type="button" value="바로구매"><br><br>
										<input type="button" value="삭제"></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<div class="order-delete-btn">
						<input type="button" value="선택 삭제">
					
					</div>
				</div> 
				<div class="price-cal">
					<table class="cal-tbl">
						<tr><td>결제 예정 금액</td></tr>
						<tr><td>27,000원</td></tr>
					</table>
				</div>
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
</body>
</html>