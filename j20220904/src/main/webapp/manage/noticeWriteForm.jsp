<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 작성</title>
<link rel="stylesheet" type="text/css" href="style.css"></head>
<body>
  <form action="writePro.do?pageNum=${pageNum}" method="post">
	<input type="hidden" name="num"       value="${num}">
    <table>
		<caption><h2>공지사항 작성</h2></caption>
		<tr><td>제목</td><td>
		<!-- 최초 글쓰기 -->
		<c:if test="${num == 0}">
			<input type="text" name="subject" required="required" >
		</c:if>	</td></tr>
		<tr><td>내용</td><td><textarea rows="10" cols="30" name="content" 
			required="required"></textarea></td></tr>
		<tr><input type="submit" value="확인"><p>
			<input type="reset" value="다시작성"></tr>
   </table>
 </form>
</body>
</html>