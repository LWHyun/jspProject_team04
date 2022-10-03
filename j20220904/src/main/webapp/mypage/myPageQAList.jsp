<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="border-line-box fold-box-list-wrap">
	<!-- // 찜한 상품이 있을 때 없을 때 display:none 처리는 myPage.jsp에 있는 jquery 의 영향을 받고있음 -->
    <div class="mypage-no-data has-line-bottom" style="display:none;" >
        <div class="flex-box">
            <p class="no-data-text">작성된 상품Q&amp;A가 없습니다.</p>
        </div>
    </div><!-- has-line-bottom -->
			
	<ul class="fold-box-list qna-list" data-type="single" id="inquiry-list" style="">
		<li class="fold-box">
			<div class="fold-box-header">
				<div class="question-title"></div>
				<div class="question-info">
					<span class="question-type"></span>
					<span class="question-date">2022.08.23</span>
					<span class="answer-status complete">답변완료 </span>
				</div>
			</div>
			<div class="fold-box-contents">
				<div class="question-box-detail">
					<div class="question-desc"></div>
				</div>

				<div class="answer-box">
					<p class="desc"></p>
				</div>
			</div>
		</li>
	</ul>
</div>