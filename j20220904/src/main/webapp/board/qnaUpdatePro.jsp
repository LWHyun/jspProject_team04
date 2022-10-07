<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 Q&amp;A 수정 결과</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("수정 완료 !");
			location.href="${pageContext.request.contextPath}/contents/contents_men.do?product_id=${product_id}&gender=${gender}&show=qna#big_product_3";
		</script>
	</c:if>
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("수정되지 않았습니다.");
			location.href="qnaUpdateForm.do?q_id=${q_id}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>