<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/manageCss/faq.css">
<style type="text/css">
.border-line-box-header+.border-line-box, .border-line-box-header+.mypage-detail-info-box, .border-line-box-header+.mypage-complete-wrap {
    margin-top: 16px;
}
.border-line-box {
    border-top: 2px solid #000;
    border-bottom: 1px solid #b5b5b5;
    margin-top : 54px;
}

body {
    width: 100%;
    color: #000;
    background-color: #fff;
    line-height: 1;
}
.board-view-wrap .board-view-head {
    height: 73px;
    padding: 0 21px 0 19px;
    border-bottom: 1px solid #e5e5e5;
    -webkit-box-align: center;
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-align-items: center;
    -ms-flex-align: center;
    align-items: center;
}

.board-view-wrap .board-view-head .view-tit {
    color: #000;
    font-size: 20px;
    letter-spacing: -1px;
}

.board-view-wrap .board-view-head .text-date {
    color: #666;
    margin-left: 300px;
    font-family: "Montserrat",sans-serif;
    font-size: 15px;
    line-height: 19px;
}
.board-view-wrap .board-view-cont {
    padding: 40px 20px 50px 20px;
    font-size: 15px;
    letter-spacing: -.75px;
    line-height: 24px;
}

.board-view-wrap .board-view-btm .tbl-wrap.tbl-col {
    border-top: 1px solid #b5b5b5;
}
.tbl-wrap.tbl-col {
    text-align: center;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
}
table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
}
.board-view-wrap .board-view-btm .tbl-wrap.tbl-col.notice-list table tbody {
    border-bottom: none;
}
.tbl-col.notice-list table tbody {
    border-color: #d5d5d5;
}
.board-view-wrap .board-view-btm .tbl-wrap.tbl-col td .ico-next {
    border-bottom: 5px solid #000;
}
.board-view-wrap .board-view-btm .tbl-wrap.tbl-col td [class^='ico-'] {
    display: inline-block;
    width: 0;
    height: 0;
    border-left: 5px solid transparent;
    border-right: 5px solid transparent;
    vertical-align: 4px;
}
.tbl-wrap.tbl-col table tbody tr:first-child td {
    border-top: none;
}
.tbl-col.notice-list table tbody tr td {
    padding: 19px 10px 16px;
}
.board-view-wrap .board-view-btm .tbl-wrap.tbl-col td.text-left {
    padding-left: 0;
}
.tbl-wrap.tbl-col table tbody tr:first-child td {
    border-top: none;
}
.tbl-col.notice-list table tbody tr td {
    padding: 19px 10px 16px;
}
.tbl-col.notice-list table tbody tr td a.notice-link {
    display: inline-block;
    max-width: 100%;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis;
    height: auto;
    max-height: none;
}
a, a:active, a:focus, a:hover, a:link, a:visited {
    text-decoration: none;
}
.tbl-col.notice-list table tbody tr td.date-txt {
    font-family: "Montserrat",sans-serif;
    font-size: 15px;
    color: #666;
}

<!---->
.aside-contents {
    margin-top: -140px;
    width: calc(81% - 174px);
	transform: translateY(-1px);
}
</style>
<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
</head>
<body>
   <div id="header">
       <jsp:include page="../main/header.jsp"></jsp:include>
    </div><!-- header -->

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
	            <li class="customer-lnb-item eng"><a href="${pageContext.request.contextPath }/manage/memNoticeList.do" class="active">공지사항</a></li>
	            <li class="customer-lnb-item"><a href="memFaqView.jsp">FAQ</a></li>
	         </ol>
	        </div>
	     	
	      <!-- 중앙 화면 -->
	      <div class="aside-contents" align="center">
	      		<h3 class="text-head2 eng">공지사항</h3>
	      
	      		<div class="board-view-wrap border-line-box">
	      			<div class="flex-box board-view-head">
	      				<span class="view-tit">${notice.notice_title}</span>
	      				<span class="text-date">${notice.notice_date}</span>
	      			</div>
	      			
	      			<!-- 이전 글 / 다음 글 -->
	      			<div class="board-view-cont"><pre>${notice.notice_content}</pre></div>
			      	<div class="board-view-btm">
			      		<div class="tbl-wrap tbl-col notice-list">
			      			<table>
			      				<colgroup>
			      					<col style="width: 44px;">
			      					<col>
			      					<col style="width: 112px;">
			      				</colgroup>
			      				
			      				<tbody>
		      						<!-- 다음글 -->
			      					<tr>
			      						<td>
			      							다음 | 
			      						</td>
			      						<td class="text-left">
			      							<a href="memNoticeContent.do?notice_code=${notice.notice_code+1}&pageNum=${pageNum}">
			      							${noticeBA.notice_title_after }</a>
			      						</td>
			      						<td class="date-txt">${noticeBA.notice_date_after }</td>
			      					</tr>
			      					
			      					<!-- 이전글 -->
			      					<tr>
			      						<td>
			      							이전 |
			      						</td>
			      						<td class="text-left">
			      							<a href="memNoticeContent.do?notice_code=${notice.notice_code-1}&pageNum=${pageNum}">
											${noticeBA.notice_title_before }</a>
			      						</td>
			      						<td class="date-txt">${noticeBA.notice_date_before }</td>
			      					</tr>
			      				</tbody>
			      			</table>
			      		</div>
			      	</div>	
	      		</div>
	      		
	      		<!-- 목록 -->
	      		<div style="margin-top:50px; margin-left:350px;">
			    	<input type="button" value="목록"
			    	onclick="location.href='memNoticeList.do?pageNum=${pageNum}'">
	      		</div>
	      </div>      
	   </div>
	</div>
	   </div>
	</div>
	
   <!-- footer -->
   <div id="footer">
        <jsp:include page="../main/footer.jsp"></jsp:include>
    </div>

</body>
</html>