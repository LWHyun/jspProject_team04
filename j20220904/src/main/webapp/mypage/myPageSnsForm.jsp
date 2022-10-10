<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
/* sns-login-form */
.tbl-form-wrap.form-view {
    padding: 23px 0;
}
.tbl-form-wrap.sns-login-form {
    padding: 40px 10px 40px 30px;
}	
.tbl-form-wrap {
    padding: 50px 20px 63px;
}
.gray-box {
    background: #f8f8f8;
}
/* table */
table {
    width: 100%;
    border-collapse: collapse;
    border-spacing: 0;
    table-layout: fixed;
}
caption, legend {
    width: 0;
    height: 0;
    font-size: 1px;
    text-indent: -9999rem;
    line-height: 0;
    margin: 0;
    padding: 0;
    border: 0;
}
/* th */
.tbl-form-wrap .tbl-form tr th, .tbl-form-wrap .tbl-form tr td {
    height: 50px;
    text-align: left;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
    font-size: 15px;
}
.tbl-form-wrap .tbl-form tr th {
    color: #333;
    font-weight: 600;
    padding: 11px 0;
    vertical-align: top;
}
.tbl-form-wrap.form-view .tbl-form tbody tr th {
    padding: 17px 0 17px 20px;
}
.tbl-form-wrap.sns-login-form .tbl-form tbody tr th {
    height: auto;
    padding: 16px 0 0 0;
}
/* td */
.tbl-form-wrap .tbl-form tr td {
    color: #666;
}
.tbl-form-wrap.form-view .tbl-form tbody tr td {
    color: #000;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
}
.tbl-form-wrap.sns-login-form .tbl-form tbody tr td {
    height: auto;
    padding: 0;
}
.tbl-form-wrap.form-view .tbl-form tr td:last-child {
    padding-right: 20px;
}
/* .sns-join-btn-wrap */
.tbl-form-wrap.sns-login-form .tbl-form tbody tr td .sns-join-btn-wrap {
    margin-top: 0;
}
.sns-join-btn-wrap {
    margin-top: 20px;
}
/* ul */
.tbl-form-wrap.sns-login-form .tbl-form tbody tr td .sns-join-btn-wrap ul {
    overflow: hidden;
    width: 100%;
    text-align: center;
}
/* button */
.sns-join-btn-wrap .btn-sns {
    width: 220px;
    height: 44px;
    background: #fff;
    border: 1px solid #d5d5d5;
    line-height: 42px;
    font-size: 14px;
    letter-spacing: -.7px;
}
.sns-join-btn-wrap .btn-sns i {
    margin-right: 10px;
    vertical-align: text-top;
}
.icon-facebook, .icon-naver, .icon-kakao, .icon-twitter, .icon-naver-band, .icon-kakao-story, .icon-naver-line {
    display: inline-block;
    width: 20px;
    height: 20px;
    background: url(https://abcmart.a-rt.com/static/images/ui/button/btn_icon_sns.png) no-repeat 0 0;
    vertical-align: top;
}
.icon-naver {
    background-position: -9px 0;
}
.sns-join-btn-wrap .btn-sns+.btn-sns {
    margin-left: 10px;
}
.icon-facebook {
    width: 9px;
}
.icon-kakao {
    background-position: -29px 0;
}
/* 안내 ul */
.border-line-box+.bullet-text-list {
    margin-top: 14px;
}
/* 안내 li */
.bullet-text, .line-text, .text-only, .ref-text, .star-text {
    position: relative;
    display: inline-block;
    color: #666;
    line-height: 22px;
    font-family: "Montserrat","Noto Sans KR",sans-serif;
}
.bullet-text, .line-text, .ref-text, .star-text {
    padding-left: 10px;
}
.bullet-text {
    font-size: 13px;
    letter-spacing: -.325px;
}
li.bullet-text, li.line-text {
    display: list-item;
}
.bullet-text-list li, .line-text-list li {
    color: #666;
}
.bullet-text-list li {
    line-height: 22px;
}
.bullet-text-list .bullet-text {
    text-align: left;
}
.bullet-text-list li:not(.text-only), .line-text-list li:not(.text-only) {
    padding-left: 10px;
}
.bullet-text-list.color-lg li, .line-text-list.color-lg li {
    color: #999;
}
/* 안내 before */
.bullet-text:before, .line-text:before, .text-only:before, .ref-text:before, .star-text:before {
    content: '';
    position: absolute;
    display: inline-block;
}
.bullet-text:before {
    width: 2px;
    height: 2px;
    left: 2px;
    top: 10px;
    background: #999;
}
.bullet-text-list .bullet-text:before, .line-text-list .bullet-text:before {
    top: 10px;
}
</style>

<div class="border-line-box-header"><span class="text-head2">SNS 연결설정</span></div>

<div class="border-line-box gray-box tbl-form-wrap form-view sns-login-form">
	<table class="tbl-form">
		<caption>SNS 연결설정 테이블로 SNS 간편 로그인 연결을(를) 나타낸 표입니다.</caption>
		<colgroup>
			<col style="width: 170px;">
			<col>
		</colgroup>
		<tbody>
			<tr>
				<th scope="row">SNS 간편 로그인 연결</th>
				<td>
					<div class="sns-join-btn-wrap">
						<ul>
							<button type="button" class="btn-sns" id="sns_10000" data-connect="N">
										<i class="icon-naver"></i>네이버 아이디로 연결
							</button>
							<!-- <button type="button" class="btn-sns" id="sns_10001" data-connect="N">
										<i class="icon-facebook"></i>페이스북 아이디로 연결
							</button> -->
							<button type="button" class="btn-sns" id="sns_10002" data-connect="N">
										<i class="icon-kakao"></i>카카오 아이디로 연결
							</button>
						</ul>
					</div>
				</td>
			</tr>
		</tbody>
	</table>
</div><!-- sns-login-form -->

<ul class="bullet-text-list color-lg">
	<li class="bullet-text">카카오, 네이버 계정과 연동하여 간편하게 로그인 할 수 있는 기능을 설정/해제 하실 수 있습니다.</li>
	<li class="bullet-text">로그인 연결 해제는 단순히 SNS 로그인 기능만을 해제 하는 것이며, 회원탈퇴가 되는 것은 아닙니다.</li>
</ul>





