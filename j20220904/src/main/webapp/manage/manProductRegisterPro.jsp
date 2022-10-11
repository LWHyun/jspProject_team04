<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<script type="text/javascript">
		alert("등록 완료");
		loaction.href = "manProductList.do";
	</script>


<%-- <c:if test="${result == 0}">
	<script type="text/javascript">
		alert("오류가 발생했습니다. 다시 작성해주세욥");
		location.href = "manProductRegister.do";
	</script>
</c:if> --%>
</body>
</html>