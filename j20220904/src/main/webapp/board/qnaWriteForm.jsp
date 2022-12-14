 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 Q&amp;A 작성</title>
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
					<h3 class="text-head2">상품 Q&amp;A 작성</h3>
				</div>
				<div class="aside-contents" align="center">
					<form action="${pageContext.request.contextPath}/board/qnaWritePro.do?product_id=${product_id}&gender=${gender}&show=qna#big_product_3" method="post">
						<input type="hidden" name="q_id" value="${q_id}">
						<input type="hidden" name="mem_id" value="${mem_id }">
						<input type="hidden" name="product_id" value="${product_id }">
						<div class="flex-box board-view-head">
							<span class="q-title"><input type="text" name="q_title" required="required" placeholder="제목을 입력하세요"></span>
							<span class="q-date">${qABoard.q_date}</span>
							<span class="q-mem">${qABoard.mem_id}</span>
						</div>
						<div class="board-view-cont">
							<div class="question-box">
								<pre><textarea rows="10" cols="40" name="q_content" required="required" placeholder="내용을 입력하세요"></textarea></pre>
							</div>
						</div>
						<div class="btn-wrap text-right">
							<input class="btn btn-dialog" type="submit" value="확인">
							<input class="btn btn-dialog" type="reset" value="모두 지우기">
							<a href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${product_id}&gender=${gender}&show=qna#big_product_3" class="btn btn-dialog">목록</a>
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