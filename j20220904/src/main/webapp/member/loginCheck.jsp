<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${empty sessionScope.mem_id }">
	<script>
		location.href="${pageContext.request.contextPath}/member/loginForm.do";
	</script>
</c:if>