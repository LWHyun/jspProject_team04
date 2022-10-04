<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/manageCss/notice.css">
<title>관리자 공지 삭제</title>
</head>
<body>
	<!-- 헤더 -->
	<div id="header">
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

	<!-- 본문 -->
	<div id="contentsWrap" class="contents-wrap">
		<div class="contents-width">
			<div class="contents-inner">

				<!-- 관리자 페이지 -->
				<div class="page-title-wrap mypage">
					<h2 class="text-head1 text-left">관리자 페이지</h2>
				</div>

				<!-- 고객센터 밑 화면 -->
				<div class="contents-inner contents-aside customer-wrap">
					<!-- 왼쪽 선택창 -->
					<div class="aside-wrap">
						<ol class="customer-lnb">
							<li class="customer-lnb-item eng"><a href="manNoticeList.do" class="active">공지사항 관리</a></li>
							<li class="customer-lnb-item"><a href="manProductList.do">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>

					<!-- 중앙 화면 : 공지사항 삭제 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">공지사항 삭제</h3>
						
						<div style="margin-left: 25%; margin-top: 50px; line-height: 20px;">
							<form action="manNoticeDeletePro.do" method="post">
							 	<input type="hidden" name="pageNum" value="${pageNum }">
							 	<input type="hidden" name="notice_code" value="${notice_code }">
								
								<h2 style="margin-bottom: 20px;">글 삭제를 원하시면 <br>아래 칸에 삭제를 입력해주세요.</h2>
								<input type="text" required="required" placeholder="삭제"><p><br>
								<input type="submit" value="확인">
								<button onclick="location.href='manNoticeList.do'">취소</button>
							</form>
						</div>
					</div>
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