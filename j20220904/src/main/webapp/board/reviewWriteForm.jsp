<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
					<h3 class="text-head2">상품 리뷰 작성</h3>
				</div>
				<div class="aside-contents" align="center">
					<form action="reviewWritePro.do?pageNum=${pageNum}" method="post">
						<input type="hidden" name="rb_id" value="${rb_id}">
						
						<div class="flex-box board-view-head">
							<span class="rb-title"><input type="text" name="rb_title" required="required" placeholder="제목을 입력하세요"></span>
						</div>
						<div class="board-view-cont">
							<div class="question-box">
								<pre><textarea rows="10" cols="40" name="rb_content" required="required" placeholder="내용을 입력하세요"></textarea></pre>
							</div>
						</div>
						<div class="btn-wrap text-right">
							<input class="btn btn-dialog" type="submit" value="확인">
							<input class="btn btn-dialog" type="reset" value="모두 지우기">
							<a href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${product_id}&gender=${gender}&show=review#big_product_2" class="btn btn-dialog">목록</a>
						</div>
					</form>
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