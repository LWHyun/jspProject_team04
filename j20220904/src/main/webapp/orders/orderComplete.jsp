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

table {
		border-top : 2px solid black;
		margin : 0 auto;
		width : 75%;
}

td {
		padding : 10px;
}

.order-comp {	
						padding-left: 150px;
						padding-right: 150px;
		
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
	<img alt="buycheck" src="images/buycheck.png" width="100px"><br><br>
	주문이 정상적으로 접수되었습니다.<br>
	입금기한 내에 결제가 완료되지 않는 경우 자동으로 주문이 취소됩니다.<br><br>
	주문번호 2022091396624
	</div>
	<div class="pricechk">
	<table>
		<tr>
			<td>
				결제금액
			</td>
			<td>
				원
			</td>
		</tr>
		<tr>
			<td>
				무통장입금
			</td>
			<td>
				원
			</td>
		</tr>
		<tr>
			<td>
			-NH농협 <br>
			-입금기한 :
			</td>			
		</tr>
	</table>
	</div>
	</div>
	
	<div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>