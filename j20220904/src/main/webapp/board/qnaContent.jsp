<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr><td>제목</td><td>${board.q_title}</td></tr>
		<tr><td>작성자</td><td>${board.mem_id}</td></tr>
		<tr><td>작성일</td><td>${board.q_date}</td></tr>
		<tr><td>조회수</td><td>${board.q_views}</td></tr>
		<tr><td>내용</td><td><pre>${board.q_content}</pre></td></tr>
	</table>
</body>
</html>