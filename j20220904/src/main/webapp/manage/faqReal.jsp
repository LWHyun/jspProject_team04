<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script type="text/javascript">
	$(function() {
		$('#delivery').click(function() {
			$.ajax({
					url : 'delivery.jsp',
					dataType: 'html',
					success : function(data) {
								$('#contents').html(data)
							}
			})
		})
	})
	
	$(function() {
		$('#refund').click(function() {
			$.ajax({
					url : 'refund.jsp',
					dataType: 'html',
					success : function(data) {
								$('#contents').html(data)
							}
			})
		})
	})
	
	$('a').click(function() {
		toggleClass(".active-color");
	})
</script>
</head>
<body>
	<div class="contents-inner">
		<h2 class="text-head1 text-left">고객센터</h2>
		
		<div class="aside-wrap">
			<ol class="customer-lnb">
				<li><a href="#">FAQ</a></li>
				<li><a href="#">공지사항</a></li>
			</ol>
		</div>
		
		<div class="aside-contents" align="center">
			<h3>FAQ</h3>
			
<!-- 			<div class="border-line-box gray-box tbl-search-wrap">
					<table>
						<colgroup>
							<col style="width: 105px;">
							<col>
							<col style="width: 114px;">
						</colgroup>
						<tbody>
							<tr>
								<th scope="row">
									<label for="searchValue">FAQ 검색</label>
								</th>
								<td class="input-wrap">
									<input id="searchValue" name="searchValue" type="text" placeholder="궁금한 내용을 입력해주세요.">
								</td>
								<td><button id="btnSearchFaq" type="button" class="btn btn-sm" >검색</button></tr>
						</tbody>
					</table>
			</div> -->
			
			<div>
				<table>
					<tr>
						<td id="delivery">배송현황</td>
						<td id='refund'>교환 / 반품 / 환불</td>
						<td onclick="location.href='order.jsp'">주문 / 결제 / 취소</td>
						<td onclick="location.href='as.jsp'">A/S</td>
						<td onclick="location.href='customerInfo.jsp'">회원정보</td>
					</tr>
				</table>
				
				<span id="contents"></span>
			</div>		
		</div>
	</div>
	


</body>
</html>
