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
	<c:if test="${not empty requestScope.toURI }">
		<script>
			location.href="${requestScope.toURI}";
		</script>	
	</c:if>
	
	<c:if test="${empty requestScope.toURI }">
		<script>
			location.href="${pageContext.request.contextPath}";
		</script>	
	</c:if>
	
</c:if>
<c:if test="${result == 0 }">
	<script>
		alert("아이디 또는 비밀번호가 일치하지 않습니다.");
		location.href="${pageContext.request.contextPath}/member/loginForm.do";
	</script>
</c:if>
</body>
</html>