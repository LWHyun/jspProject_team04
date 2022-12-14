<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 삭제</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../css/boardCss/reviewContent.css">
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	<div id="content">
		<div class="review-content">
			<div class="inner">
				<div class="page-title-wrap">
					<h3 class="text-head2">상품 리뷰 삭제</h3>
				</div>
				
				<div class="board-view-cont">
					<div class="question-box">
						<form method="post" id="reviewDeleteForm">
							<input type="hidden" name="pageNum" value="${pageNum }">
							<input type="hidden" name="rb_id" value="${rb_id }">
							
							<h2 style="margin-bottom: 20px;">글 삭제를 원하시면 <br>아래 칸에 삭제를 입력해주세요.</h2>
							<input type="text" id="deleteInput" placeholder="삭제를 입력해주세요."><p><br>
						</form>
							<button type="button" id="deleteBtn">확인</button>
							<button type="button" id="cancelBtn">취소</button>
					</div>
				</div>
				<%-- <div class="btn-wrap text-right">
					<a href="reviewUpdateForm.do?rb_id=${rb_id}" class="btn btn-dialog">수정</a>
					<a href="#" class="btn btn-dialog">삭제</a>
					<a href="javascript:history.back();" class="btn btn-dialog">목록</a>
				</div> --%>
			</div>
		</div>
	</div>
			
	<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
<script>

$(function() {
	// 삭제버튼
	$('#deleteBtn').click(function() {
		let status = $('#deleteInput').val();
		if(status == '삭제') {
			$('#reviewDeleteForm').attr("action", "${pageContext.request.contextPath}/board/reviewDeletePro.do?product_id=${product_id}&gender=${gender}&rb_id=${rb_id}&show=review#big_product_2");
			$('#reviewDeleteForm').submit();
		}else {
			alert("삭제를 원하실 경우 '삭제'를 입력해주세요.");
		}
	});
	
	// 취소버튼
	$('#cancelBtn').click(function() {
		location.href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${product_id}&gender=${gender}&show=review#big_product_2";
	});
});
</script>
</body>
</html>
