<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정 결과</title>
</head>
<body>
	<c:if test="${result > 0 }">
		<script type="text/javascript">
			alert("수정 완료 !");
			location.href="manNoticeList.do?pageNum=${pageNum}";
		</script>
	</c:if>	
	<c:if test="${result == 0 }">
		<script type="text/javascript">
			alert("수정되지 않았습니다.");
			location.href="manNoticeUpdateForm.do?num=${num}&pageNum=${pageNum}";
		</script>
	</c:if>
</body>
</html>