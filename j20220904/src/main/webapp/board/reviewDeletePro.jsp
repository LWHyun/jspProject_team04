<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
	alert("삭제 완료");
	location.href = "${pageContext.request.contextPath}/contents/contents_men.do?product_id=${product_id}&gender=${gender}&show=review#big_product_2";
</script>
</body>
</html>