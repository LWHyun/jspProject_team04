<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문완료</title>
<style type="text/css">

.buycomp {

			text-align: center;
}

.order-comp {	
						margin-top: 40px;
						padding-left: 150px;
						padding-right: 150px;
		
			}
			
.order-comp h1 {
	font-size: 32px;
	font-weight: bold;
}		
			
.buy_1	{
	font-size: 32px;
	font-weight: bold;
}

.buy_2{
	font-size: 18px;
	font-weight:  500;
}


.pricechk {
	width: 300px;
	margin: 0 auto;
	margin-top: 30px;
	font-size: 20px;
	
}

	
.price	{
	
}

.price_won{
	color:red;
	
}
.input_a{
	width: 420px;
 	margin: 0 auto;
 	display: flex;
    flex-direction: row;
    flex-wrap: nowrap;
    align-content: center;
    justify-content: space-between;
    align-items: center;
    margin-top: 50px;
}

.white{
	border: 1px solid black;
	width: 200px;
	height: 60px;
	color: black;
	background-color: white;
	font-size: 18px;
	font-weight: bold;
}

.black{
	border: 1px solid black;
	width: 200px;
	height: 60px;
	color: white;
	background-color: black;
	font-size: 18px;
	font-weight: bold;
	
}			
					
</style>
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
	<div class="order-comp">
		<h1>주문완료</h1>
		<div class="buycomp">
			<img alt="buycheck" src="/j20220904/img/order/buy.png" width="80px"><br><br>
			<div class="buy_1">주문이 정상적으로 접수되었습니다.</div><br><br>
			<div class="buy_2">구매해주셔서 감사합니다.</div><br><br>
		</div>
	
	<!-- 	<div class="price_a">
			<table class="pricechk">
				<tr class="pricechk1">
					<td class="price">결제금액: </td>
					<td class="price_won">~~~~원</td>
				</tr>
			</table>
		</div> -->
	</div>
	
	<div class="input_a">
			<input type="button" class="white" value="계속 쇼핑하기" onclick="location.href='http://localhost:8181/j20220904/contents/brandPdList.do?ca_code=10100'">
			<input type="button" class="black" value="구매내역 확인" onclick="location.href='${pageContext.request.contextPath }/mypage/mypage.do'">
	</div>
	
	
	<div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>