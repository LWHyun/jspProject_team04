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
						<form action="qnaDeletePro.do" method="post">
							<input type="hidden" name="pageNum" value="${pageNum }">
							<input type="hidden" name="q_id" value="${q_id }">
							
							<h2 style="margin-bottom: 20px;">글 삭제를 원하시면 <br>아래 칸에 삭제를 입력해주세요.</h2>
							<input type="text" required="required" placeholder="삭제"><p><br>
							<input type="submit" value="확인">
							<button onclick="javascript:history.back();">취소</button>
						</form>
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
</body>
</html>