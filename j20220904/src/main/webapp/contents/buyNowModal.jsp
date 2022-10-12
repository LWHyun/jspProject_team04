<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">

function buyNowPro() {
	var sizeArray = [];
	var numberArray = [];
//	var size = $('.size_select option:selected').val();
	var size = $('input[name=size_radio]:checked').val();
	var product_id = document.getElementById('buyNowPro_product_id').value;
	var number = 1;
	sizeArray.push(size);
	numberArray.push(number);
	console.log(size);
	console.log(product_id);
	console.log(number);
	console.log(sizeArray);
	console.log(numberArray);
	if($('input[name="size_radio"]').is(':checked')==false){
		alert("사이즈를 선택해주세요");
	}else{
		location.href = "${pageContext.request.contextPath}/orders/ordersDirectProduct.do?size_num="+sizeArray+"&product_id="+product_id+"&number="+numberArray;	
	}
	
};
	
</script>
</head>
<body>

	<h1>선택하신 상품 : ${bist[0].kor_name }</h1>
<h1 style="font-weight: bold">사이즈를 선택하세요</h1><br>
<div class="style_size" style="display: inline-block;">
	<c:forEach var="bist" items="${bist }">
		<c:if test="${bist.stock > 0 }">
			<label for="${bist.size_num }">
			<input type="radio" name="size_radio" id="${bist.size_num }" class="size_radio" required="required" value="${bist.size_num }">${bist.pd_size }
			</label><br>
		</c:if>
		<c:if test="${bist.stock <= 0 }">
			<input type="radio" name="size_radio" id="${bist.size_num }" class="size_radio" value="${bist.size_num }" disabled="disabled">${bist.pd_size } [품절]
			<br>
		</c:if>
		<input type="hidden" id="buyNowPro_product_id" name="buyNowPro_product_id" value="${bist.product_id }">
	</c:forEach>
	<br><br>
	
</div>
<br>
<button class="custom-btn btn-close" onclick="buyNowPro()">구매하기</button>


</body>
</html>