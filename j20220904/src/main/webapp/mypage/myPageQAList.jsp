<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<style>
/* has-line-bottom 찜한 상품 없습니다 */
.qa-mypage-no-data.has-line {
    border-bottom: 1px solid #d5d5d5;
}

.qa-mypage-no-data .flex-box{
    height: 500px;
}
.flex-box {
    display: flex;
    justify-content: space-around;
    flex-direction: column;
    align-content: space-around;
    align-items: center;
    flex-wrap: nowrap;
}
.qa-mypage-no-data .flex-box .no-data-text {
    padding-top: 107px;
    background: url(https://abcmart.a-rt.com/static/images/common/common_icon_error.png) no-repeat center top;
    font-size: 20px;
    letter-spacing: -1px;
    font-weight: 800;
}
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
    padding: 0 90px 50px 120px;
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
<input type="hidden" name="curPage" id="curPage" value="${requestScope.curPage }">
<div class="border-header">
	내가 쓴 글(${requestScope.QACnt })
</div>
<div class="border-line-box fold-box-list-wrap">	
	<div class="qa-mypage-no-data has-line" style="display:none;">
        <div class="flex-box">
            <p class="no-data-text">작성된 Q&A가 없습니다.</p>
        </div>
    </div>

	<ul class="fold-box-list qna-list" data-type="single" id="inquiry-list" style="">
		<%-- <c:forEach var="QAList" items="${list }" >
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
		</c:forEach> --%>
	</ul>
	
</div>

<!-- QA가 있을 때만 표기 -->
    <c:if test="${requestScope.QACnt > 0 }">
	    <!-- 페이징 처리부분 -->
	    <div id="mypage-product-interest-pagination" class="pagination-wrap">
	    	<div>	
	    		<ol class="pagination-list">
	    			<%-- <c:if test="${ph.showPrev == true }">		
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
	    			</c:if> --%>
   				</ol>
			</div>
		</div>
    </c:if>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>    
<script>
function boardPaging(pagingNumber) {
	// 이미 존재하는 li 삭제
	$('.fold-box-list.qna-list li').remove();
	
	/* ajax - json */
	$.ajax({
		url : '${pageContext.request.contextPath}/mypage/jsonQAList.do',
		type : 'post',
		data : 'curPage='+pagingNumber,
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items) {
				console.log(index, items.q_id, items.mem_id, items.product_id, items.kor_name, items.gender, 
						items.q_passwd, items.q_title, items.q_content, items.q_date, items.q_views, items.q_answer);
				
				// ul 태그
				$('.fold-box-list.qna-list').append($('<li/>', {
					class : 'fold-box'
											}).append($('<div/>', {
												class : 'fold-box-header'
												}).append($('<div/>', {
													class : 'question-title',
													html : items.q_title+'&emsp;&emsp;&emsp;'
													}).append($('<a/>', {
														id : 'barogagi',
														href : '${pageContext.request.contextPath }/contents/contents_men.do?product_id='+items.product_id+'&gender='+items.gender,
														html : 	'('+items.kor_name+')로 가기'	
													}))
												 ).append($('<div/>', {
													 class : 'question-info'
													 }).append($('<span/>', {
														class : 'question-type', 
														html : items.mem_id
													 })).append($('<span/>', {
														 class : 'question-date',
														 html : items.q_date
													 })).append($('<span/>', {
															 class : (items.q_answer != null ? 'answer-status complete' : 'answer-status'),
															 html : (items.q_answer != null ? '답변완료' : '미답변')
													 }))
												 )
											).append($('<div/>', {
												class : 'fold-box-contents'
												}).append($('<div/>', {
													class : 'question-box-detail'
													}).append($('<div/>', {
														class : 'question-desc',
														style : 'word-break : break-all;',
														html : items.q_content
													}))
												).append($('<div/>', {
													class : 'answer-box'
													}).append($('<p/>', {
														class : 'desc',
														style : 'word-break : break-all;',
														html : items.q_answer
													})))
							)// li의 append
				)// ul 의 append
			});//$.each
			
			// 이미 존재하는 페이징 삭제
			$('.pagination-list li').remove();
			
			// 페이징 처리
			if(data.ph.showPrev == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showPrev'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.startPage-1)+')',	
											text : '<'
										})))
			}
			
			for(let i = Number(data.ph.startPage); i <= Number(data.ph.endPage); i++) {
				if(data.curPage == i) {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num selected',
												text : i
											}))))
				} else {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num',
												text : i
											}))))
				}
			} // for 문
			
			if(data.ph.showNext == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showNext'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.endPage+1)+')',
											text : '>'
										})))
			}
		},
		error : function(err) {
			console.log(err);
		}
	});
}
$(function() {
	// QA 리스트가 있을 때 없을 때 display:none 처리
	var qalistCnt = Number(${requestScope.QACnt});
	console.log(qalistCnt);
	if(qalistCnt == 0) {
		$('.qa-mypage-no-data').css('display', '');
		$('.qna-list').css('display', 'none');
		console.log('0이다');
	} else {
		$('.qa-mypage-no-data').css('display', 'none');
		$('.qna-list').css('display', '');
		console.log('0보다 크다');
	} 
	/* ajax - json */
	$.ajax({
		url : '${pageContext.request.contextPath}/mypage/jsonQAList.do',
		type : 'post',
		data : 'curPage='+$('#curPage').val(),
		dataType : 'json',
		success : function(data) {
			//alert(JSON.stringify(data));
			
			$.each(data.list, function(index, items) {
				console.log(index, items.q_id, items.mem_id, items.product_id, items.kor_name, items.gender, 
						items.q_passwd, items.q_title, items.q_content, items.q_date, items.q_views, items.q_answer);
				
				// ul 태그
				$('.fold-box-list.qna-list').append($('<li/>', {
					class : 'fold-box'
											}).append($('<div/>', {
												class : 'fold-box-header'
												}).append($('<div/>', {
													class : 'question-title',
													html : items.q_title+'&emsp;&emsp;&emsp;'
													}).append($('<a/>', {
														id : 'barogagi',
														href : '${pageContext.request.contextPath }/contents/contents_men.do?product_id='+items.product_id+'&gender='+items.gender,
														html : 	'('+items.kor_name+')로 가기'	
													}))
												 ).append($('<div/>', {
													 class : 'question-info'
													 }).append($('<span/>', {
														class : 'question-type', 
														html : items.mem_id
													 })).append($('<span/>', {
														 class : 'question-date',
														 html : items.q_date
													 })).append($('<span/>', {
															 class : (items.q_answer != null ? 'answer-status complete' : 'answer-status'),
															 html : (items.q_answer != null ? '답변완료' : '미답변')
													 }))
												 )
											).append($('<div/>', {
												class : 'fold-box-contents'
												}).append($('<div/>', {
													class : 'question-box-detail'
													}).append($('<div/>', {
														class : 'question-desc',
														style : 'word-break : break-all;',
														html : items.q_content
													}))
												).append($('<div/>', {
													class : 'answer-box'
													}).append($('<p/>', {
														class : 'desc',
														style : 'word-break : break-all;',
														html : items.q_answer
													})))
							)// li의 append
				)// ul 의 append
			});//$.each
			
			// 페이징 처리
			if(data.ph.showPrev == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showPrev'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.startPage-1)+')',	
											text : '<'
										})))
			}
			
			for(let i = Number(data.ph.startPage); i <= Number(data.ph.endPage); i++) {
				if(data.curPage == i) {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num selected',
												text : i
											}))))
				} else {
					$('.pagination-list').append($('<li/>', {
						class : 'pagination-item',
						name : 'li_page'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+i+')'
											}).append($('<button/>', {
												type : 'button',
												class : 'btn-page btn-page-num',
												text : i
											}))))
				}
			} // for 문
			
			if(data.ph.showNext == 'true') {
				/* ol 부분 */
				$('.pagination-list').append($('<li/>', {
					class : 'pagination-item showNext'
										}).append($('<span/>', {
											//href : '#',
											onclick : 'boardPaging('+(data.ph.endPage+1)+')',
											text : '>'
										})))
			}
		},
		error : function(err) {
			console.log(err);
		}
	});
});

//fold-box 접었다 폈다
$(document).on('click', '.fold-box', function() {
	// 해당 element 가 있는지 length를 통해 판단 (답변완료 / 미답변 존재 유무)
	console.log();
	/* if($(this).find('.answer-status').text() == '답변완료') {  */
		if(!$(this).hasClass('expanded')) {
			$(this).addClass('expanded');
		} else {
			$(this).removeClass('expanded');
		}
	/* } */
});
</script>