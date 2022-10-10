<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="../js/jquery.js"></script>
<script type="text/javascript">
	
	function buyNowPro() {
		var sizeArray = [];
		var numberArray = [];
//		var size = $('.size_select option:selected').val();
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



<h1>선택하신 상품 : ${buyNowList[0].kor_name }</h1>
<h1 style="font-weight: bold">사이즈를 선택하세요</h1><br>
<div class="style_size" style="display: inline-block;">
	<c:forEach var="buyNowList" items="${buyNowList }">
		<c:if test="${buyNowList.stock > 0 }">
			<label for="${buyNowList.size_num }">
			<input type="radio" name="size_radio" id="${buyNowList.size_num }" class="size_radio" required="required" value="${buyNowList.size_num }">${buyNowList.pd_size }
			</label><br>
		</c:if>
		<c:if test="${buyNowList.stock <= 0 }">
			<input type="radio" name="size_radio" id="${buyNowList.size_num }" class="size_radio" value="${buyNowList.size_num }" disabled="disabled">${buyNowList.pd_size } [품절]
			<br>
		</c:if>
		<input type="hidden" id="buyNowPro_product_id" name="buyNowPro_product_id" value="${buyNowList.product_id }">
	</c:forEach>
	<br><br>
	
</div>
<br>
<button class="custom-btn btn-close" onclick="buyNowPro()">구매하기</button>
