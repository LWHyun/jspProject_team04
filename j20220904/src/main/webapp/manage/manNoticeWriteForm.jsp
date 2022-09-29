<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<form action="noticeWritePro.do?pageNum=${pageNum}" method="post">
		<input type="hidden" name="num" value="${num}">
		<table>
			<caption>
				<h2>공지사항 작성</h2>
			</caption>
			<tr>
				<td>제목</td>
				<td>
					<input type="text" name="subject" required="required">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="10" cols="30" name="content"
						required="required"></textarea></td>
			</tr>
		</table>
		<input type="submit" value="확인">
		<input type="reset" value="모두 지우기">
	</form>
</body>
</html>