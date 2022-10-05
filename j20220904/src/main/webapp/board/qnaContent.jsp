<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 Q&amp;A</title>
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
					<h3 class="text-head2">상품 Q&amp;A</h3>
				</div>
				
				<div class="flex-box board-view-head">
					<span class="q-title">${qABoard.q_title }</span>
					<span class="q-date">${qABoard.q_date}</span>
					<span class="q-mem">${qABoard.mem_id}</span>
				</div>
				<div class="board-view-cont">
					<div class="question-box">
						<pre>${qABoard.q_content}</pre>
					</div>
					<div class="answer-box">
						<pre>${qABoard.q_answer}</pre>
					</div>
				</div>
				<div class="btn-wrap text-right">
					<a href="#" class="btn btn-dialog">수정</a>
					<a href="#" class="btn btn-dialog">삭제</a>
					<a href="qnaBoard.do?$pageNum=${pageNum}" class="btn btn-dialog">목록</a>
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