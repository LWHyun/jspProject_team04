<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${result == 1 }">
	<script>
		alert("회원가입이 완료되었습니다.");
		location.href="${pageContext.request.contextPath}/member/loginForm.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script>
		alert("회원가입에 실패했습니다. 다시 시도해주세요.");
		location.href="${pageContext.request.contextPath}";
	</script>
</c:if>
</body>
</html>