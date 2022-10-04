<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* 내가 쓴 글 */
.border-header {
	font-size: 22px;
    font-weight: 500;
    height: 55px;
    line-height : 55px;
    color: #000;
}
/* fold-box expanded */
.fold-box-list .fold-box.expanded {
    border-bottom-color: #b5b5b5;
}
.fold-box-list.qna-list .fold-box.expanded .fold-box-contents {
    position: relative;
    padding: 0;
}
.fold-box-list .fold-box.expanded>.fold-box-contents {
    height: auto;
    padding-top: 23px;
    padding-bottom: 23px;
}
/* fold-box expanded 사용자 질문 부분 */
.fold-box-list.qna-list .fold-box.expanded .fold-box-contents .question-box-detail {
    padding: 29px 20px 35px;
}
/* fold-box expanded answer 부분 */
.fold-box-list.qna-list .fold-box.expanded .fold-box-contents .question-box-detail+.answer-box {
    padding-top: 31px;
    padding-left: 30px;
}
.fold-box.expanded .fold-box-contents .answer-box {
    padding: 0 90px 36px 120px;
    background-color: #f8f8f8;
}
.fold-box.expanded .fold-box-contents .answer-box .desc {
    position: relative;
    padding-left: 35px;
    font-size: 15px;
    letter-spacing: -.75px;
    line-height: 24px;
    color: #333;
    word-break: keep-all;
}
/* answer A 마크 */
.fold-box-list.qna-list .fold-box.expanded .fold-box-contents .answer-box .desc:before {
    content: '';
    position: absolute;
    display: inline-block;
    width: 26px;
    height: 26px;
    background: url(https://abcmart.a-rt.com/static/images/mypage/mypage_icon_faq.png) no-repeat -26px 0;
    left: 0;
    top: 0;
}
/* fold-box  */
.fold-box-list .fold-box {
    border-bottom: 1px solid #d5d5d5;
}
/* fold-box fold-box-header */
.fold-box-list.qna-list .fold-box .fold-box-header {
	display : flex;
	align-items: center;
	padding: 25px 0 25px 20px;
    line-height: 1.4;
    border-bottom: 1px solid #e5e5e5;
    position: relative;
    cursor: pointer;
    font-size: 15px;
}
/* fold-box title */
.fold-box-list.qna-list .fold-box .fold-box-header .question-title {
    -webkit-box-flex: 1;
    -ms-flex: 1;
    flex: 1;
    display: inline-block;
    font-size: 15px;
    letter-spacing: -.75px;
}
/* fold-box question-type */
.fold-box-list.qna-list .fold-box .fold-box-header .question-title+.question-info .question-type {
    width: 240px;
}
/* fold-box question-date */
.fold-box-list.qna-list .fold-box .fold-box-header .question-info .question-date {
    width: 124px;
    margin-top: 1px;
    font-family: "Montserrat",sans-serif;
    letter-spacing: 0;
}
/* fold-box answer-status */
.fold-box-list.qna-list .fold-box .fold-box-header .question-info .answer-status {
    width: 90px;
    font-weight: 500;
}
/* fold-box answer-status.complete */
.fold-box-list.qna-list .fold-box .fold-box-header .question-info .answer-status.complete {
    color: #ee1c25;
}
/* question-info 내용물들 전체 적용 css */
.fold-box-list.qna-list .fold-box .fold-box-header .question-info .question-type, .fold-box-list.qna-list .fold-box .fold-box-header .question-info .question-date, 
.fold-box-list.qna-list .fold-box .fold-box-header .question-info .answer-status, .fold-box-list.qna-list .fold-box .fold-box-header .question-title a{
    display: inline-block;
    font-size: 14px;
    letter-spacing: -.7px;
    color: #666;
    text-align: center;
    vertical-align: top;
}

/* fold-box-contents */
.fold-box-list .fold-box .fold-box-contents {
    height: 0;
    overflow: hidden;
}
.fold-box-list .fold-box .fold-box-header, .fold-box-list .fold-box .fold-box-contents {
    padding: 0 20px;
}

/* 페이지 네비게이션 css */
.pagination-wrap {
	/* margin-top: 30px; */
    padding-top: 40px;
    /* border-top: 1px solid #b5b5b5; */
    position: relative;
    text-align: center;
}	
.pagination-wrap .pagination-list {
    display: inline-block;
}
.pagination-wrap .pagination-list .pagination-item {
    float: left;
}
.pagination-wrap .pagination-list .pagination-item+.pagination-item {
    margin-left: 4px;
}
/* 선택 안된 페이지 */
.pagination-wrap .pagination-list .btn-page {
    color: #999;
    width: 26px;
    height: 26px;
    text-align: center;
    font-family: "Montserrat",sans-serif;
    font-size: 13px;
}
/* 선택된 페이지 */
.pagination-wrap .pagination-list .btn-page.selected {
    color: #fff;
    background: #111;
}
/* 이전 다음 */
.pagination-item.showPrev {
	position:relative; top:3px;
	cursor:pointer;
	margin-right: 10px;
}
.pagination-wrap .pagination-list .pagination-item+.pagination-item.showNext {
	position:relative; top:3px;
	margin-left: 10px;
	cursor:pointer;
}
</style>

<div class="border-header">
	내가 쓴 글(${ph.totalCnt })
</div>
<div class="border-line-box fold-box-list-wrap">
	<!-- // 찜한 상품이 있을 때 없을 때 display:none 처리는 myPage.jsp에 있는 jquery 의 영향을 받고있음 -->
    <div class="mypage-no-data has-line-bottom" style="display:none;" >
        <div class="flex-box">
            <p class="no-data-text">작성된 상품Q&amp;A가 없습니다.</p>
        </div>
    </div><!-- has-line-bottom -->
	
	<ul class="fold-box-list qna-list" data-type="single" id="inquiry-list" style="">
		<c:forEach var="QAList" items="${list }" >
			<li class="fold-box">
				<div class="fold-box-header">
					<div class="question-title">${QAList.q_title }&emsp;&emsp;&emsp;<a id="barogagi" href="${pageContext.request.contextPath }/contents/contents_men.do?product_id=${QAList.product_id}&gender=${QAList.gender}">(${QAList.kor_name })로 가기</a></div>
					<div class="question-info">
						<span class="question-type">${QAList.mem_id }</span>
						<span class="question-date"><fmt:formatDate value="${QAList.q_date }" pattern="yyyy.MM.dd"/></span>
						<c:if test="${empty QAList.q_answer}">
							<span class="answer-status">미답변</span>
						</c:if>
						<c:if test="${not empty QAList.q_answer}">
							<span class="answer-status complete">답변완료</span>
						</c:if>
					</div>
				</div>
				<div class="fold-box-contents">
					<div class="question-box-detail">
						<div class="question-desc">${QAList.q_content }</div>
					</div>
	
					<div class="answer-box">
						<p class="desc">${QAList.q_answer }</p>
					</div>
				</div>
			</li>
		</c:forEach>
	</ul>
</div>

<!-- 찜한 상품이 있을 때만 표기 -->
    <c:if test="${ph.totalCnt > 0 }">
	    <!-- 페이징 처리부분 -->
	    <div id="mypage-product-interest-pagination" class="pagination-wrap">
	    	<div>	
	    		<ol class="pagination-list">
	    			<c:if test="${ph.showPrev == true }">		
		    			<li class="pagination-item showPrev">
		    				<a href="${pageContext.request.contextPath }/mypage/QAList.do?curPage=${ph.startPage-1}">&lt;</a>
		    			</li>
	    			</c:if>
	    			
	    			<c:forEach var="i" begin="${ph.startPage }" end="${ph.endPage }">
	    				<c:if test="${requestScope.curPage == i}">
			    			<li class="pagination-item" name="li_page">			
			    				<a href="${pageContext.request.contextPath }/mypage/QAList.do?curPage=${i }">
			    				<button type="button" class="btn-page btn-page-num selected">${i }</button>		
			    				</a>
		    				</li>	
	    				</c:if>
	    				<c:if test="${requestScope.curPage != i}">
			    			<li class="pagination-item" name="li_page">	
			    				<a href="${pageContext.request.contextPath }/mypage/QAList.do?curPage=${i }">		
			    				<button type="button" class="btn-page btn-page-num">${i }</button>		
			    				</a>
		    				</li>
	    				</c:if>
	    			</c:forEach>	
    				
    				<c:if test="${ph.showNext == true}">
	    				<li class="pagination-item showNext">
		    				<a href="${pageContext.request.contextPath }/mypage/QAList.do?curPage=${ph.endPage+1}">&gt;</a>
		    			</li>	
	    			</c:if>
   				</ol>
			</div>
		</div>
    </c:if>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>    
<script>
$(function() {
	// fold-box 접었다 폈다
	$('.fold-box').click(function() {
		// 해당 element 가 있는지 length를 통해 판단 (답변완료 / 미답변 존재 유무)
		if($('.answer-status.complete').length) { 
			if(!$(this).hasClass('expanded')) {
				$(this).addClass('expanded');
			} else {
				$(this).removeClass('expanded');
			}
		}
	});
});
</script>