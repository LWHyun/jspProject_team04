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
<link rel="stylesheet" href="../css/manageCss/faq.css">
<style type="text/css">

</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<style type="text/css"> 
	table {
		width: 100%;
	}
</style></head>
<body>
   <h1>공지사항</h1>
   
   <!--헤더 -->
   <div id="header">
     <jsp:include page="../main/header.jsp"></jsp:include>
   </div>
   
   
   <div id="contentsWrap" class="contents-wrap">
     <div class="contents-width">
	   <div class="contents-inner">
	   
	     <!--고객센터 -->
	   	  <div class="page-title-wrap mypage">
	      	<h2 class="text-head1 text-left">고객센터</h2>
	      </div>
	      
	      <!-- 고객센터 밑 화면 -->
	      <div class="contents-inner contents-aside customer-wrap">
	      	<!-- 왼쪽 선택창 -->
	      	<div class="aside-wrap">
	         <ol class="customer-lnb">
	            <li class="customer-lnb-item eng"><a href="#" class="active">공지사항</a></li>
	            <li class="customer-lnb-item"><a href="memberFaqView.jsp">FAQ</a></li>
	         </ol>
	        </div>
	     	
	      <!-- 중앙 화면 -->
	      <div class="aside-contents" align="center">
	      		<h3 class="text-head2 eng">공지사항</h3>
	      
	      		<!-- 공지사항 채워넣기 -->
	      		<div class="tab-wrap anchor-tab multi-line" id="tabDiv">
					<table>
						<tr>
							<td><a href="noticeWriteForm.do">글 쓰기</a></td>
						</tr>
					</table>
					<table>
						<tr>
							<th>번호</th><th>제목</th><th>작성일</th>
						</tr>
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


				</div>

	            <!-- <span id="contents"></span> -->
	            
	            <!-- 질문 목록 띄워주기 -->
	            <div class="border-line-box fold-box-list-wrap">
	            	<div id="contents" class="fold-box-list faq-list"></div>
	            </div>
	      </div>      
	   </div>
	</div>
	   </div>
	</div>
   <div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div><!-- footer -->   

</body>
</html>