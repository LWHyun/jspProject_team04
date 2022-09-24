<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memIdFindResult.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>
	
    <div id="memIdFindResult-wrap">
        <div id="memIdFindResult-inner-contents">
            <div class="memIdFindResult-container">
                <!-- 아이디 찾기 결과 헤더 -->
                <div class="page-title-wrap">
                    <h2 class="text-head1">아이디 찾기</h2>
                </div><!-- page-title-wrap 아이디 찾기 결과 헤더-->

                <!-- 아이디 찾기 결과 -->
                <div class="FindResult-contents">
                    <!-- 아이디 표시 창 -->
                    <div class="contents-flex">
                        <div class="dialog-contents-inner">
                            <span class="icon-pictogram success"></span>
                            <p class="pictogram-text size-2">회원님의 정보와 일치하는 아이디입니다.</p>
                            <div class="find-id-result-box">
                                <div class="find-id-result-box-inner">
                                    
                                    <div class="rdo-list-item">
                                        <span class="ui-rdo">
                                            <input id="rdoList0" name="rdoList" type="radio" value="candy900">
                                            <label for="rdoList0">
                                                candy900
                                            </label>
                                        </span>
                                        
                                        <span class="rdo-option"><span class="join-info">2022년09월11일 17:42:26 가입</span></span>
                                    </div><!-- rdo-list-item -->
                                </div><!-- find-id-result-box-inner -->
                            </div><!-- find-id-result-box -->

                            <div class="btn-wrap">
                                <a href="#" id="popLoginBtn" class="btn-login-pwdFind">로그인</a>
                                <a href="#" id="popPwSearchBtn" class="btn-login-pwdFind btn-line">비밀번호 찾기</a>
                            </div>

                        </div><!-- dialog-contents-inner -->
                    </div><!-- contents-flex -->

                    <!-- 로그인 / 비밀번호 찾기 버튼 -->
                    <div class="btn-wrap">

                    </div>
                </div><!-- FindResult-contents -->
            </div><!-- memIdFindResult-container -->
        </div><!-- memIdFindResult-inner-contents -->
    </div><!-- memIdFindResult-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
</body>
</html>