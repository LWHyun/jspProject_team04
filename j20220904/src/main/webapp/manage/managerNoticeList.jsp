<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="style.css" type="text/css">
<style type="text/css"> 
	table {
		width: 100%;
	}
</style></head>
<body>
   <h1>공지사항</h1>
	<table>
		<tr>
			<td><a href="noticeWriteForm.do">글 쓰기</a></td>
		</tr>
	</table>
	<table>
		<tr>
			<th>번호</th><th>제목</th><th>작성일</th>
		</tr>
<%-- 		<c:set var="numbering"      value="{(currentPage-1)*10 +1}"/> --%>		
        <c:if test="${totCnt > 0 }">
			<c:forEach var="board" items="${list }">
				<tr>
				<%-- 	<td>${numbering }</td> --%>
					<td>${startNum }</td>  
					<td class="left" width=200>
					        <c:if test="${board.readcount > 20}">
							    <img src='images/hot.gif' onmouseover="getDeptName(${board.num})">
						   </c:if>
						    <c:if test="${board.re_level > 0}">
						       	<img src='images/level.gif' width="${board.re_level*10}"> 
					        	<img src='images/re.gif'>
						   </c:if>
						 <a href='content.do?num=${board.num}&pageNum=${currentPage}'>
							${board.notice_title}</a>
					</td>
					<td>${board.reg_date}</td>
				</tr>
				<c:set var="startNum" value="${startNum - 1 }" />
			</c:forEach>
		</c:if>
	</table>
	
	<div style="text-align: center;">
		<c:if test="${startPage > blockSize }">
			<a href='list.do?pageNum=${startPage-blockSize}'>[이전]</a>
		</c:if>
		<c:forEach var="i" begin="${startPage}" end="${endPage}">
			<a href='list.do?pageNum=${i}'>[${i}]</a>
		</c:forEach>
		<c:if test="${endPage < pageCnt }">
			<a href='list.do?pageNum=${startPage+blockSize}'>[다음]</a>
		</c:if>
	</div>	
</body>
</html>