<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 리뷰 수정</title>
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
					<h3 class="text-head2">상품 리뷰 수정</h3>
				</div>
				<div class="aside-contents" align="center">
					<form action="reviewUpdatePro.do" method="post">
						<input type="hidden" name="product_id" value="${reviewBoard.product_id }" >
						<input type="hidden" name="pageNum" value="${pageNum }">
						<input type="hidden" name="rb_date" value="${reviewBoard.rb_date }">
						<div class="flex-box board-view-head">
							<span class="rb-title"><input type="text" name="rb_title" required="required" value="${reviewBoard.rb_title }"></span>
							<span class="rb-date">${reviewBoard.rb_date}</span>
							<span class="rb-mem">${reviewBoard.mem_id}</span>
						</div>
						<div class="board-view-cont">
							<div class="question-box">
								<pre><textarea rows="10" cols="40" name="rb_content" required="required">${reviewBoard.rb_content }</textarea></pre>
							</div>
						</div>
						<div class="btn-wrap text-right">
							<input class="btn btn-dialog" type="submit" value="확인">
							<input class="btn btn-dialog" type="reset" value="취소">
						</div>
					</form>
				</div>
				
				<div class="btn-wrap text-right">
					<a href="#" class="btn btn-dialog">수정</a>
					<a href="#" class="btn btn-dialog">삭제</a>
					<a href="reviewBoard.do?$pageNum=${pageNum}" class="btn btn-dialog">목록</a>
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