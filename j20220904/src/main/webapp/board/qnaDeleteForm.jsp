<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 Q&amp;A 삭제</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
<link rel="stylesheet" href="../css/boardCss/qnaContent.css">
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	<div id="content">
		<div class="qna-content">
			<div class="inner">
				<div class="page-title-wrap">
					<h3 class="text-head2">상품 Q&amp;A 삭제</h3>
				</div>
				
				<div class="board-view-cont">
					<div class="question-box">
						<form method="post" id="qnaDeleteForm">
							<input type="hidden" name="pageNum" value="${pageNum }">
							<input type="hidden" name="q_id" value="${q_id }">
							
							<h2 style="margin-bottom: 20px;">글 삭제를 원하시면 <br>아래 칸에 삭제를 입력해주세요.</h2>
							<input type="text" id="deleteInput" placeholder="삭제를 입력해주세요"><p><br>
						</form>
							<button type="button" id="deleteBtn">확인</button>
							<button type="button" id="cancelBtn">취소</button>
					</div>
				</div>
				<%-- <div class="btn-wrap text-right">
					<a href="qnaUpdateForm.do?q_id=${q_id}" class="btn btn-dialog">수정</a>
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
			$('#qnaDeleteForm').attr("action", "${pageContext.request.contextPath}/board/qnaDeletePro.do?product_id=${product_id}&gender=${gender}&q_id=${q_id}&show=qna#big_product_3");
			$('#qnaDeleteForm').submit();
		}else {
			alert("삭제를 원하실 경우 '삭제'를 입력해주세요.");
		}
	});
	
	// 취소버튼
	$('#cancelBtn').click(function() {
		location.href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${product_id}&gender=${gender}&show=qna#big_product_3";
	});
});
</script>
</body>
</html>