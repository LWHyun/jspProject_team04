<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 공지 삭제</title>
</head>
<link rel="stylesheet" href="../css/manageCss/notice.css">
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
							<li class="customer-lnb-item eng"><a href="#" class="active">공지사항 관리</a></li>
							<li class="customer-lnb-item"><a href="manProductList.do">상품관리</a></li>
							<li class="customer-lnb-item"><a href="manQnaList.do">Q&A 관리</a></li>
						</ol>
					</div>
	
					<!-- 중앙 화면 : 공지사항 목록 -->
					<div class="aside-contents" align="center">
						<h3 class="text-head2 eng">게시글 수정</h3>
						
						  <form action="manNoticeUpdatePro.do" method="post">
							<input type="hidden" name="notice_code" value="${notice.notice_code}">
							<input type="hidden" name="pageNum" value="${pageNum}">
							<table border="1" style="margin-top:100px; margin-left: 50px;">
								<tr>
									<td>번호</td>
									<td style="text-align: left;">${notice.notice_code}</td>
								</tr>
								<tr>
									<td>제목</td>
							    	<td style="text-align: left;"><input type="text" name="notice_title" required="required" value="${notice.notice_title}"></td>
								</tr>
								<tr>
									<td>내용</td>
							    	<td style="text-align: left;"><pre><textarea rows="10" cols="40" name="notice_content" required="required">${notice.notice_content}</textarea></pre>
							        </td>
							    </tr>
							    <tr>
							    	<td colspan="2"></td>
							    </tr>
							    <tr>
									<td colspan="2">
										<input type="submit" value="확인" >
										<input type="reset"  value="취소">
									</td>
								</tr>
							</table>
							
					  	 </form>
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