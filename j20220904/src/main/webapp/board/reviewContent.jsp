<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰</title>
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
					<h3 class="text-head2">상품 리뷰</h3>
				</div>
				
				<div class="flex-box board-view-head">
					<span class="rb-title">${reviewBoard.rb_title }</span>
					<span class="rb-date">${reviewBoard.rb_date}</span>
					<span class="rb-mem">${reviewBoard.mem_id}</span>
				</div>
				<div class="board-view-cont">
					<div class="question-box">
						<pre>${reviewBoard.rb_content}</pre>
					</div>
					<!-- 이미지 넣을 예정 -->
				</div>
				<div class="btn-wrap text-right">
					<a href="reviewUpdateForm.do?rb_id=${rb_id}" class="btn btn-dialog">수정</a>
					<a href="#" class="btn btn-dialog">삭제</a>
					<a href="javascript:history.back();" class="btn btn-dialog">목록</a>
				</div>
			</div>
		</div>
	</div>
			
	<!-- 푸터 -->
	<div id="footer">
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>